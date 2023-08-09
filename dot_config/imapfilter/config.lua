-- Display information about what imapfilter is doing.
options.info = true

-- Automatically create (and subscribe) mailboxes when needed. Subscribing causes
-- the mailboxes to show up in IMAP clients.
options.create = true
options.subscribe = true

-- Helper to find script path
function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end

-- Load util and filter functions.
dofile(script_path() .. '/functions.lua')

-- Import all of the account configuration.
dofile(script_path() .. '/accounts.lua')

-- Run configured filters on all accounts
for name, account in pairs(accounts) do
    print("Processing account: " .. name)

    -- Set default values for some things.
    account.bulkExceptions = account.bulkExceptions or {}
    account.bulkSelectors = account.bulkSelectors or getBulkSelectors()
    account.expirationRules = account.expirationRules or getExpirationRules()
    account.filters = account.filters or getFilters()
    account.notificationSelectors = account.notificationSelectors or getNotificationSelectors()
    account.spamSelectors = account.spamSelectors or {}

    -- Process all configured filters.
    for _, filter in ipairs(account.filters) do
        filter(account)
    end

    -- Expire old email that isn't needed anymore.
    for _, rule in pairs(account.expirationRules) do
        rule(account)
    end

    -- Do global housekeeping stuff.
    housekeeping(account)

    print('----------------------------------')
end
