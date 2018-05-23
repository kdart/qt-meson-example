# Qt Application bundle for MacOS using meson+ninja

Example project to build Qt app bundle for MacOS using meson.

This repository contains a simple Qt5 Hello World application for MacOS that is
built with [Meson](http://mesonbuild.com/) and ninja build system.

## Dependencies

### Homebrew

Building also depends on [homebrew](https://brew.sh/). I install everything in
/opt.

### Qt

I currently install Qt from source, first. I would like to get Qt as part of the
build using a subproject, but that's not fully set up yet.

Download: http://mirrors.ocf.berkeley.edu/qt/archive/qt/5.9/5.9.5/single/qt-everywhere-opensource-src-5.9.5.tar.xz

Build like this:

```sh
DESIRED_QT=5.9.5
SRC=$PWD

cd ~/build
tar xJf ~/Downloads/qt-everywhere-opensource-src-${DESIRED_QT}.tar.xz
cd qt-everywhere-src-${DESIRED_QT}
./configure -prefix /opt/Qt${DESIRED_QT} -nomake tests -nomake examples -opensource -skip qt3d -c++std c++11
patch -p1 < $SRC/subprojects/qt-everywhere-opensource-src-5.9.5.diff
make
sudo make install
```

## Setup

1. Install the build tools.
```sh
   brew install ninja
   brew install meson
```

2. Make sure the Qt version's _bin_ directory is on your PATH.
   For example: /opt/Qt5.9.5/bin
   (The *configure* script uses qmake to determine the Qt version)
```sh
   export PATH=/opt/Qt5.9.5/bin:$PATH
```

3. Run *configure*. The configure script runs _meson_ for you.
```sh
   ./configure
```

## Build and install

1. cd into _build_ directory.
```sh
   cd build
```

2. run _ninja_.
```sh
   ninja
```

3. run _ninja install_ to install app bundle under *install* subdirectory.
```sh
   ninja install
```

## Run

```sh
cd ../install
open hello\_world.app
```
