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

## Installation

Once installed you can install via `dpkg` direct (though I would personally use apt to ensure the dependencies are maintained)

### Using apt

To use apt createa directory structure for the resulting debs

```bash
mkdir -p debs/pool/main
cp -R /output/* debs/pool/main
cd debs
dpkg-scanpackages --multiversion . 2>/dev/null > Packages
```

Now add the path to a file in `/etc/apt/sources.list.d/glibc-dso.list`

```text
deb [trusted=yes] file:///path/to/debs ./
```

## Enable the Patch

The patch does not set itself to the default sorting algorithm instead you need to specicy the env var:

```bash
GLIBC_TUNABLES=glibc.rtld.dynamic_sort=2
```

To ensure its enabled.
