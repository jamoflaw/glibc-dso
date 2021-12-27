#!/bin/bash

set -x
set -e

# Clean and create the build dir
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

# Change into build dir
cd $BUILD_DIR

# Download souces
apt-get source libc6

# Patch the installation
git apply --directory=glibc-2.31 /vagrant/glibc-dso.patch

# Reversion
pushd glibc-2.31
dpkg-checkbuilddeps
/usr/bin/dch -n "DSO performance patch"
EDITOR=/bin/true dpkg-source -q --commit . "dsopatch"
popd

# Create Chroot if it doesn't exist
[ -d /var/lib/schroot/chroots/$DIST-$ARCH ] || mk-sbuild $DIST --arch=$ARCH

# Build
sbuild --arch $ARCH -A -d $DIST-$ARCH "glibc_2.31-0ubuntu9.2.dsc"

# Copy build deb files
mkdir -p $OUTPUT_DIR
cp $BUILD_DIR/*.deb $OUTPUT_DIR
