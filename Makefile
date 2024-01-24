#!/bin/sh

DIST=noble
BUILD=build
MIRROR=http://127.0.0.1/ubuntu

shell: clean bootstrap
	@mount proc ${BUILD}/proc -t proc
	@mount sysfs ${BUILD}/sys -t sysfs
	@mount udev ${BUILD}/dev -t devtmpfs
	@mount devpts ${BUILD}/dev/pts -t devpts
	@LC_ALL=C LANG=C chroot ${BUILD} /bin/bash

build: bootstrap
	@mount proc ${BUILD}/proc -t proc
	@mount sysfs ${BUILD}/sys -t sysfs
	@mount udev ${BUILD}/dev -t devtmpfs
	@mount devpts ${BUILD}/dev/pts -t devpts
	@LC_ALL=C LANG=C chroot ${BUILD} /build-incus
	@rm -rf sincus && mkdir sincus
	@cp ${BUILD}/build/go/bin/* sincus

bootstrap:
	@if [ ! -d ${BUILD} ]; then \
		debootstrap ${DIST} ${BUILD} ${MIRROR}; \
		cp build-incus ${BUILD}; \
	fi

clean:
	@-umount ${BUILD}/dev/pts >/dev/null 2>&1
	@-umount ${BUILD}/dev >/dev/null 2>&1
	@-umount ${BUILD}/sys >/dev/null 2>&1
	@-umount ${BUILD}/proc >/dev/null 2>&1
distclean: clean
	@rm -rf ${BUILD}
