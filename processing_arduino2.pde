import processing.serial.*;

Serial myPort;
float siz=100;
int SerialData;
int countDown;
int value;

int m; 
int starttime;
int seconds;
boolean timeOver;


void setup(){
  size(500,500);
  background(0);
  //frameRate(30);
  printArray(Serial.list());
  myPort=new Serial(this, Serial.list()[1],9600);
  timeOver = false;  
  value = 0;
}

void draw(){
    background(0);
  
  while(myPort.available()>0){
    SerialData=myPort.read();
    if(SerialData == 1)
      value = 1;
    println("port value: " + SerialData); 
    println("countdown: " + countDown);
    }
    
   if(!timeOver){
     timeOver = counter();
   }     
   
   if(value == 1 && !timeOver){
       textSize(80);
       text("You win!", 50, 300); 
    }else if(value != 1 && !timeOver){
      textSize(200);
      text(countDown, 140, 200);
    }else if(value != 1 && timeOver){
       text("Game Over", 50, 300);
  }
}

boolean counter(){
    m =  millis();
    seconds =  m / 1000;
    starttime = 18;  
    countDown = starttime - seconds;
    
     if(countDown==0){
       textSize(80);
       
       return true;
     }else{
       fill(255);
       textSize(50);
       return false;
     }    
}