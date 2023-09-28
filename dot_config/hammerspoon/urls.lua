-- TODO:
-- * Incorporate manual chooser on Opt+Click like https://github.com/sryo/Spoons/blob/2606ff376ea9981d62405d4c0e31a46127d0d126/Linkmaster.lua
-- * Make chooser fancy like https://github.com/Hammerspoon/hammerspoon/issues/257#issuecomment-137556042 ?
-- * Maybe move to https://www.hammerspoon.org/Spoons/URLDispatcher.html
-- * Look into https://github.com/johnste/finicky (and in particular, the examples in the Wiki to see if there's anything I should adopt)


local handlers = {
    safari = 'com.apple.Safari', -- default for all http/https
    chrome= 'com.google.Chrome', -- any domains that need to be opened in chrome (hashpack, for example)
    zoom = 'us.zoom.xos',
    notion = 'notion.id',
    slack = 'com.tinyspeck.slackmacgap',
    -- discord -- all discord.com links that look like chat invites or message/channel/server links
}

local urlMap = {
    { regex = '^https://(.*)hashpack.app/', handler = handlers.chrome },
    { regex = '^https://[%a%d%u.]*zoom%.us/[jw]/', handler = handlers.zoom },
    { regex = '^https://(.*)notion.so/', handler = handlers.notion },
    { regex = '^https://(.*).slack.com/archives/(.*)', handler = handlers.slack },
    { regex = '.*', handler = handlers.safari },
}

local function stringStartsWith(str, beginning)
    return string.sub(str, 1, string.len(beginning)) == beginning
end

local function stringRemovePrefix(str, beginning)
    if stringStartsWith(str, beginning) then return string.sub(str, string.len(beginning) + 1) end
    return str
end

function urlHandler(_, _, params, fullURL)
    if not fullURL then
        print('Attempted to open browser without URL')
        return
    end

    url = prepareURL(fullURL, params)
    openerBundle = findOpenerBundle(fullURL)

    hs.urlevent.openURLWithBundle(fullURL, openerBundle)
end

function prepareURL(fullURL, params)
    -- Bypass Google's URL redirector.
    if stringStartsWith(fullURL, 'https://www.google.com/url?q=') then
        fullURL = params.q
    end

    -- Bypass Slack's URL redirector.
    if stringStartsWith(fullURL, 'https://slack-redir.net/link?url=') then
        fullURL = params.url
    end

    -- Open all URLs with https by default.
    if stringStartsWith(fullURL, 'http://') then
        fullURL = stringRemovePrefix(fullURL, 'http://')
        fullURL = 'https://' .. fullURL
    end

    return fullURL
end

function findOpenerBundle(fullURL)
    browser = hs.fnutils.find(urlMap, function(v)
        return string.match(fullURL, v.regex)
    end)

    return browser.handler
end

-- Even though only http is specified here, https will also be handled.
hs.urlevent.setDefaultHandler('http')
hs.urlevent.httpCallback = urlHandler

--
-- Test functions -- run `testUrlHandling()` in the Hammerspoon console to run all tests.
--
function testUrlHandling()
    print('Testing URL preparation...')
    testUrlPreparation()
    print('---')
    print('Testing URL handler selection...')
    testUrlHandlerSelection()
end

function testUrlPreparation()
    local tests = {
        {"https://www.google.com/url?q=https://duckduckgo.com", {q = 'https://duckduckgo.com'}, "https://duckduckgo.com"},
        {"https://slack-redir.net/link?url=https://duckduckgo.com", {url = 'https://duckduckgo.com' }, "https://duckduckgo.com"},
        {"http://www.duckduckgo.com", {}, "https://www.duckduckgo.com"},
        {"https://www.duckduckgo.com", {}, "https://www.duckduckgo.com"},
    }

    for _, test in ipairs(tests) do
        local actual = prepareURL(test[1], test[2])
        local expected = test[3]

        if actual ~= expected then
            print('Test failed: ' .. test[1])
            print('Expected: ' .. expected)
            print('Actual: ' .. actual)
        else
            print('Test passed: ' .. test[1])
        end
    end
end

function testUrlHandlerSelection()
    local tests = {
        -- Hashpack has to be used in Chrome for WebUSB support.
        {"https://hashpack.app/", handlers.chrome},
        -- Link to some Notion page.
        {"https://www.notion.so/someorg/somepage", handlers.notion},
        -- TODO: Exclude the notion marketing site from the notion handler.
        -- {"https://www.notion.so/desktop", handlers.safari},
        -- Channel link
        {"https://someorg.slack.com/archives/XXXXXXXXXXX", handlers.slack},
        -- Message link
        {"https://someorg.slack.com/archives/XXXXXXXXXXX/p1234512345123456", handlers.slack},
        -- Generic/fallback
        {"https://www.duckduckgo.com/foo/bar/baz", handlers.safari},
    }

    for _, test in ipairs(tests) do
        local actual = findOpenerBundle(test[1])
        local expected = test[2]

        if actual ~= expected then
            print('Test failed: ' .. test[1])
            print('Expected: ' .. expected)
            print('Actual: ' .. actual)
        else
            print('Test passed: ' .. test[1])
        end
    end

end
