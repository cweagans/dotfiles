If any of the application resources in this directory change, you can run the following command to
force LaunchServices to update its info:

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v ./AppName.app
```
