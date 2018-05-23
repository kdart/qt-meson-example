#!/bin/bash

QMAKE=`which qmake`
if [ $? != 0 ] ; then
	echo "qmake not found. Make sure the one you want is in your PATH."
	exit 1
fi
QT_DIR=`$QMAKE -query QT_HOST_PREFIX`

# This gets run with the following environment variables added (with example values):

# MESONINTROSPECT=/opt/brew/opt/python/bin/python3.6 /opt/brew/Cellar/meson/0.46.0/libexec/bin/meson introspect
# MESON_BUILD_ROOT=/Users/dart/opensrc/qt-meson-example/build
# MESON_INSTALL_DESTDIR_PREFIX=/tmp/hello_world.app
# MESON_INSTALL_PREFIX=/tmp/hello_world.app
# MESON_SOURCE_ROOT=/Users/dart/opensrc/qt-meson-example

# Use the same Python that meson is running with.
# The MESONINTROSPECT has the python executable as first word.
_sa=($MESONINTROSPECT)
PYTHONBIN=${_sa[0]}
unset _sa

# For use with running Python scripts from installer. Currently there isn't one.
export PYTHONBIN

EXECUTABLE="${MESON_INSTALL_DESTDIR_PREFIX}/Contents/MacOS/hello_world"

# Use the Qt installer tool.
${QT_DIR}/bin/macdeployqt ${MESON_INSTALL_DESTDIR_PREFIX} -always-overwrite -executable=${EXECUTABLE}

# Add back the RPATH that meson removed.
# See https://github.com/mesonbuild/meson/issues/2567
install_name_tool -add_rpath @loader_path/../Frameworks ${EXECUTABLE}

