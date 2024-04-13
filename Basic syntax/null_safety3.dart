import 'dart:math';

class AddOne {

  int? val;

  int compute() {
    int? copy_val = val;  // maybe null here

    if (copy_val != null)
      return copy_val+1;  // but def not null here
    else
      return 1;
  }
}


class MoodyVal extends AddOne {

  @override
  int? get val {

    Random r = Random();
    int randval = r.nextInt(2);

    return randval == 1? 123: null;
  }

}

void main(){
  AddOne a = AddOne();
  MoodyVal h = MoodyVal();

  a.val = 20;
  print(a.compute());

  h.val = 20;
  print(h.compute());
}



