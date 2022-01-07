
local mailPath = "~/Mail"
local inboxPaths = mailPath .. '/*/Inbox/{new,cur}/'
local outboxPath = mailPath .. "/Outbox"

local outboxCount = 0;
local inboxCount = 0;
local mailMenuBar = hs.menubar.new()

function countInboxMessages()
    local output, status, type, rc = hs.execute('find ' .. inboxPaths ..  ' -type f | wc -l | xargs')
    return tonumber(output)
end

function countOutboxMessages()
    local output, status, type, rc = hs.execute('find ' .. outboxPath .. ' -type d | wc -l | xargs')
    local count = tonumber(output)
    count = count - 1
    return count
end

function updateMenuBar()
    inboxCount = countInboxMessages()
    outboxCount = countOutboxMessages()

    local title = ''
    title = title .. 'I: ' .. inboxCount
    if outboxCount > 0 then
        title = title .. ' O: ' .. outboxCount
    end

    mailMenuBar:setTitle(title)
end

hs.pathwatcher.new(mailPath, function(paths, flagTables)
    updateMenuBar()
end):start()

mailMenuBar:setClickCallback(updateMenuBar)
updateMenuBar()
