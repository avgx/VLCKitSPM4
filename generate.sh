#!/bin/sh
XC_FRAMEWORK_URL="https://download.videolan.org/pub/cocoapods/unstable/VLCKit-4.0.0a9-a3480636-ba880a0b.tar.xz"
XC_FRAMEWORK_LOCATION=".tmp/VLCKit-binary/VLCKit.xcframework"

# Extract version
VERSION=$(echo $XC_FRAMEWORK_URL | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+[a-z][0-9]\+')

# Download and package steps...
mkdir -p .tmp/
wget -O .tmp/VLCKit.tar.xz $XC_FRAMEWORK_URL
tar -xf .tmp/VLCKit.tar.xz -C .tmp/
ditto -c -k --sequesterRsrc --keepParent "$XC_FRAMEWORK_LOCATION" "./VLCKit.xcframework.zip"

# Get checksum
CHECKSUM=$(swift package compute-checksum "./VLCKit.xcframework.zip")

# Update Package.swift
sed -i '' \
    -e "s|/download/v[0-9]\+\.[0-9]\+\.[0-9]\+/|/download/v$VERSION/|" \
    -e "s|checksum: \"[a-f0-9]\{64\}\"|checksum: \"$CHECKSUM\"|" \
    "./Package.swift"

# Copy license and cleanup...
cp -f .tmp/VLCKit-binary/COPYING.txt ./LICENSE
rm -rf .tmp/

# Annouce finish
echo "Done\n"
echo "Push to git and create a new release with version tag: 'v$VERSION'"
echo "then include the 'VLCKit.xcframework.zip' in that release"