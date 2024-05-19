# Project Orca NASM-based (Orca-NASM)

**Assembled using the [NASM](https://nasm.us) assembler, x86 64-bit.**

## Overview

A multi-purpose, CLI-based program I made for fun, and to get myself used to coding in the Assembly language. 

## Available functions

I cannot guarantee that all the listed functions work as intended whilst you are reading this `READM.md`. This project is being worked on bit by bit from time to time, and the commits I made are not necessarily containing 100% fully working code.

### `calc`

Basic calculator. Does the basic 4 arithmetic operations, **addition**, **subtraction**, **multiplication** and **division**.

### `help`

Displays the commands, and some basic tips.

### `exit`

Exits the program (the proper way). Another way is via `CTRL+C`.

## How do I run this script?

You will need the [NASM](https://nasm.us) assembler installed, on your system and PATH.

### Assemble `script.asm` to `script.o`

Run the following command on your terminal:

```bash
nasm -f elf64 script.asm
```

This will output an object file (`script.o`)

### Convert `script.o` to `script`

In order to run the script, you have to do this one last conversion. Run the following command:

```bash
ld script.o -o script
```

### Run the `script`

You can now run the script. Go to the file location of `script`, and run the following:

```bash
./script
```

## Feedbacks/Suggestions

If you have any feedbacks or suggestions, please contact me (all the links are available on my [profile](https://github.com/luqmanually))
