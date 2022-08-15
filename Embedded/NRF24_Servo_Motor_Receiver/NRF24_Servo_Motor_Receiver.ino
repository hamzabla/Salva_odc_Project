#include <SPI.h> // (Communication protocol Used by NRF24L01)to interface with the NRF24L01 Modules 
#include <nRF24L01.h>
#include <RF24.h>
#include<Servo.h> // for controlling the Brushless & Servo Motors

Servo B,S; // Creating Servo objects 

//create an RF24 object
RF24 radio(7, 8);  // CE, CSN

int packet[2];//Storing received data from the NRF24(Transmitter)

//address through which two modules communicate.
const byte address[6] = "00001";

void setup()
{
  while (!Serial);
    Serial.begin(9600);
  
  radio.begin(); // initializing radio communication
  //Attaching each motor to a digital pin
  S.attach(6);
  B.attach(5);
  
  //set the address
  radio.openReadingPipe(0, address);
  
  //Set module as receiver(Listening Mode)
  radio.startListening();
}

void loop()
{
  //Read the data if available in buffer
  if (radio.available())
  {
    radio.read(&packet, sizeof(packet)); // reading the received data
    
    S.write(packet[1]); // controlling the servo motor
    B.write(packet[0]); // controlling the brushless motors

    Serial.print("Brushless : ");
    Serial.println(packet[0]);
    Serial.print("Servo : ");
    Serial.println(packet[1]);
  }
}
