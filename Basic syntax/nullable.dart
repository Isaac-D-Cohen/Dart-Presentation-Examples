
void main(){

  int? a;
  int b;

  if (a != null)
      b = a;  // fine
  else
      b = 75;

  print(b);   // fine
  b++;        // fine
}


