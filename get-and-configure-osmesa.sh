#!/bin/bash -e

MESA_VERSION="10.5.4"

MESA_DIRNAME="mesa-$MESA_VERSION"
MESA_FILENAME="mesa-$MESA_VERSION.tar.gz"
MESA_URL="ftp://ftp.freedesktop.org/pub/mesa/current/mesa-$MESA_VERSION.tar.gz"

#if [ ! -d "$MESA_DIRNAME" ] ; then
#  echo "Not installed, fetching ..."
#	if [ ! -f "$MESA_FILENAME" ]; then
#    echo "no file "
#	  curl -o "$MESA_FILENAME" "$MESA_URL"
# fi
#	tar zxvf "$MESA_FILENAME"
#fi

pushd "$MESA_DIRNAME"
  echo "installin'"
  autoreconf -v --install
popd
