int x = 119;

void main() {
  int x =2;
  x = 4;

  int x = 30;

  {
    int x = 10;
    print(function()); // prints 4
  }
  print(function()); // prints 4
}
