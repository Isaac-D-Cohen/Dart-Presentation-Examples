import 'dart:math';

class AddOne {

  int? val;

  int compute() {
    if (val != null)  // maybe not null here
      return val+1;   // but null this time
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

  a.val = 20;
  print(a.compute());
}



