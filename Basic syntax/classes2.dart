class mike_lewis {

  String get quiz {
    print("holy cow");
    return "Mike Lewis is funny";
  }

  void set quiz(var a) => print("holy cow ${a}");
}

void main(){
  mike_lewis t = mike_lewis();
  print(t.quiz);

  t.quiz = 5;
  t.quiz = "Ha";
}
