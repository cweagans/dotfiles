--
-- Watch the Bear database for changes and write all notes to a local cache.
--

-- Set a few vars to save some keystrokes.
local db_path = os.getenv('HOME') .. '/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite'
local cache_path = os.getenv('HOME') .. '/.cache/bear'

-- Purge all markdown files from the local cache.
function deleteBearCache()
    os.execute('rm -rf ' .. cache_path .. '/*.md')
end

-- Write all notes from the Bear database to a local cache so that Elephas can index them.
function handleBearDatabaseUpdate()
    print("updating bear cache")

    -- Empty the cache.
    deleteBearCache()

    -- Open the Bear database.
    local db = hs.sqlite3.open(db_path, hs.sqlite3.OPEN_READONLY)

    -- Query the database for all unencrypted, non-trashed notes.
    local query = [[
        SELECT
            ZUNIQUEIDENTIFIER,
            ZTEXT
        FROM
            ZSFNOTE
        WHERE ZTRASHED = 0
        AND ZENCRYPTED = 0
    ]]

    -- Iterate over all found notes and write files to the cache dir.
    for row in db:rows(query) do
        local uuid = row[1]
        local text = row[2]

        -- Write the note to a markdown file.
        local f = assert(io.open(cache_path .. '/' .. uuid .. '.md', 'w'))
        f:write(text)
        f:close()
    end

    -- Close the database.
    db:close()
end

-- Update the bear cache every 60 minutes.
hs.timer.doEvery(3600, handleBearDatabaseUpdate)

-- Run this once on Hammerspoon startup to make sure the cache is usable.
handleBearDatabaseUpdate()
