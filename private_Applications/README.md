If any of the application resources in this directory change, you can run the following command to
force LaunchServices to update its info:

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v ./AppName.app
```

On initial install, you need to re-add the Wezterm GUI binary. The easiest way is to just:

```bash
cp /Applications/WezTerm.app/Contents/MacOS/wezterm-gui ~/Applications/*.app/Contents/MacOS/[APP NAME]
```

TODO: Automate rehydrating apps from the GUI binary and re-signing everything. Basically, re-run a subset of the AST script.
