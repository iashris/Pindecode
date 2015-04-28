
String[] points;
String saved="";
String typing="";
float[][] data=new float[20000][3];
String[][] names=new String[20000][3];
int screen=600;
PFont myfont;
boolean A;
void setup() {
  
  size(600,650);
  // Load text file as a string
  points = loadStrings("IN.txt");
  // Convert string into an array of integers using ',' as a delimiterts
  for(int i=0;i<points.length;i++){
     String[] store=(split(points[i],','));
     data[i][0]=float(store[0]);
     data[i][1]=float(store[1]);
     data[i][2]=float(store[2]);
     names[i][0]=store[3];
     names[i][1]=store[4];
     names[i][2]=store[5];
     
  }
  myfont=createFont("Georgia",12);


}

void draw() {
  smooth();
  background(60);
  stroke(0,200,220);
  strokeWeight(2);
  textFont(myfont);
  text("Created By Ashris Choudhury",400,screen+30);
  text("Enter the PINCODE to view your place ", 20, screen+30);
  text(typing,300,screen);
  text(saved,300,screen);
  println(typing);
  for(int j=0;j<points.length;j++){
    String str1=str(data[j][2]);
  if(int(typing)==int(str1.substring(0,typing.length()))){
 
    stroke(255);
    A=true;
  }
  else{
    stroke(0,200,220);
  A=false;}
  
  float X=data[j][0]/float(3000/screen);
  float Y=data[j][1]/float(3000/screen);
  if(typing.length()==6 & A==true){
    noFill();
    stroke(255,255,0);
    ellipse(X,Y,15,15);
    text(names[j][0],330,20);
    text(names[j][1],330,40);
    text(names[j][2],330,60);
  }
  point(X,Y);
  
  
  
  }
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (String.fromCharCode(key) == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
//    if (String.fromCharCode(keyCode) == BACKSPACE) {
//typing = typing.substring(0, typing.length() - 1);
//} 
//else
if (String.fromCharCode(key) != CODED) typing += String.fromCharCode(key);
  }
}
