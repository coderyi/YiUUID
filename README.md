
提供最简单的API，获取具有不同持久性级别的UUID。


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
