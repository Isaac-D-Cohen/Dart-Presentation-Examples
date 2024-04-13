#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

#include <gmp.h>


#define FALSE 0
#define TRUE 1

void print_usage_info(){
    printf("\nUsage: fib <n1> <n2> <n3> to get fibonacci numbers n1, n2, and n3\n");
}

bool is_a_number(char * n){
    
    int i=0;
    
    while (n[i] != '\0'){
        if (!isdigit(n[i])) return FALSE;
        i++;
    }
    
    return TRUE;
}

void compute_and_print_fib(int n){

    if (n == 0){
        printf("0\n");
        return;
    }

    mpz_t a, b, c;

    mpz_init_set_str(a, "0", 10);
    mpz_init_set_str(b, "1", 10);
    mpz_init(c);

    for (int i=1; i<n; i++){
        mpz_add(c, a, b);
        mpz_swap(a, b);
        mpz_swap(b, c);
    }

    mpz_out_str(stdout, 10, b);
    putchar('\n');

    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(c);
}

int main(int argc, char * argv[]){
    
    if (argc < 2){
        print_usage_info();
        return 0;
    }


    for (int i=1; i<argc; i++){
        if (is_a_number(argv[i])){
            compute_and_print_fib(atoi(argv[i]));
        }
        else {
            printf("%s isn't a positive integer\n", argv[i]);
        }
    }
}
