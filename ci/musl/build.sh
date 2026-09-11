#!/bin/sh
set -eu
cd /work
mkdir -p logs prefix dist
exec > logs/build.log 2>&1
apk add --no-cache build-base meson ninja git binutils linux-headers libpciaccess-dev
apk info -v > logs/apk-packages.txt
meson setup build /src --prefix=/work/prefix --libdir=lib --buildtype=release \
  -Dintel=enabled -Damdgpu=enabled -Dradeon=enabled -Dnouveau=enabled \
  -Dman-pages=disabled -Dcairo-tests=disabled -Dtests=true > logs/configure.log 2>&1
meson compile -C build -j 2 > logs/compile.log 2>&1
meson test -C build --print-errorlogs --num-processes 2 > logs/tests.log 2>&1
meson install -C build > logs/install.log 2>&1
python /src/ci/musl/package.py
