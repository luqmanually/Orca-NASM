# Project "Orca" using Netwide Assembler (Orca-NASM)

My first Assembly project. Please note that this script is written in **x86 64-bit Assembly**, for an Intel processor (should work fine on other x86 processors), assembled using [NASM](https://www.nasm.us/).

## What this script does

- Prints out things
- Accepts user inputs
- Skid around in loops
- Run subroutines

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
