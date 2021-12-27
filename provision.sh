sed -i '/deb-src/s/^# //' /etc/apt/sources.list && apt-get update
dpkg --add-architecture i386

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends -y \
    build-essential \
    fakeroot \
    bison \
    texinfo \
    gawk \
    gettext \
    openssl \
    python3 \
    texinfo \
    wget \
    git \
    gcc-9-multilib \
    g++-9-multilib \
    devscripts \
    ubuntu-dev-tools \
    dpkg-cross \
    debhelper \
    sbuild \
    schroot \
    rdfind symlinks gperf systemtap-sdt-dev libaudit-dev libcap-dev libselinux-dev postfix

usermod -aG sbuild vagrant
