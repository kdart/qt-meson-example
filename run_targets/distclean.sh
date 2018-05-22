#!/bin/sh

cd "${MESON_SOURCE_ROOT}"

[ -d build ] && rm -rf build
[ -d install ] && rm -rf install

