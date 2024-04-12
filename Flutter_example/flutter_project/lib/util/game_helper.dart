import 'dart:math';

// Setting the environment variables for the game board
class MineSweeperGame {
      // setting game variables
      static int row = 8;
      static int col = 8;
      static int cells = row * col;
      bool gameOver = false;
      bool gameWon = false;
      int flags = 10;
      List<Cell> gameMap = [];
      static List<List<dynamic>> map = List.generate(row, (x) => List.generate(col, (y) => Cell(x,y,"",false)));

      // Function to generate the game board
      void generateMap() {
      	   PlaceMines(10);
     	   for(int i = 0; i < row; i++) {
     	   	   for(int j = 0; j < col; j++) {
	     	   	   gameMap.add(map[i][j]);
	     	   }
           }
      }

      // Function to reset the game board
      void resetGame() {
            map = List.generate(
     	            row, (x) => List.generate(col, (y) => Cell(x,y,"",false)));
     	      gameMap.clear();
     	      generateMap();
            gameWon = false;
            flags = 10;
      }

      // Create a function to randomly place the mines on the board
      static void PlaceMines(int minesNumber) {
            Random random = Random();
       	for(int i = 0; i < minesNumber; i++) {
       	      int mineRow = random.nextInt(row);
	            int mineCol = random.nextInt(col);
	            map[mineRow][mineCol] = Cell(mineRow,mineCol,"X",false);
       	}
      }

      // Show the mines if we lose the game
      void showMines() {
            for(int i = 0; i < row; i++) {
                  for(int j = 0; j < col; j++) {
                        if(map[i][j].content == "X") {
                              map[i][j].reveal = true;
                        }
                  }
            }
      }

      void checkGameWin() {
            for(int i = 0; i < 8; i++) {
                  for(int j = 0; j < 8; j++) {
                        if(!(map[i][j].reveal || map[i][j].flagged)) {
                              return;
                        }
                  }
            }
            gameWon = true;
      }

      void getRightClickedCell(Cell cell) {
            if(cell.flagged) {
                  cell.flagged = false;
                  flags++;
                  
                  return;
            }
            if(flags > 0) {
                  cell.flagged = true;
                  flags--;
                  
                  checkGameWin();
            }
      }

      // Function to calculate outcome when particular cell is clicked
      void getClickedCell(Cell cell) {
            if(cell.content == "X") {
                  showMines();
                  gameOver = true;
            } else {
                  int mineCount = 0;
                  int cellRow = cell.row;
                  int cellCol = cell.col;

                  // Checking for the number of mines in the immediate neighborhood of the chosen cell
                  for(int i = max(cellRow - 1, 0); i <= min(cellRow+1,row-1);i++) {
                        for(int j = max(cellCol - 1,0); j <= min(cellCol+1,col-1);j++) {
                              if(map[i][j].content == "X") {
                                    mineCount++;
                              }
                        }
                  }
                  cell.content = mineCount;
                  cell.reveal = true;

                  // Reveal adjacent cells if there are 0 mines nearby
                  if(mineCount == 0) {
                        for(int i = max(cellRow - 1,0); i <= min(cellRow+1,row-1);i++) {
                              for(int j = max(cellCol-1,0); j <= min(cellCol+1,col-1); j++) {
                                    if(map[i][j].content == "") {
                                          getClickedCell(map[i][j]);
                                    }
                              }
                        }
                  }
            }
            checkGameWin();
      }
}

class Cell {
      int row;
      int col;
      dynamic content;
      bool reveal = false;
      bool flagged = false;
      Cell(this.row,this.col,this.content,this.reveal);
}