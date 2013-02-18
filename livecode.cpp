
#include "ofMain.h"

class testApp: public ofBaseApp {
public:
	void setup() {
		ofSetCurrentRenderer(ofPtr<ofBaseRenderer>(new ofGLRenderer(false)));

		ofSetFrameRate(60);
		ofBackground(0, 0, 0);
		ofSetVerticalSync(true);
		ofEnableAlphaBlending();
		ofSetWindowShape(640, 380);
		ofSetWindowPosition(0,0);
	}
	
	
	void draw() {
		for(int j = 0; j < 10; j++) {
			ofSetColor(j*25, 100-j*10, 100-j*25, 150);
			
			ofBeginShape();
			ofVertex(ofGetWidth(), 0);
			ofVertex(0,0);
			

			for(int i = 0; i < ofGetWidth(); i+=4) {
				float xRange = ofGetHeight() - j*40;
				float freq = 100.f +pow(j, 2.5);
				float y = ofMap(sin(ofGetElapsedTimef()+i/freq), -1, 1, xRange, xRange+100);
				ofVertex(i, y);
			}
			
			ofEndShape();
		}
	}
	
	void keyPressed(int key) {
		if(key=='f') {
			ofToggleFullscreen();
		}
	}
};



// required by livecode-c++ to workls
extern "C" {	
	ofBaseApp *getAppPtr(ofAppBaseWindow *win) {
		return new testApp();
	}
};