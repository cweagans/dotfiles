
local inboxCount = 0;
local mailMenuBar = hs.menubar.new()

function countInboxMessages()
    local output, status, type, rc = hs.execute('osascript -e \'tell Application "Mail"\' -e \'unread count of inbox\' -e \'end tell\'')
    return tonumber(output)
end

function updateMenuBar()
    inboxCount = countInboxMessages()

    local title = ''
    if inboxCount > 0 then
        title = title .. '📬 ' .. inboxCount
    end

    mailMenuBar:setTitle(title)
end

mailMenuBar:setClickCallback(updateMenuBar)
updateMenuBar()
