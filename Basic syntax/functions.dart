// Required positional parameters: must be provided in the exact same
void a1(int a, int b){}   // a1(1, 2) => 1, 2;   a2(1, null) => error
void a2(int a, int? b){}  // a2(1, 2) => 1, 2;   a2(1, null) => 1, null

// Optional, positional parameters: can be provided or skipped. Might have a default value, might be nullable
void b(int a, [int? b]){}      // b(1) => 1, null; b(1, null) => 1, null;     b(1, 5) => 1, 5
void c(int a, [int? b = 1]){}  // c(1) => 1, 1;    c(1, null) => 1, null;     c(1, 5) => 1, 5
void d(int a, [int b = 1]){}   // d(1) => 1, 1;    d(1, null) => error;       d(1, 5) => 1, 5

// Optional, named parameters: can be provided or skipped. Might have a default value, might be nullable.
void e(int a, {int? b}){}      // e(1) => 1, null; e(1, b: null) => 1, null;  e(1, b: 5) => 1, 5
void f(int a, {int? b = 1}){}  // f(1) => 1, 1;    f(1, b: null) => 1, null;  f(1, b: 5) => 1, 5
void g(int a, {int b = 1}){}   // g(1) => 1, 1;    g(1, b: null) => error;    g(1, b: 5) => 1, 5

// Required, named parameters: must be provided. Cannot have a default value, might be nullable.
void h(int a, {required int? b}){} // h(1) => error; h(1, b: null) => 1, null; h(1, b: 5) => 1, 5
void i(int a, {required int b}){}  // i(1) => error; i(1, b: null) => error;   i(1, b: 5) => 1, 5

void main(){
  a1(1);
}
