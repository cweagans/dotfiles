# dotfiles

This is how I set up a system to my liking. I mostly run macOS, but there will be some tweaks over time to set up a minimal Linux environment (e.g. a shared hosting account or similar) to make it work in a familiar way.


## Installation

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cweagans/dotfiles/HEAD/remote_install.sh)"
```

### Manual steps

There are a couple of manual steps that need to be performed that I haven't gotten around to automating yet:

* `mkcert -install` for ddev https support (probably easy to automate, since invoking it a separate time doesn't change anything)
* Update `~/.ddev/global_config.yaml` (may have to run `ddev` first to generate the file) -- always omit the `dba` container (harder to automate because of the `project_info` key. Can't just commit this file.)
* Enable Safari extensions
* Run Tamperish and set tampers path to `~/.config/tamperish`
* Open Setapp and install all favorited apps
* Run apps, allow accessibility api/screen recording access as needed, configure if needed:
    * Bartender (permissions, arrange menu bar)
    * Cleanshot (permissions, auth with share service)
    * Elephas (permissions, click through onboarding)
    * Lungo (permissions)
    * Dato (permissions, launch at startup, probably configure)
* Set wallpaper to ~/.wallpaper.png
* Load duckduckgo settings from cloud sync
* Set Slack colors as needed: https://github.com/catppuccin/slack
* Settings -> Keyboard -> Shortcuts -> Spotlight: change "Show spotlight search" to "Ctrl+Alt+Cmd+Space"

## Support

Things I can do (open an issue for these things):

* Answer specific questions about how something works or why something was done the way it was.
* Point you toward relevant documentation.
* Make specific improvements (for instance, if something was broken for you and you figure out how to fix it, let me know and I'll incorporate your fix).

Things I probably can't/won't do:

* Do in-depth troubleshooting on your machine.
* Add features that are specific to your environment.
* Switch text editors, mail clients, programming language, dotfile management tool, or other similar changes.


## Uninstall

idk reload your machine or something.
