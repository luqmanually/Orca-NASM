# Organic Netwide Assembler project (ORGA-NASM)

My first x86 Assembly project. The assembler I used is [NASM](https://www.nasm.us/).
I followed [fireship](https://github.com/fireship-io)'s [Assembly Language in 100 seconds](https://www.youtube.com/watch?v=4gwYkEK0gOk) video to get started.

## To compile the code

```sh
nasm -felt64 script.asm # Convert the code to an object
```

```sh
ld app.o -o app # Convert the object to an executable
```

```sh
./app # Run the executable
```
