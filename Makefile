CC = llvm-g++
LD_FLAGS = of64/libs/openFrameworksCompiled/lib/osx/openFrameworksDebug.a \
				-framework OpenGL -framework GLUT -framework Carbon -framework CoreAudio
INCLUDES = -Iof64/libs/openFrameworks/ \
		-Iof64/libs/openFrameworks/3d \
		-Iof64/libs/openFrameworks/app \
		-Iof64/libs/openFrameworks/communication \
		-Iof64/libs/openFrameworks/events \
		-Iof64/libs/openFrameworks/gl \
		-Iof64/libs/openFrameworks/graphics \
		-Iof64/libs/openFrameworks/math \
		-Iof64/libs/openFrameworks/sound \
		-Iof64/libs/openFrameworks/types \
		-Iof64/libs/openFrameworks/utils \
		-Iof64/libs/openFrameworks/video \
		-Iof64/libs/glew/include \
		-Iof64/libs/tess2/include \
		-Iof64/libs/poco/include
		

OF_STATIC_LIB = of64/libs/openFrameworksCompiled/lib/osx/openFrameworks.a
PCH_FILE = of64/libs/openFrameworks/ofMain.h.gch
all:
	g++ main.cpp $(INCLUDES) $(LD_FLAGS) -o livecode


$(PCH_FILE):
	echo "Precompiling ofMain.h"
	g++ of64/libs/openFrameworks/ofMain.h -c $(INCLUDES)


live: $(PCH_FILE)	
	g++ livecode.cpp -c -Iof64/libs/openFrameworks/
	g++ -I. -dynamiclib -o livecode.dylib livecode.o \
	$(OF_STATIC_LIB) \
		-undefined suppress -flat_namespace
	rm livecode.o	



liveslow: $(PCH_FILE)	
	g++ livecode.cpp -c -Iof64/libs/openFrameworks/
	g++ -I. -dynamiclib -o livecode.dylib livecode.o \
		$(OF_STATIC_LIB) \
		-framework OpenGL -framework GLUT -framework Carbon -framework CoreAudio
	rm livecode.o	


