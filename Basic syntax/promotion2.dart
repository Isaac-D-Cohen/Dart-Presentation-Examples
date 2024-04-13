
int add_one(int? val) {
  if (val != null)
    return val+1;
  else
    return 1;
}

void main(){
  print(add_one(20));
  print(add_one(null));
}


