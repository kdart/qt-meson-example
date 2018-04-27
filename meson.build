project('hello world Qt example', 'cpp')
# executable('hello_world', 'hello_world/main.cpp')

qt5 = import('qt5')

qt5_dep = dependency('qt5', modules: ['Core', 'Gui', 'Widgets'])

inc = include_directories('hello_world')

moc_files = qt5.preprocess(moc_headers : 'mainwindow.h', include_directories: inc)
# translations = qt5.compile_translations(ts_files : 'myTranslation_fr.ts', build_by_default : true)
executable('hello_world', 'main.cpp', 'mainwindow.cpp', moc_files, include_directories: inc, dependencies : qt5_dep)

