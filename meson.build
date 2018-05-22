# Initialize as:
# meson --prefix=/tmp/hello_world.app --bindir=Contents/MacOS build

# Qt Dependency:
# ~/opensrc/qt-everywhere-src-5.9.5/configure -prefix /opt/Qt5.9.5 -opensource -platform macx-clang

project('com.qanalysts.qt_hello_world', 'c', 'cpp',
        license: 'APACHE2',
        default_options: ['c_std=c11', 'cpp_std=c++11'])

qt5 = import('qt5')

qt5_deps = dependency('qt5', modules: ['Core', 'Gui', 'Widgets'])

# qt5_deps = subproject('qt5')

includes = include_directories('hello_world')

qtprocessed = qt5.preprocess(moc_headers: 'hello_world/mainwindow.h',
                             ui_files: 'hello_world/mainwindow.ui',
                             include_directories: includes)

exe = executable('hello_world', 'hello_world/main.cpp', 'hello_world/mainwindow.cpp',
                 qtprocessed,
                 include_directories: includes,
                 dependencies: qt5_deps,
                 install: true)

install_data('res/Info.plist', install_dir: 'Contents')
install_data('res/HelloQt.icns', install_dir: 'Contents/Resources')
install_data('res/qt.conf', install_dir: 'Contents/Resources')

subdir('install-scripts')

# Utility targets
run_target('distclean', command: 'run_targets/distclean.sh')
