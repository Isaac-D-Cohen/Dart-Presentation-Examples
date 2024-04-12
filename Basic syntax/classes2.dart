class mike_lewis {

  void get quiz => print("holy cow");
  void set quiz(var a) => print("holy cow ${a}");
}

void main(){
  mike_lewis t = mike_lewis();
  t.quiz = 5;
  t.quiz = "Ha";
}
