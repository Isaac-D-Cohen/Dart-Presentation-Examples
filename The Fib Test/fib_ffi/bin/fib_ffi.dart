// this is to test whether/how much Dart would get a speed boost
// from using the gmp library that the C version uses
// rather than Dart's own BigInt library
// the gmp library is written in C
// also it demonstrates interoperability with a native C lib

import "dart:core";
import 'dart:ffi' as ffi;
import 'dart:ffi' show Pointer, Void, Uint64, Int32;
import 'package:ffi/ffi.dart' show Arena;

typedef init_or_clear = void Function(Pointer<Void>);
typedef set_u = void Function(Pointer<Void>, int);
typedef adder = void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>);
typedef swapper = void Function(Pointer<Void>, Pointer<Void>);
typedef printer = void Function(Pointer<Void>, int, Pointer<Void>);
typedef stdout = Pointer<Void> Function();

typedef init_or_clear_func = Void Function(Pointer<Void>);
typedef set_u_func = Void Function(Pointer<Void>, Uint64);
typedef adder_func = Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>);
typedef swapper_func = Void Function(Pointer<Void>, Pointer<Void>);
typedef printer_func = Void Function(Pointer<Void>, Int32, Pointer<Void>);
typedef stdout_func = Pointer<Void> Function();


void print_usage_info(){
    print("\nUsage: fib <n1> <n2> <n3> to get fibonacci numbers n1, n2, and n3>\n");
}

void compute_and_print_fib(int n, init_or_clear init, init_or_clear clear, set_u setter, adder add, swapper swap, printer p, Pointer<Void> standard_out){

  if (n == 0){
    print("0\n");
    return;
  }

  final arena = Arena();

  Pointer<Void> a = arena<Int32>().cast();
  Pointer<Void> b = arena<Int32>().cast();
  Pointer<Void> c = arena<Int32>().cast();


  setter(a, 0);
  setter(b, 1);
  init(c);

  for (int i=1; i<n; i++){
    add(c, a, b);
    swap(a, b);
    swap(b, c);
  }

  p(standard_out, 10, b);

  // clear(a);
  // clear(b);
  // clear(c);
}

void main(List<String> args){

  if (args.length == 0){
    print_usage_info();
    return;
  }


  final dylib = ffi.DynamicLibrary.open('/lib/x86_64-linux-gnu/libgmp.so.10.5.0');

  final init_or_clear init = dylib.lookup<ffi.NativeFunction<init_or_clear_func>>('__gmpz_init').asFunction();
  final init_or_clear clear = dylib.lookup<ffi.NativeFunction<init_or_clear_func>>('__gmpz_clear').asFunction();
  final set_u setter = dylib.lookup<ffi.NativeFunction<set_u_func>>('__gmpz_init_set_ui').asFunction();
  final adder add = dylib.lookup<ffi.NativeFunction<adder_func>>('__gmpz_add').asFunction();
  final swapper swap = dylib.lookup<ffi.NativeFunction<swapper_func>>('__gmpz_swap').asFunction();
  final printer p = dylib.lookup<ffi.NativeFunction<printer_func>>('__gmpz_out_str').asFunction();

  final stdout_dylib = ffi.DynamicLibrary.open('/home/isaac/Dart/The\ Fib\ Test/fib_ffi/bin/libstdoutgiver.so');

  // final arena = Arena();
  // Pointer<ffi.Void> stdout = arena<ffi.Int32>().cast();    // it doesn't matter what Dart thinks the pointer "points to"
  final stdout stdout_giver = stdout_dylib.lookup<ffi.NativeFunction<stdout_func>>('get_stdout').asFunction();

  Pointer<Void> standard_out = stdout_giver();

  int? n;

  for (int i=0; i<args.length; i++){
    n = int.tryParse(args[i]);

    if (n == null){
      print("${args[i]} isn't a positive integer\n");
    }
    else {
      compute_and_print_fib(n, init, clear, setter, add, swap, p, standard_out);
    }
  }
}


