#!/bin/sh

XC_FRAMEWORK_URL="https://download.videolan.org/pub/cocoapods/unstable/VLCKit-4.0.0a9-a3480636-ba880a0b.tar.xz"
XC_FRAMEWORK_LOCATION=".tmp/VLCKit-binary/VLCKit.xcframework"

# Check if wget is installed
if ! command -v wget >/dev/null 2>&1; then
    echo "Error: wget is not installed"
    exit 1
fi

# Download xcframework
mkdir -p .tmp/
wget -O .tmp/VLCKit.tar.xz $XC_FRAMEWORK_URL
tar -xf .tmp/VLCKit.tar.xz -C .tmp/

# Archive it for SPM
ditto -c -k --sequesterRsrc --keepParent "$XC_FRAMEWORK_LOCATION" "./VLCKit.xcframework.zip"

# License crap
cp -f .tmp/VLCKit-binary/COPYING.txt ./LICENSE

# Cleanup
rm -rf .tmp/