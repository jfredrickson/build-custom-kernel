#!/usr/bin/env bash
# Clone the Fedora kernel repo

KERNEL_SRC=$HOME/src/kernel
KERNEL_REPO=https://src.fedoraproject.org/rpms/kernel.git

if [ -d $KERNEL_SRC ] ; then
  echo "$KERNEL_SRC already exists, leaving it alone"
else
  mkdir -p $KERNEL_SRC
  pushd $KERNEL_SRC
    git clone https://src.fedoraproject.org/rpms/kernel.git .
  popd
fi
