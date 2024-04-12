
class MyException implements Exception {
  String? msg;
  MyException() {
    msg = "Major issue";
  }
}

void throw_something(){
  throw MyException();
}

void th4(){
  throw 4;
}

void main(){
  try {
    throw_something();
  } on MyException catch (e) {
    print(e.msg);
  }

  try {
    th4();
  } on int catch (a) {
    print("Got ${a}");
  }
}


