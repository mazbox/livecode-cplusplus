livecode-cplusplus
==================

A simple C++ live coding environment based on openFrameworks. For OSX 10.8 and above.

The idea is that you have a single file open that you edit, and a window displaying visuals (and also a console). Every time you save the file you're editing, it gets recompiled and run in the window on the left. The console tells you if you made any mistakes in your code, and shows you any console output.

A version of openFrameworks is providing the visual functionality, sound probably works too but I haven't tried.

It takes about 500ms to compile and inject the code on my mac book air 1.8ghz.

Compilation is sped up by creating a compiled header of the main openframeworks header.

SETUP
=====
1. Clone the repository into your openframeworks directory
	- cd ~/Documents/openFrameworks
	- git clone https://github.com/mazbox/livecode-cplusplus.git
2. cd into the folder
4. type "make" to build everything
5. type ". ./setenv.sh" (note it's dot space dot slash setenv.sh)
5. type "./livecode" to start the program - the first time it starts up takes a moment.
6. edit the file livecode.cpp - the app will update every time you save


USAGE
=====
If you want to edit a file other than livecode.cpp, make the name of it your first parameter of livecode, e.g.

./livecode ../files/some.cpp



CHANGELOG
=========

1.1
- Removed dependency on of64, now works with a normal oF distribution (in 32 bit)

1.0
- Initial version