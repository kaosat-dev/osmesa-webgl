#!/bin/bash -e

CORES=1
MESA_VERSION="10.5.4"

MESA_DIRNAME="mesa-$MESA_VERSION"

if [[ -f /proc/cpuinfo ]]
then
	CORES=$(awk '/^processor/ {++n} END {print n}' /proc/cpuinfo)
fi

if which sysctl >/dev/null
then
	CORES=$(sysctl -n hw.ncpu 2>/dev/null || echo $CORES)
fi

pushd  "$MESA_DIRNAME"
./configure --enable-gallium-osmesa --disable-egl --disable-driglx-direct --disable-dri --with-gallium-drivers=swrast --enable-gallium-llvm
make -j $CORES
popd
