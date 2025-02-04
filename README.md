# VLCKit SPM

This is a Swift Package Manager compatible version of [VLCKit](https://code.videolan.org/videolan/VLCKit). 
It distributes and bundles VLCKit for iOS, macOS and tvOS as a single Swift Package. 

### Installation
Add this repo to as a Swift Package dependency to your project
```
https://github.com/rursache/VLCKitSPM
```

If using this in a swift package, add this repo as a dependency.
```
.package(url: "https://github.com/rursache/VLCKitSPM/", .upToNextMajor(from: "4.0.0"))
```

### Usage

To get started, import this library: `import VLCKitSPM`

See the [VLCKit documentation](https://videolan.videolan.me/VLCKit/) for more info on integration and usage for VLCKit.

### Building
If you would like to bundle your own VLCKit binaries run the `generate.sh` script.

### Thanks
Based on [tylerjonesio](https://github.com/tylerjonesio/vlckit-spm)'s idea.
