-- Get a value from an external program and assume that it finished successfully.
function getValueFromExternalProgram(command)
    _, value = pipe_from(command)
    return value
end

-- Get a list of folders needed for the filters.
function getFilterFolders()
    return {
        bulk = "Feed",
        receipts = "Receipts",
        notifications = "Notifications",
        maybespam = "Maybe Spam"
        -- screener = "Screener",
    }
end

-- Get a merged list of things.
function getMergedData(default, extra)
    extra = extra or {}
    for k,v in pairs(extra) do default[k] = v end
    return default
end

-- Get a merged list of ordered pairs.
function getMergedOrderedData(default, extra)
    extra = extra or {}
    for k,v in ipairs(extra) do default[k] = v end
    return default
end

--------------------------------------------------------------------------------

-- Get default folder configuration for Gmail accounts.
function getGmailFolders()
    folders = {
        inbox = "INBOX",
        archive = "[Gmail]/All Mail",
        spam = "[Gmail]/Spam",
        trash = "[Gmail]/Trash",
    }
    folders = getMergedData(folders, getFilterFolders())

    return folders
end


-- Get default folder configuration for Migadu accounts.
function getMigaduFolders()
    folders = {
        inbox = "INBOX",
        archive = "Archive",
        spam = "Junk",
        trash = "Trash",
    }
    folders = getMergedData(folders, getFilterFolders())

    return folders
end


-- Get a list of all of the built-in filters.
function getFilters()
    local filters = {}

    filters[1] = filterSpam
    filters[2] = filterReceipts
    filters[3] = filterNotifications
    filters[4] = filterBulkMail

    return filters
end


-- Get a list of expiration rules to apply.
function getExpirationRules()
    return {expireBulk, expireNotifications}
end


-- Get a list of notification selectors.
function getNotificationSelectors()
    return {
        ["gcal"] = function(inbox) return inbox:contain_field("Sender", "Google Calendar") end,
        ["gdrive"] = function(inbox) return inbox:contain_from("drive-shares-dm-noreply@google.com") + (inbox:contain_body('shared a spreadsheet with you from Google Sheets') + inbox:contain_body('shared a presentation with you from Google Slides') + inbox:contain_body('shared a document with you from Google Docs')) end,
        ["github"] = function(inbox) return inbox:contain_from("notifications@github.com") + inbox:contain_field("Reply-To", "notifications@github.com") + (inbox:contain_from("noreply@github.com") + inbox:contain_subject("dependabot alerts")) end,
        ["zoom personal meeting room"] = function(inbox) return inbox:contain_subject("has joined your Personal Meeting Room") end,
        ["zoom app approval"] = function(inbox) return inbox:contain_subject("approved to use") * inbox:contain_from("noreply-marketplace@zoom.us") end,
        ["1password new sign-in"] = function(inbox) return inbox:contain_subject("New 1Password sign-in") * inbox:contain_from("accounts@1password.com") end,
        ["yandex webmaster"] = function(inbox) return inbox:contain_from("devnull@webmaster.yandex.ru") end,
        ["namecheap autorenewal"] = function(inbox) return inbox:contain_from("support@namecheap.com") * inbox:contain_subject("Important auto-renewal information") end,
        ["slack"] = function(inbox) return inbox:contain_from("notification@slack.com") end,
        ["facebook"] = function(inbox) return inbox:contain_from("facebookmail.com") end,
        ["venmo payment requests"] = function(inbox) return inbox:contain_from("venmo@venmo.com") * inbox:contain_subject("requests $") end,
        ["hn replies"] = function(inbox) return inbox:contain_subject("[HN Replies]") end,
        ["aur comments"] = function(inbox) return inbox:contain_from("notify@aur.archlinux.org") end,
        ["flagstar transfers"] = function(inbox) return inbox:contain_from("bankingsupport@flagstar.com") + inbox:contain_subject("Inter Institution Schedule Transfer") end,
        ["rachio schedule updates"] = function(inbox) return inbox:contain_from("info@rachio.com") * inbox:contain_subject("An interval update has been made to") end,
        ["basecamp"] = function(inbox) return inbox:contain_from("notifications@3.basecamp.com") end,
    }
end


-- Ensure that the needed folders exist in the account.
function setupFolders(account)
    for k, v in pairs(account.folders) do
        print("Ensuring " .. k .. " folder " .. v .. " exists.")
        account.connection:create_mailbox(v)
        account.connection:subscribe_mailbox(v)
    end
end


-- Filter spam into the spam folder.
function filterSpam(account)
    if #account.spamSelectors == 0 then
        return
    end

    print("Filtering spam to " .. account.folders.maybespam)

    -- Save some keystrokes.
    inbox = account.connection[account.folders.inbox]

    -- Process spam selectors.
    messages = {}
    for _,v in pairs(account.spamSelectors) do
        messages = messages + v(inbox)
    end

    messages:move_messages(account.connection[account.folders.maybespam])
end


-- Filter receipts into a the receipts folder.
function filterReceipts(account)
    print("Filtering receipts to " .. account.folders.receipts)

    -- Save some keystrokes.
    inbox = account.connection[account.folders.inbox]

    messages = inbox:contain_subject("order")
        + inbox:contain_subject("invoice")
        + inbox:contain_subject("receipt")
        + inbox:contain_subject("payment")
        + inbox:contain_subject("billing")
        + inbox:contain_subject("statement")
        + inbox:contain_subject("mail@directpay.irs.gov")
        + (inbox:contain_from("notifications@ufbdirect.com") * inbox:contain_subject("External Transfer Received"))
        + (inbox:contain_from("venmo@venmo.com") * inbox:contain_subject("completed") * inbox:contain_subject("charge request"))
        + (inbox:contain_from("no-reply@lyftmail.com") + inbox:contain_body("receipt"))

    messages:move_messages(account.connection[account.folders.receipts])

    -- Mark all receipts as read. Probably don't need to review them.
    messages = account.connection[account.folders.receipts]:is_unseen()
    messages:mark_seen()
end


-- Return a set of queries to find bulk mail.
function getBulkSelectors(account)
    return {
        -- Anything that has a common bulk message header.
        ["self-identified"] = function(inbox)
            return (
                inbox:contain_field('Precedence', 'bulk')
                + inbox:contain_field('List-Unsubscribe', '@')
                + inbox:contain_field("List-Unsubscribe", "mailto")
                + inbox:contain_field("List-Unsubscribe", "http")
            )
        end,
        -- If the word unsubscribe is in the body, it's likely bulk mail.
        ["unsubscribable"] = function(inbox)
            return inbox:contain_body("unsubscribe")
        end,
        -- If I can't actually reply to an email, it's probably bulk mail.
        ["unreplyable"] = function(inbox)
            return inbox:contain_field("Reply-To", "noreply@") + inbox:contain_field("Reply-To", "no-reply@") + inbox:contain_field("Reply-To", "no_reply@") + inbox:contain_field("Reply-To", "donotreply@")
        end,
    }
end


-- Filter bulk mail into the bulk folder.
function filterBulkMail(account)
    print("Filtering bulk email to " .. account.folders.bulk)

    -- Save some keystrokes.
    inbox = account.connection[account.folders.inbox]

    -- Process bulk selectors.
    messages = {}
    for k,v in pairs(account.bulkSelectors) do
        print("Filtering " .. k .. " bulk messages")
        messages = messages + v(inbox)
    end

    -- Allow for exceptions.
    for k,v in pairs(account.bulkExceptions) do
        print("Unfiltering allow-listed " .. k .. " bulk messages")
        messages = messages - v(inbox)
    end

    -- Move the selected messages to the bulk folder.
    messages:move_messages(account.connection[account.folders.bulk])
end


-- Filter configured notifications.
function filterNotifications(account)
    print("Filtering configured notifications to " .. account.folders.notifications)

    -- Save some keystrokes.
    inbox = account.connection[account.folders.inbox]

    messages = {}

    for k,v in pairs(account.notificationSelectors) do
        print("Filtering " .. k .. " notifications")
        messages = messages + v(inbox)
    end

    messages:mark_seen()
    messages:move_messages(account.connection[account.folders.notifications])
end


-- Expire bulk messages after 60 days.
function expireBulk(account)
    print("Expiring bulk messages older than 60 days")
    messages = account.connection[account.folders.bulk]:is_older(60)
    messages:move_messages(account.connection[account.folders.trash])
end


-- Expire notifications after 14 days.
function expireNotifications(account)
    print("Expiring notifications older than 14 days")
    messages = account.connection[account.folders.notifications]:is_older(14)
    messages:move_messages(account.connection[account.folders.trash])
end


-- Housekeeping/cleanup
function housekeeping(account)
    -- All archived, trash, and spam messages should be marked as read.
    messages = account.connection[account.folders.archive]:is_unseen()
        + account.connection[account.folders.trash]:is_unseen()
        + account.connection[account.folders.spam]:is_unseen()
    messages:mark_seen()

    -- TODO: Sort Archive in to folders by year?
    -- TODO: Aggregate lists of accepted sender emails to start building a Screener?
end
