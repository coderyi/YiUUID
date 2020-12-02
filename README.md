
This library provides the simplest API to obtain universally unique identifiers with different levels of persistence.

CocoaPods

```
pod 'YiUUID'
```

## Persistence
- **`√`** *yes*
- `-` *no*

| PERSISTS              | App memory | App relaunch | Reset Advertising Identifier | App reinstall | System reboot | System upgrade | System reset |
|-----------------------|:----------:|:------------:|:----------------------------:|:-------------:|:-------------:|:--------------:|:------------:|
| `uuid`                |      -     |       -      |               -              |       -       |       -       |        -       |       -      |
| `uuidForKey`      |    **√**   |       -      |               -              |       -       |       -       |        -       |       -      |
| `uuidForSession`      |    **√**   |       -      |               -              |       -       |       -       |        -       |       -      |
| `uuidForInstallation` |    **√**   |     **√**    |             **√**            |       -       |     **√**     |        -       |       -      |
| `uuidForVendor`       |    **√**   |     **√**    |               -              |     **√***    |     **√**     |        -       |       -      |
| `uuidForDevice`       |    **√**   |     **√**    |             **√**            |     **√**     |     **√**     |      **√**     |    **√****   |



## License
Released under [MIT License](LICENSE).
