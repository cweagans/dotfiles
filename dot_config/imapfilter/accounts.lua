accounts = {
    gmail = {
        connection = IMAP {
            server = 'imap.gmail.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/macos - gmail app password/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/macos - gmail app password/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getGmailFolders(),
        notificationSelectors = getMergedData(getNotificationSelectors(), {
            ["drupal"] = function(inbox) return inbox:contain_from("noreply@drupal.org") * inbox:contain_body("Issue status update for:") end,
            ["doordash"] = function(inbox) return inbox:contain_subject("Details of your no-contact delivery") * inbox:contain_from("no-reply@doordash.com") end,
            ["apple card"] = function(inbox) return inbox:contain_from("no_reply@post.applecard.apple") end,
            ["farnsworth"] = function(inbox) return inbox:contain_subject("[farnsworth.internal.cweagans.net]") end,
        }),
        bulkSelectors = getMergedData(getBulkSelectors(), {
            ["rocketbook"] = function(inbox) return inbox:contain_from("hello@news.getrocketbook.com") end,
        }),
    },
    swirldslabs = {
        connection = IMAP {
            server = 'imap.gmail.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/macos - swirldslabs app password/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/macos - swirldslabs app password/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getGmailFolders(),
        notificationSelectors = getMergedData(getNotificationSelectors(), {
            ["elasticsearch"] = function(inbox) return inbox:contain_subject("storage space") * inbox:contain_subject("[Elasticsearch Service]") end,
            ["ssh access request"] = function(inbox) return inbox:contain_to("ssh@hedera.com") end,
            ["hedera admin"] = function(inbox) return inbox:contain_to("admin@hedera.com") end,
            ["ramp reimbursement"] = function(inbox) return inbox:contain_from("do-not-reply@ramp.com") * (inbox:contain_subject("reimbursement was approved") + inbox:contain_subject("reimbursements were approved") )end,
            ["metrika"] = function(inbox) return inbox:contain_from("noreply@metrika.co") * inbox:contain_subject("Hedera Alert") end,
            ["knowbe4"] = function(inbox) return inbox:contain_from("do-not-reply@training.knowbe4.com") * inbox:contain_subject("training") end,
            ["lattice"] = function(inbox) return inbox:contain_from("notifications@mg.latticehq.com") end,
            ["upflex"] = function(inbox) return inbox:contain_from("bookings@upflex.com") end,
            ["github service account"] = function(inbox) return inbox:contain_to("devops+ghserviceaccount@swirldslabs.com") end,
            ["gcloud updates"] = function(inbox) return inbox:contain_field("Reply-To", "cloudplatform-noreply@google.com") end,
            ["linode"] = function(inbox) return inbox:contain_subject("Linode Events Notification") end,
            ["teraswitch maintenance"] = function(inbox) return inbox:contain_subject("TeraSwitch Maintenance") * inbox:contain_field("Reply-To", "support@teraswitch.com") end,
            ["company-wide notifications"] = function(inbox) return inbox:contain_to("swirldslabs@swirldslabs.com") end,
        }),
    },
    personal = {
        connection = IMAP {
            server = 'imap.migadu.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - personal/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - personal/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getMigaduFolders(),
        notificationSelectors = getMergedData(getNotificationSelectors(), {
            ["personal infra"] = function(inbox) return inbox:contain_from("no-reply@cweagans.net") + (inbox:contain_from("me@cweagans.net") * inbox:contain_subject("All In One WP Security")) end,
            ["dmarc"] = function(inbox) return inbox:contain_from("noreply-dmarc-support@google.com") + inbox:contain_from("dmarcreport@microsoft.com") end,
            ["zamzows lawn program"] = function(inbox) return inbox:contain_subject("Zamzows Lawn Program Step") end,
            ["ecopest"] = function(inbox) return inbox:contain_from("talon@ecopestcontrolidaho.com") * inbox:contain_subject("Completed Service") end,
            ["hoa"] = function(inbox) return inbox:contain_from("mailer@payhoa.com") end,
            ["vet appointment confirmations"] = function(inbox) return inbox:contain_from("noreply@notifications.allydvm.com") * inbox:contain_subject("Please Confirm Your Appointment for") end,
        }),
        bulkSelectors = getMergedData(getBulkSelectors(), {
            ["acm"] = function(inbox) return inbox:contain_from("acm.org") end,
        }),
        bulkExceptions = {
            ["golang weekly"] = function(inbox) return inbox:contain_from("golangweekly.com") end,
            ["thorsten ball"] = function(inbox) return inbox:contain_from("thorstenball@substack.com") end,
        },
        spamSelectors = {
            function(inbox) return inbox:contain_from("partyfixx.co") end,
            function(inbox) return inbox:contain_body("Coinbase") - inbox:contain_from("@mail.coinbase.com") end,
        }
    },
    pineconegrove = {
        connection = IMAP {
            server = 'imap.migadu.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - pinecone grove/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - pinecone grove/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getMigaduFolders(),
    },
    eagansfoundation = {
        connection = IMAP {
            server = 'imap.migadu.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - eagans foundation/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - eagans foundation/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getMigaduFolders(),
    },
    boiseweddingsigns = {
        connection = IMAP {
            server = 'imap.migadu.com',
            username = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - boise wedding signs/username"'),
            password = getValueFromExternalProgram('op read -n "op://Chezmoi/migadu - boise wedding signs/password"'),
            port = 993,
            ssl = "tls1.3"
        },
        folders = getMigaduFolders(),
    }
}
