#!/usr/bin/env bash
# Clone the Fedora kernel repos

KERNEL_SRC=$HOME/src/kernel
KERNEL_HEADERS_SRC=$HOME/src/kernel-headers
KERNEL_REPO=https://src.fedoraproject.org/rpms/kernel.git
KERNEL_HEADERS_REPO=https://src.fedoraproject.org/rpms/kernel-headers.git

if [ -d $KERNEL_SRC ] ; then
  echo "$KERNEL_SRC already exists, leaving it alone"
else
  mkdir -p $KERNEL_SRC
  pushd $KERNEL_SRC
    git clone $KERNEL_REPO .
  popd
fi

if [ -d $KERNEL_HEADERS_SRC ] ; then
  echo "$KERNEL_HEADERS_SRC already exists, leaving it alone"
else
  mkdir -p $KERNEL_HEADERS_SRC
  pushd $KERNEL_HEADERS_SRC
    git clone $KERNEL_HEADERS_REPO .
  popd
fi
