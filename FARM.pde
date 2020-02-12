 int cols = 4;
 int rows = 4;
 Cell[][] cells;
 int money = 100;
 int textSize = 20;
 int interval = 10;
  
void setup(){
  size(210, 230);

  cells = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j] = new Cell(i, j);
    }
  }
}

void update(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j].update();
    }
  }
}
 
void draw(){
  background(0, 0, 0);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) { 
      cells[i][j].update();
      cells[i][j].draw();
    }
  }
 
 fill(255);
 rectMode(CENTER);
 //circle(mouseX, mouseY, 25);
 //noCursor();
 text("Money: " + money, 10, textSize); 
 text("- " + interval + " +", 165, textSize); 
}

void mousePressed() {
  fill(255);
  circle(mouseX, mouseY, 25);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) { 
      cells[i][j].onClick(mouseX, mouseY);
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    interval += 1;
  } else if (keyCode == LEFT) {
    interval -= 1;
  }
}
