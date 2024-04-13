all: libstdoutgiver.so

libstdoutgiver.so: stdout_giver.c
	gcc -shared -o libstdoutgiver.so -fPIC stdout_giver.c

clean:
	rm -rf libstdoutgiver.so
