# Example project to build Qt app bundle for MacOS using meson.

This repository contains a simple Qt5 Hello World application with that is
built with [http://mesonbuild.com/](Meson).


## Setup

0. brew install ninja
   brew install meson

1. Make sure the Qt version's _bin_ directory is on your PATH.
   For example: /opt/Qt5.9.5/bin
   (The *configure* script uses qmake to determine the Qt version)

2. Run *configure*. The configure script runs _meson_ for you.

3. cd into _build_ directory.

4. run _ninja_.

5. run _ninja install_ to install app bundle under *install* subdirectory.
