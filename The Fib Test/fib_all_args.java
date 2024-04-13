import java.math.BigInteger;

class fib_all_args {

    static void print_usage_info(){
        System.out.println("\nUsage: fib <n1> <n2> <n3> to get fibonacci numbers n1, n2, and n3\n");
    }

    static void compute_and_print_fib(int n){

        if (n == 0){
            System.out.println("0");
            return;
        }

        BigInteger a, b, c;

        a = BigInteger.valueOf(0);
        b = BigInteger.valueOf(1);

        for (int i=1; i<n; i++){
            c = a.add(b);
            a = b;
            b = c;
        }

        System.out.println(b.toString());
    }

    public static void main(String[] args){

        if (args.length == 0){
            print_usage_info();
            System.exit(0);
        }

        int n;

        for (String s: args){
            try {
                n = Integer.parseInt(s);
            } catch (Exception e){
                System.out.println(e.toString());
                continue;
            }

            compute_and_print_fib(n);
        }
    }
}
