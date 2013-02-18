livecode-cplusplus
==================

A simple C++ live coding environment based on openFrameworks. For OSX 10.7 and above.

The idea is that you have a single file open that you edit, and a window displaying visuals (and also a console). Every time you save the file you're editing, it gets recompiled and run in the window on the left. The console tells you if you made any mistakes in your code, and shows you any console output.

A version of openFrameworks is providing the visual functionality, sound probably works too but I haven't tried.

It takes about 500ms to compile and inject the code on my mac book air 1.8ghz.

Compilation is sped up by creating a compiled header of the main openframeworks header.

SETUP
=====
1. Clone the repository
	- git clone https://github.com/mazbox/livecode-cplusplus.git
2. cd into the folder
3. type "git submodule init" then "git submodule update" to get of64

4. type "make" to build everything
5. type "./livecode" to start the program - the first time it starts up takes a moment.
6. edit the file livecode.cpp - the app will update every time you save

