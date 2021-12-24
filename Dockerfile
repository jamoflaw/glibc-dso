FROM ubuntu:focal

# Enable source repos
#RUN sed -i 's|# deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted|deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted|' /etc/apt/sources.list
#RUN sed -i 's|# deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted|deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted|' /etc/apt/sources.list
RUN sed -i '/deb-src/s/^# //' /etc/apt/sources.list && apt-get update

# Update package list
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
    devscripts \
    ubuntu-dev-tools

# Install package prereqs
RUN DEBIAN_FRONTEND=noninteractive apt-get build-dep libc6 -y

# Ensure we create a user
RUN adduser --disabled-password --gecos "" builder
