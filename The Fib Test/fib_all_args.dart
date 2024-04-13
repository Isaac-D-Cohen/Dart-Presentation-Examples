import "dart:core";

void print_usage_info(){
    print("\nUsage: fib <n1> <n2> <n3> to get fibonacci numbers n1, n2, and n3\n");
}

void compute_and_print_fib(int n){

  if (n == 0){
    print("0\n");
    return;
  }

  BigInt a = BigInt.zero;
  BigInt b = BigInt.one;
  BigInt c;

  for (int i=1; i<n; i++){
    c = a + b;
    a = b;
    b = c;
  }

  print("${b}\n");
}

void main(List<String> args){

  if (args.length == 0){
    print_usage_info();
    return;
  }

  int? n;

  for (int i=0; i<args.length; i++){
    n = int.tryParse(args[i]);

    if (n == null){
      print("${args[i]} isn't a positive integer\n");
    }
    else {
      compute_and_print_fib(n);
    }
  }
}
