
/*
 Stepper Motor Control

 This program drives a unipolar or bipolar stepper motor.
 The motor is attached to digital pins 2 - 5 of the Arduino.

 The motor should rotate by specified number of steps.
 The specified number of steps come from MATLAB via serial connection 

 Program written for the course ENME489C.

 */

#include <Stepper.h>

int requiredSteps = 0;  // to build 2 byte integer from serial in coming from MATLAB
short dir; // Direction of Rotation; 1 for clockwise 2 for anticlockwise
const int stepsPerRevolution = 200; // Pull this value from the Stepper Motor Spec Sheet

// initialize the stepper library on pins 2 through 5:
Stepper myStepper(stepsPerRevolution, 2, 3, 4, 5);

void setup() {
  // initialize the serial port:
  Serial.begin(9600);
  Serial.println('a');
  char a = 'b';
  while (a != 'a')
  {
    a = Serial.read();
  }

  // set the speed at 60 rpm:
  myStepper.setSpeed(60);
}

void loop() {
  
  while (Serial.available() == 0)
  {
  }
  
  if(Serial.available()>0)
  {
    dir = Serial.read();
    delay(10);
    requiredSteps = Serial.parseInt();
    if (dir == 1)
      {
        //clockwise;
        myStepper.step(requiredSteps);
      }
    else
    {
      //counterclockwise;
      myStepper.step(-(requiredSteps));
    }
      
    delay(500);
    //Serial.println('d');
  }

}

