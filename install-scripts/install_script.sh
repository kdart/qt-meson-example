#!/bin/sh

# printenv | sort
# echo $0 $1 $2 $3 $4

QMAKE=`which qmake`
if [ $? != 0 ] ; then
	echo "qmake not found. Make sure the one you want is in your PATH."
	exit 1
fi
QT_DIR=`$QMAKE -query QT_HOST_PREFIX`

# QT_DIR=/opt/Qt5.10.1
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
echo PYTHONBIN=$PYTHONBIN

# mkdir -p ${MESON_INSTALL_PREFIX}/Contents/Frameworks
# cp -R ${QT_DIR}/QtCore.framework ${MESON_INSTALL_PREFIX}/Contents/Frameworks/
# cp -R ${QT_DIR}/QtGui.framework ${MESON_INSTALL_PREFIX}/Contents/Frameworks/
# cp -R ${QT_DIR}/QtWidgets.framework ${MESON_INSTALL_PREFIX}/Contents/Frameworks/

EXECUTABLE="${MESON_INSTALL_DESTDIR_PREFIX}/Contents/MacOS/hello_world"

${QT_DIR}/bin/macdeployqt ${MESON_INSTALL_DESTDIR_PREFIX} -always-overwrite -executable=${EXECUTABLE}

install_name_tool -add_rpath @loader_path/../Frameworks ${EXECUTABLE}

#install_name_tool -change @rpath/QtCore.framework/Versions/5/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/5/QtCore ${MESON_INSTALL_PREFIX}/Contents/MacOS/hello_world
#install_name_tool -change @rpath/QtWidgets.framework/Versions/5/QtWidgets @executable_path/../Frameworks/QtWidgets.framework/Versions/5/QtWidgets ${MESON_INSTALL_PREFIX}/Contents/MacOS/hello_world

