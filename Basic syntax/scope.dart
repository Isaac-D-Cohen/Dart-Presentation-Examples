int x = 119;

int function() {
  return x;
}

void main() {
  x = 4;

  {
    int x = 10;
    print(function()); // prints 4
  }
  print(function()); // prints 4
}
