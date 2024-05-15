# Organic Netwide Assembler project (ORGA-NASM)

My first x86 Assembly project. The assembler I used is [NASM](https://www.nasm.us/).
I followed [fireship](https://github.com/fireship-io)'s [Assembly Language in 100 seconds](https://www.youtube.com/watch?v=4gwYkEK0gOk) video to get started.

## To compile the code

```sh
nasm -f elf64 script.asm # Convert the code to an object
```

**Do note that this has only worked for Linux (I used WSL and Fedora VM).** If anybody got any methods to compile the object file to Windows, please contact me.

```sh
ld script.o -o script # Convert the object to an executable
```

```sh
./script # Run the executable
```
