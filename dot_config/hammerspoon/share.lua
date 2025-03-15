-- Automatically move files in ~/Public to share.cweagans.net/
function syncToCloud(files)
  hs.timer.doAfter(1, function()
    output, status, typee, rc = hs.execute("rclone move --exclude '.*' --exclude 'Drop Box/\' ~/Public/ send.cweagans.net:cweagans-file-share/", true)
    if status then
      hs.notify.new({title="send.cweagans.net sync", informativeText="Synced successfully"}):send()
    else
      hs.notify.new({title="send.cweagans.net sync", informativeText="Sync failed"}):send()
    end
  end)
end

publicPathWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Public", syncToCloud)
publicPathWatcher:start()
