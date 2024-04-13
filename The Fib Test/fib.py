# not equivalent to the other programs, just here as a yardstick

import sys

def fib(x):

    a=0
    b=1

    for i in range(1,x):
        c = a+b
        a = b
        b = c

    print(c)

sys.set_int_max_str_digits(1000000)
fib(1000000)
