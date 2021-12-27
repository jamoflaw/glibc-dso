all: build_i386 build_amd64

DIST=focal
ARCH=amd64
BUILD_DIR=/tmp/build-$(DIST)-$(ARCH)
OUTPUT_DIR=/vagrant/output/$(DIST)-$(ARCH)

clean:
	rm -rf output
	vagrant destroy --force

vagrant_up:
	vagrant up --provider=virtualbox

build: vagrant_up
	vagrant ssh -c "DIST=$(DIST) ARCH=$(ARCH) BUILD_DIR=$(BUILD_DIR) OUTPUT_DIR=$(OUTPUT_DIR) /vagrant/build.sh"

build_i386:
	$(MAKE) build ARCH=i386

build_amd64:
	$(MAKE) build ARCH=amd64
