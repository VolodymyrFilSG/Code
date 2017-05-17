int Row1 = 1;
int Row2 = 2;
int Row3 = 3;
int Row4 = 4;
int Row5 = 5;
int Row6 = 6;
int Row7 = 7;
int Row8 = 8;
int RSerial = 9;
int BSerial = 10;
int GSerial = 11;
int RCLK = 12;
int SCLK = 13;
byte Bbitmap [8]={0,0,8,0,0,0,0,0};
byte Rbitmap [8]={255,255,247,255,255,255,255,255};
byte Gbitmap [8]={0,0,0,0,0,0,0,0};
// задаємо масиви
void setup() {pinMode(Row1, OUTPUT);
  pinMode(Row2, OUTPUT);
  pinMode(Row3, OUTPUT);
  pinMode(Row4, OUTPUT);
  pinMode(Row5, OUTPUT);
  pinMode(Row6, OUTPUT);
  pinMode(Row7, OUTPUT);
  pinMode(Row8, OUTPUT);
  pinMode(BSerial, OUTPUT);
  pinMode(GSerial, OUTPUT);
  pinMode(RSerial, OUTPUT);
  pinMode(RCLK, OUTPUT);
  pinMode(SCLK, OUTPUT);
}
void loop() {
 for (int row = 0; row <8; row++){
    //вимкнути все
    digitalWrite (Row1, LOW);
    digitalWrite (Row2, LOW);
    digitalWrite (Row3, LOW);
    digitalWrite (Row4, LOW);
    digitalWrite (Row5, LOW);
    digitalWrite (Row6, LOW);
    digitalWrite (Row7, LOW);
    digitalWrite (Row8, LOW);
    // set up the data in the shift registers
    for (int shiftbit = 0; shiftbit <8; shiftbit++){
      digitalWrite(BSerial, HIGH);
      digitalWrite(GSerial, HIGH);
      digitalWrite(RSerial, HIGH);
      if bitRead(Bbitmap[row],shiftbit) digitalWrite(BSerial, LOW);
      if bitRead(Gbitmap[row],shiftbit) digitalWrite(GSerial, LOW);
      if bitRead(Rbitmap[row],shiftbit) digitalWrite(RSerial, LOW);
      digitalWrite(SCLK, LOW);
      digitalWrite(SCLK, HIGH);
      }
    //latch the data
    digitalWrite(RCLK, HIGH);
    digitalWrite(RCLK, LOW); 
    // turn on the associated row
    if (row == 0) digitalWrite (Row1, HIGH);
    if (row == 1) digitalWrite (Row2, HIGH); 
    if (row == 2) digitalWrite (Row3, HIGH); 
    if (row == 3) digitalWrite (Row4, HIGH); 
    if (row == 4) digitalWrite (Row5, HIGH); 
    if (row == 5) digitalWrite (Row6, HIGH); 
    if (row == 6) digitalWrite (Row7, HIGH); 
    if (row == 7) digitalWrite (Row8, HIGH);
    delay(2);  
}   }

