CC = llvm-g++
LIVEFILE = default.cpp
OF_PATH=..
PCH_FILE = $(OF_PATH)/libs/openFrameworks/ofMain.h.gch
ARCH = -arch i386
OF_STATIC_LIB = $(OF_PATH)/libs/openFrameworksCompiled/lib/osx/openFrameworks.a

LD_FLAGS = $(OF_STATIC_LIB) -arch i386 \
				-framework OpenGL -framework GLUT -framework Carbon -framework CoreAudio \
				$(OF_PATH)/libs/cairo/lib/osx/cairo.a \
				$(OF_PATH)/libs/cairo/lib/osx/pixman-1.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoCrypto.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoDataSQLite.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoNetSSL.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoZip.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoData.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoFoundation.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoUtil.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoDataODBC.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoNet.a \
				$(OF_PATH)/libs/poco/lib/osx/PocoXML.a \
				-F $(OF_PATH)/libs/glut/lib/osx \
				$(OF_PATH)/libs/fmodex/lib/osx/libfmodex.dylib

INCLUDES = -I$(OF_PATH)/libs/openFrameworks/ \
		-I$(OF_PATH)/libs/openFrameworks/3d \
		-I$(OF_PATH)/libs/openFrameworks/app \
		-I$(OF_PATH)/libs/openFrameworks/communication \
		-I$(OF_PATH)/libs/openFrameworks/events \
		-I$(OF_PATH)/libs/openFrameworks/gl \
		-I$(OF_PATH)/libs/openFrameworks/graphics \
		-I$(OF_PATH)/libs/openFrameworks/math \
		-I$(OF_PATH)/libs/openFrameworks/sound \
		-I$(OF_PATH)/libs/openFrameworks/types \
		-I$(OF_PATH)/libs/openFrameworks/utils \
		-I$(OF_PATH)/libs/openFrameworks/video \
		-I$(OF_PATH)/libs/glew/include \
		-I$(OF_PATH)/libs/tess2/include \
		-I$(OF_PATH)/libs/cairo/include/cairo \
		-I$(OF_PATH)/libs/fmodex/include \
		-I$(OF_PATH)/libs/poco/include
		




all: $(OF_STATIC_LIB)
	g++ main.cpp $(INCLUDES) $(LD_FLAGS) -o livecode

$(OF_STATIC_LIB):
	xcodebuild -configuration Release -project $(OF_PATH)/libs/openFrameworksCompiled/project/osx/openFrameworksLib.xcodeproj
	
$(PCH_FILE):
	echo "Precompiling ofMain.h"
	g++ $(OF_PATH)/libs/openFrameworks/ofMain.h -c $(ARCH) $(INCLUDES)


live: $(PCH_FILE) $(OF_STATIC_LIB)
	g++ $(LIVEFILE) -c -I$(OF_PATH)/libs/openFrameworks/ $(ARCH) -o livecode.o
	g++ -I. -dynamiclib $(ARCH) -o livecode.dylib livecode.o \
	$(OF_STATIC_LIB) \
		-undefined suppress -flat_namespace
	rm livecode.o	


clean:
	rm $(OF_STATIC_LIB)
	rm $(PCH_FILE)
	rm livecode.dylib
