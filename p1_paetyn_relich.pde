boolean buttonUp = false;
boolean buttonDown = false; 
boolean buttonHelp = false;
boolean buttonOpen = false;
boolean buttonClose = false;
boolean buttonAlarm = false;
color buttonColor;
color buttonIn;
boolean displayMessageUp = false;
boolean displayMessageDown = false;
boolean displayOpen = false;
boolean displayOpening = false;
boolean displayClosed = false;
boolean displayClosing = false;
boolean displayAlarm = false;
boolean displayHelp = false;
boolean paused = false;
int time;
final int DOOR_DURATION_UP = 5000;
final int DOOR_DURATION_CLOSE = 10000;
final int DISPLAY_DURATION = 15000; 
int floor = 0;


void setup() {
  size(200, 400);
  time = millis();
}

void draw() {
  background(#FFFFFF);
  if(paused){
    emergencyButton();
  }
  else{
    if(floor != 1){
      text("You are on the first floor...", 40, 25);
      fill(0);
      if(displayOpen){
        text("DOORS OPENING", 56, 35);
        fill(buttonColor = color(200));
        rect(75, 50, 50, 50, 28);
        fill(0);
        if(millis() - time > DOOR_DURATION_UP){
          displayOpen = false;
        }
      }
      else if(displayClosed){
          text("DOORS CLOSING", 56, 35);
          fill(buttonColor = color(200));
          rect(75, 50, 50, 50, 28);
          fill(0);
          emergencyButton();
          if(millis() - time > DOOR_DURATION_CLOSE){
            displayClosed = false;
          }
      }
      else if(buttonUp){
        if(displayMessageUp){
          fill(buttonColor = color(#05FF2C));
          rect(75, 50, 50, 50, 28);
          text("ELEVATOR GOING UP", 47, 45);
          emergencyButton();
          if(millis() - time > DISPLAY_DURATION){
            buttonUp = false;
            displayMessageUp = false;
            floor = floor + 1;
          }
        }
       } 
    else{
      fill(buttonColor = color(500));
    }
    buttonColor = color(300);
    fill(buttonColor);
    rect(75, 50, 50, 50, 28);
    fill(0);
    text("UP", 92, 80);
    } else {
      text("You are on the second floor...", 38, 25);
      fill(0);
      if(displayOpen){
        text("DOORS OPENING", 56, 35);
        fill(0);
        if(millis() - time > DOOR_DURATION_UP){
          displayOpen = false;
        }
      }
      else if(displayClosed){
        text("DOORS CLOSING", 56, 35);
        fill(0);
        emergencyButton();
        if(millis() - time > DOOR_DURATION_CLOSE){
          displayClosed = false;
        }
      }
      else if(buttonDown){
        if(displayMessageDown){
          fill(buttonColor = color(#05FF2C));
          rect(75, 150, 50, 50, 28);
          text("ELEVATOR GOING DOWN", 43, 40);
          emergencyButton();
          if(millis() - time > DISPLAY_DURATION){
            buttonDown = false;
            displayMessageDown = false;
            floor = floor - 1;
          }
        }
      }
      else{
        fill(buttonColor = color(500));
      }
      buttonColor = color(300);
      fill(buttonColor);
      rect(75, 150, 50, 50, 28);
      fill(0);
      text("DOWN", 84, 180);
    }
  }
}

void emergencyButton(){
  if(buttonOpen){
   if(displayOpening){
     fill(buttonColor = color(#D8D7D6));
     rect(45, 245, 50, 50);
     text("DOORS OPENING", 56, 35);
   }
  }
  if(buttonClose){
    if(displayClosing){
      fill(buttonColor = color(#D8D7D6));
      rect(110, 245, 50, 50);
      text("DOORS CLOSING", 56, 35);
      delay(100);
    }
  }
  if(buttonAlarm){
    if(displayAlarm){
      fill(buttonColor = color(#FF4400));
      rect(45, 305, 50, 50);
      text("ALARM SOUNDING", 56, 35);
    }
  }
  if(buttonHelp){
    if(displayHelp){
      fill(buttonColor = color(#FF4400));
      rect(110, 305, 50, 50);
      text("CALLING HELP", 56, 35);
    }
  }
  else{
    fill(buttonColor = color(500));
  }
  
  buttonColor = color(300);
  fill(buttonColor);
  rect(45, 245, 50, 50);
  fill(0);
  text(" OPEN\nDOORS", 54, 265);
  fill(200);
  
  buttonColor = color(300);
  fill(buttonColor);
  rect(110, 245, 50, 50);
  fill(0);
  text(" CLOSE\nDOORS", 119, 265);
  fill(100);
  
  buttonColor = color(300);
  fill(buttonColor);
  rect(45, 305, 50, 50);
  fill(0);
  text("ALARM", 54, 335);
  fill(100);
  
  buttonColor = color(300);
  fill(buttonColor);
  rect(110, 305, 50, 50);
  fill(0);
  text("HELP", 122, 335);
  fill(100);
 
}

void mousePressed() {
  
  if(mouseX > 75 && mouseX < 125 && mouseY > 50 && mouseY < 100){
    buttonUp = !buttonUp;
    displayOpen = !displayOpen;
    displayClosed = !displayClosed;
    displayMessageUp = !displayMessageUp;
    time = millis();
  }
  if(mouseX > 75 && mouseX < 125 && mouseY > 150 && mouseY < 200){
    buttonDown = !buttonDown;
    displayOpen = !displayOpen;
    displayClosed = !displayClosed;
    displayMessageDown = !displayMessageDown;
    time = millis();

  }
  if(mouseX > 45 && mouseX < 95 && mouseY > 245 && mouseY < 295){
    paused = !paused;
    buttonOpen = !buttonOpen;
    buttonClose = !buttonClose;
    displayOpening = !displayOpening;
  }
  if(mouseX > 110 && mouseX < 160 && mouseY > 245 && mouseY < 295){
    paused = !paused;
    buttonClose = !buttonClose;
    buttonOpen = !buttonOpen;
    displayClosing = !displayClosing;
  }
  if(mouseX > 45 && mouseX < 95 && mouseY > 305 && mouseY < 355){
    paused = !paused;
    buttonAlarm = !buttonAlarm;
    displayAlarm = !displayAlarm;
  }
  if(mouseX > 110 && mouseX < 160 && mouseY > 305 && mouseY < 355){
    paused = !paused;
    buttonHelp = !buttonHelp;
    displayHelp = !displayHelp;
  }
    
}
