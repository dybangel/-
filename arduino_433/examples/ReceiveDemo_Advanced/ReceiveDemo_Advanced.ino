/*
  Example for receiving
  
  http://code.google.com/p/rc-switch/
  
  If you want to visualize a telegram copy the raw data and 
  paste it into http://test.sui.li/oszi/
*/

#include <RCSwitch.h>
#define NOTE_DH1 589 
RCSwitch mySwitch = RCSwitch();
int tonePin=5;//蜂鸣器的pin 

void setup() {
  Serial.begin(115200);
  mySwitch.enableReceive(0);  // Receiver on inerrupt 0 => that is pin #2
    pinMode(tonePin,OUTPUT);//设置蜂鸣器的pin为输出模式
}

void loop() {
  if (mySwitch.available()) {
    tone(tonePin,NOTE_DH1);
    delay(400);
    noTone(tonePin);
 //   output(mySwitch.getReceivedValue(), mySwitch.getReceivedBitlength(), mySwitch.getReceivedDelay(), mySwitch.getReceivedRawdata(),mySwitch.getReceivedProtocol());
 
   Serial.print(mySwitch.getReceivedValue());
   //凤鸣  
    Serial.println();
  
  
   
   //output(mySwitch.getReceivedValue());
    mySwitch.resetAvailable();
  }
}
