#!/usr/bin/env bash

echo " -> Setting \$PATH variable"

echo " --> If prompted for password, it's for managing /etc/paths.d/200-cweagans"

function ensurePath {
    newPath=$1
    if ! cat /etc/paths.d/200-cweagans | grep "$newPath" >> /dev/null; then
        echo -n "Adding new path: "
        echo $newPath | sudo tee -a /etc/paths.d/200-cweagans
    fi
}

[ -f "/etc/paths.d/200-cweagans" ] || sudo touch /etc/paths.d/200-cweagans

ensurePath /Users/cweagans/bin
ensurePath /Users/cweagans/.config/composer/vendor/bin
ensurePath /Users/cweagans/Code/go/bin
ensurePath /Users/cweagans/Code/npm/bin
ensurePath /Users/cweagans/Code/flutter/bin
ensurePath /usr/local/opt/mysql-client/bin
ensurePath /usr/local/opt/llvm/bin
ensurePath /Users/cweagans/Code/esp-toolchain/xtensa-esp32-elf/bin

echo " -> WARNING: Apps may need to be manually restarted to see the new contents of \$PATH."
