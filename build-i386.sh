#!/bin/sh

# Exit on errs
set -e

# Download source
apt-get source libc6

# Patch the installation
git apply --directory=glibc-2.31/ glibc-dso.patch

# Reversion
cd glibc-2.31
dpkg-checkbuilddeps
/usr/bin/dch -n "DSO performance patch"

EDITOR=/bin/true dpkg-source -q --commit . "dsopatch"

# Build i386
pbuilder-dist focal i386 create
