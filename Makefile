IMAGE_NAME=temp-ubuntu-glibc

.PHONY: build-amd64
build-amd64:
	# Build a temp image
	docker build . -t $(IMAGE_NAME)

	# Prepare build dir
	mkdir -p build-amd64
	cp build-amd64.sh build-amd64/
	cp glibc-dso.patch build-amd64/

	# Build using docker
	docker run --rm -v $$(pwd)/build-amd64:/build -w /build --user $$(id -u) --privileged $(IMAGE_NAME) ./build-amd64.sh

	mkdir -p output
	cp build-amd64/*.deb output/

.PHONY: build-i386
build-i386:
	# Build a temp image
	docker build . -t $(IMAGE_NAME)

	# Prepare build dir
	mkdir -p build-i386
	cp build.sh build/
	cp glibc-dso.patch build/

	# Build using docker
	docker run --rm -v $$(pwd)/build-i386:/build -w /build --user $$(id -u) --privileged $(IMAGE_NAME) ./build-i386.sh

	mkdir -p output
	cp build-i386/*.deb output/

clean:
	rm -rf build-amd64 build-i386
