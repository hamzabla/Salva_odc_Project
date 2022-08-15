#include <SPI.h> // Communication Protocol Used by NRF24L01 Modules
#include <nRF24L01.h>
#include <RF24.h>
//create an RF24 object
RF24 radio(7, 8);  // CE, CSN

//address through which two modules communicate.
const byte address[6] = "00001";

//Assigning analog pins
int brushless = A0;  
int servo = A1;

int B_motor = 0;
int S_motor = 0;

int packet[2] ; // data to be sent over the radio waves

void setup()
{
  radio.begin();
  Serial.begin(9600);
  
  pinMode(brushless,INPUT);
  pinMode(servo,INPUT);

  //set the address
  radio.openWritingPipe(address);
  //Set module as transmitter
  radio.stopListening();
}
void loop()
{
  B_motor = analogRead(brushless);
  S_motor = analogRead(servo);

  //mapping the analog values, to a desired range
  packet[0] = map(B_motor,0,1023,-150,150); // Brushless motors
  packet[1] = map(S_motor,0,1023,0,180);    // Servo Motors
  
  Serial.print("mapX Brushless: ");
  Serial.println(packet[0]);
  Serial.print("mapX Servo : ");
  Serial.println(packet[1]);
  delay(250);
  radio.write(&packet, sizeof(packet));
}
