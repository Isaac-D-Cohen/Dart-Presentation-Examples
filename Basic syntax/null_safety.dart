
class AddOne {

  int? val;

  int compute() {
    if (val != null)
      return val+1;   // error
    else
      return 1;
  }
}

void main(){
  AddOne a = AddOne();

  a.val = 20;
  print(a.compute());
}


