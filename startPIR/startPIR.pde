// - - - - - - - - - - - - - - - - - - - - - - - 
// startPIR
// Introduction to Arduino and the Internet of Things Workshop
// 10/17/13
// BY Scott Sullivan and Erik Dahl / Involution Studios
// - - - - - - - - - - - - - - - - - - - - - - -

// - - - - IMPORT LIBRARIES
// imports the two external libraries we're using.

// - - - - GLOBAL VARIABLES
// gives names to all of the numbers we're going to be using.

// - - - - SETUP
// connect Arduino, when you first run the sketch, you will see
// a list of available ports at in the debug window, replace the "X"
// where it says "list()[X], 57600);" with the number of the port 
// that your Arduino is connected to.

// - - - - DRAW LOOP
// current move state is read from the Arduino's digital pin 2

// if the current move state is not the same as the last state, and the 
// current move state is 1, then do what's in the curly brackets.

// increase this integer by 1
// print value to the debug window

// make the last state the current state at the end of the loop



// - - - - - - - - - - - - - - - - - - - - - - - 
// IMPORT LIBRARIES
// - - - - - - - - - - - - - - - - - - - - - - - 
import processing.serial.*;
import cc.arduino.*;

// - - - - - - - - - - - - - - - - - - - - - - - 
// GLOBAL VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 
Arduino arduino;
int moveCount = 0;
int moveCurrentState = 0;
int moveLastState = 0;

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[X], 57600);

  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW LOOP
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  moveCurrentState = arduino.digitalRead(2); 

  if ((moveCurrentState != moveLastState) && (moveCurrentState == 1)) { 
    moveCount++; 
    println(moveCount);
  }

  moveLastState = moveCurrentState;
}

