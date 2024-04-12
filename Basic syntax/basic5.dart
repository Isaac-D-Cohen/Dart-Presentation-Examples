

void main(){

  var myint = 10;
  print(myint);

  myint = false;
  // Error: A value of type 'bool' can't be
  // assigned to a variable of type 'int'.

  dynamic mybool = true;
  print(mybool);

  // but this is fine
  mybool = 2.718;
  print(mybool);

}
