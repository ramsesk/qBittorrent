#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

cmake \
  -B build \
  -G "Ninja" \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DBOOST_ROOT="$BOOST_PATH" \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DTESTING=ON \
  -DVERBOSE_CONFIGURE=ON \
  -D$QBT_GUI

cmake --build build --target qbt_update_translations
cmake --build build
cmake --build build --target check
DESTDIR="qbittorrent" cmake --install build