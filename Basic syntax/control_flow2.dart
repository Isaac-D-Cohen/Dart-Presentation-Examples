/*
 * If you are wondering what the heck this is, see
 * goto considered harmful considered harmful by Frank Rubin
 * in Communications of the ACM
 */


import 'dart:math';
import 'dart:io';

const int ROWS = 12;
const int COLS = 7;

const int MAX_ARR_NUM = 10;
const int ZERO_FORCE_FREQ = 3;


int get_rand(Random rng){

  int r1 = rng.nextInt(ZERO_FORCE_FREQ);
  int r2 = rng.nextInt(MAX_ARR_NUM);

  if (r1 == 0) return r2;
  return 0;
}

void print_matrix(List<List<int>> x){
  for (int i=0; i<x.length; i++){
      for (int j=0; j<x[i].length; j++)
          stdout.write("${x[i][j]} ");
      print("");
  }
}

void fill_matrix(List<List<int>> x, Random rng){

  for (int i=0; i<ROWS; i++){
    List <int> temp = [];

    for (int j=0; j<COLS; j++){
      temp.add(get_rand(rng));
    }

    x.add(temp);
  }
}

void task_c_style(List<List<int>> x) {
  int i, j;

  for (i = 0; i < ROWS; i++){
    for (j = 0; j < COLS; j++)
      if (x[i][j] != 0) break;

    if (j != COLS) continue;

    for (j = 0; j < COLS; j++)
      stdout.write("${x[i][j]} ");
    break;
  }
}

void task(List<List<int>> x) {
  int i, j;

  outter:
  for (i = 0; i < ROWS; i++){
    for (j = 0; j < COLS; j++)
      if (x[i][j] != 0) continue outter;

    for (j = 0; j < COLS; j++)
      stdout.write("${x[i][j]} ");
    break;
  }
}

void main() {
  Random rng = Random();
  List <List<int>> x = [];

  fill_matrix(x, rng);

  print_matrix(x);
  stdout.write("\n\n\n");
  task(x);
  print("");
}
