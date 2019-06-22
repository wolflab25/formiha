#define REDLAMP1 2
#define REDLAMP2 3
#define REDLAMP3 4
#define GREENLAMP1 5
#define GREENLAMP2 6
#define GREENLAMP3 7
#define REDBUTTON1 8
#define REDBUTTON2 9
#define REDBUTTON3 10
#define GREENBUTTON1 11
#define GREENBUTTON2 12
#define GREENBUTTON3 13
#define RESETBUTTON A0
#define TIMEOUT 15000

int vote1=0;
int vote2=0;
int vote3=0;
int btnstate=0;



void setup() {
  
  // put your setup code here, to run once:
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(REDLAMP1, OUTPUT);
  pinMode(REDLAMP2, OUTPUT);
  pinMode(REDLAMP2, OUTPUT);
  pinMode(GREENLAMP1, OUTPUT);
  pinMode(GREENLAMP2, OUTPUT);
  pinMode(GREENLAMP3, OUTPUT);
  pinMode(GREENBUTTON1, INPUT_PULLUP);
  pinMode(GREENBUTTON2, INPUT_PULLUP);
  pinMode(GREENBUTTON3, INPUT_PULLUP);
  pinMode(REDBUTTON1, INPUT_PULLUP);
  pinMode(REDBUTTON2, INPUT_PULLUP);
  pinMode(REDBUTTON3, INPUT_PULLUP);

}

void loop() {
  // put your main code here, to run repeatedly:
  if (vote1==0){
    btnstate=digitalRead(GREENBUTTON1);
    if (btnstate==0){
      digitalWrite(GREENLAMP1,0);
      vote1=1;
    }  
    btnstate=digitalRead(REDBUTTON1);
    if (btnstate==0){
      digitalWrite(REDLAMP1,0);
      vote1=1;
    }  
  }

  if (vote2==0){
    btnstate=digitalRead(GREENBUTTON2);
    if (btnstate==0){
      digitalWrite(GREENLAMP2,0);
      vote2=1;
    }  
    btnstate=digitalRead(REDBUTTON2);
    if (btnstate==0){
      digitalWrite(REDLAMP2,0);
      vote2=1;
    }  
  }

  if (vote3==0){
    btnstate=digitalRead(GREENBUTTON3);
    if (btnstate==0){
      digitalWrite(GREENLAMP3,0);
      vote3=1;
    }  
    btnstate=digitalRead(REDBUTTON3);
    if (btnstate==0){
      digitalWrite(REDLAMP3,0);
      vote3=1;
    }  
  }
int vote = vote1+vote2+vote3;

if (vote==3){
  delay(TIMEOUT);
  vote1=0;
  vote2=0;
  vote3=0;
  digitalWrite(REDLAMP1,1);
  digitalWrite(REDLAMP2,1);
  digitalWrite(REDLAMP3,1);
  digitalWrite(GREENLAMP1,1);
  digitalWrite(GREENLAMP2,1);
  digitalWrite(GREENLAMP3,1);
}
}
