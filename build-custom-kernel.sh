#!/usr/bin/env bash
# Builds a custom kernel with the AMD AGESA workaround patch.
# https://fedoraproject.org/wiki/Building_a_custom_kernel

FEDORA_RELEASE=30
AGESA_PATCH_FILE=$(pwd)/agesa-workaround.patch
KERNEL_PACKAGES="kernel kernel-core kernel-debug-devel kernel-devel kernel-modules kernel-modules-extra"
KERNEL_SRC=$HOME/src/kernel

pushd $KERNEL_SRC
  # Get latest kernel source
  git checkout master
  git pull origin

  # Create fresh branch
  git branch -D agesa-workaround
  git checkout -b agesa-workaround origin/f${FEDORA_RELEASE}

  # Add patch
  cp $AGESA_PATCH_FILE .
  ./scripts/newpatch.sh agesa-workaround.patch "Workaround for AMD AGESA 0.0.7.2 bug affecting PCI passthrough"

  # Not sure if a git commit is necessary
  git add .
  git commit -m "AGESA workaround"

  # Build
  fedpkg local

  # Install
  ver=$(fedpkg verrel | sed 's/^kernel-//').$(arch)
  for pkg in $KERNEL_PACKAGES ; do
    pkgs="${pkgs} ${pkg}-${ver}.rpm"
  done
  pushd x86_64
    sudo dnf install --nogpgcheck --disableexcludes=all $pkgs
  popd
popd
