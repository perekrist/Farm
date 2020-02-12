class Cell {
  int x, y;
  int cellSize = 50;
  int margin = 30;
  int state = CellState.EMPTY;
  int tik = 0;

  Cell (int i, int j) {
    this.x = i;
    this.y = j;
  }
  
  void draw() {
    if (state == CellState.EMPTY) {
      fill(255, 255, 255); 
    } else if (state == CellState.PLANTED) {
      fill(0, 0, 0);
    } else if (state == CellState.GREEN) {
      fill(0, 255, 0);
    } else if (state == CellState.YELLOW) {
      fill(255, 255, 0);
    } else if (state == CellState.RED) {
      fill(255, 0, 0);
    } else if (state == CellState.OVERFLOW) {
      fill(79, 23, 23);
    }
    rect(x * cellSize + margin, y * cellSize + margin + textSize, cellSize, cellSize);
  }
  
  void update() {
    if (state >= CellState.PLANTED) {
      tik += 1;
    }
    if (tik == 0) {
      state = CellState.EMPTY;
    } else if (tik <= interval) {
      state = CellState.PLANTED;
    } else if (tik <= interval * 4) {
      state = CellState.GREEN;
    } else if (tik <= interval * 6) {
      state = CellState.YELLOW;
    } else if (tik <= interval * 8) {
      state = CellState.RED;
    } else {
      state = CellState.OVERFLOW;
    }
    if (state >= CellState.OVERFLOW) {
      state = CellState.OVERFLOW;
    }
  }
  
  void onClick(int mX, int mY) {
    if (mX > x * cellSize + margin - cellSize / 2 && mX < x * cellSize + margin + cellSize / 2 
     && mY > y * cellSize + margin - cellSize / 2 + textSize && mY < y * cellSize + margin + cellSize / 2 + textSize) {
      if (state == CellState.EMPTY) {
        tik = 0;
        state = CellState.PLANTED;
        money -= 2;
      } else if (state == CellState.YELLOW) {
        state = CellState.EMPTY;
        tik = 0;
        money += 3;
      } else if (state == CellState.RED) {
        state = CellState.EMPTY;
        tik = 0;
        money += 5;
      } else if (state == CellState.OVERFLOW) {
        state = CellState.EMPTY;
        tik = 0;
        money -= 1;
      }  
    }
  }
  
}

interface CellState {
  int
  EMPTY = 0,
  PLANTED = 1,
  GREEN = 2,
  YELLOW = 3,
  RED = 4,
  OVERFLOW = 5;
}
