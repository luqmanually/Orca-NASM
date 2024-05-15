# Project "Orca" using Netwide Assembler(Orca-NASM)

My first x86 Assembly project. The assembler I used is [NASM](https://www.nasm.us/) (Netwide Assembler).
I followed [fireship](https://github.com/fireship-io)'s [Assembly Language in 100 seconds](https://www.youtube.com/watch?v=4gwYkEK0gOk) video to get started.

## What this script does

More coming soon.

- Prints out "Hey, Mommy..!"
- Counts till 69
- Prints out "Mommy look, I counted till 69!"

## To run the code

```sh
nasm -f elf64 script.asm # Convert the code to an object
```

**Do note that this has only worked for Linux (I used WSL and Fedora VM).** If anybody got any methods to compile the object file to Windows, please contact me (links on my [profile](https://github.com/luqmanually)).

```sh
ld script.o -o script # Convert the object to an executable
```

```sh
./script # Run the executable
```
