# GLibC With DSO Patch

This builds the current version of libc6 (on Ubuntu Focal) with the DSO patch applied.

## Prerequisites

Requires:

* Vagrant (https://www.vagrantup.com/downloads)
* Virtualbox (https://www.virtualbox.org/wiki/Linux_Downloads)

## Usage

Run:

```
make
```

And it will build `i386` and `amd64` builds of the package and deposit the resulting DEB files into an `./output` dir.

Just `i386`/`amd64` builds can be run by using:

```
make build_<ARCH>
```

> where `<ARCH>` is either `i386` or `amd64` respectively.
