# ubuntu-prebuild-container

My dev container for building prebuilds for linux, so the link against an old libc etc.

```
npm install -g ubuntu-prebuild-container
```

## Usage

``` sh
# to prebuild sodium-native
ubuntu-prebuild-container sodium-friends/sodium-native
# to prebuild utp-native
ubuntu-prebuild-container mafintosh/utp-native
# to prebuild fsctl
ubuntu-prebuild-container mafintosh/fsctl
```

## License

MIT
