project('com.google.spotlightstories.hello_world', 'c', 'cpp',
        default_options : ['c_std=c11', 'cpp_std=c++11'])
# executable('hello_world', 'hello_world/main.cpp')

qt5 = import('qt5')

qt5_dep = dependency('qt5', modules: ['Core', 'Gui', 'Widgets'])

inc = include_directories('hello_world')

qtprocessed = qt5.preprocess(moc_headers : 'hello_world/mainwindow.h',
                           ui_files : 'hello_world/mainwindow.ui',
                           include_directories: inc)
# translations = qt5.compile_translations(ts_files : 'myTranslation_fr.ts', build_by_default : true)
executable('hello_world', 'hello_world/main.cpp', 'hello_world/mainwindow.cpp', qtprocessed,
           include_directories: inc,
	   dependencies : qt5_dep, install: true)

install_data('hello_world/Info.plist', install_dir : 'Contents')

