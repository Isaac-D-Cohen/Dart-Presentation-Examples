use num_bigint::BigUint;
use num_traits::{One, Zero};
use std::env;

fn print_usage_info() {
    println!("\nUsage: fib <n1> <n2> <n3> to get fibonacci numbers n1, n2, and n3\n");
}

fn compute_and_print_fib(n: usize) {
    if n == 0 {
        println!("0");
        return;
    }

    let mut a: BigUint = Zero::zero();
    let mut b: BigUint = One::one();
    let mut c: BigUint;

    for _ in 1..(n) {
        c = a + &b;
        a = b;
        b = c;
    }

    println!("{b}");
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        print_usage_info();
        return;
    }

    for i in 1..args.len() {
        match args[i].trim().parse() {
            Ok(num) => compute_and_print_fib(num),
            Err(_) => println!("{} isn't a positive integer", args[i]),
        };
    }
}
