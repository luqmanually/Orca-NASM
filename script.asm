section .data
    text_intro: dd "Organic NASM-based project - Orca-NASM"
    text_commands: dd "<calc> to use calculator. | <exit> to exit."

    ; some texts for the console
    text_console: dd ">- "
    text_404: dd "Command does not exist!"
    newline: db 10 ; Newline

    ; calculator
    calculator_enter_num1: dd "Enter the first number: ", 10
    calculator_enter_num2: dd "Enter the second number: ", 10
    calculator_enter_operation: dd "Enter your operation <+,-,*,/>"

    calculator_operation_add: dd "+"
    calculator_operation_sub: dd "-"
    calculator_operation_mul: dd "*"
    calculator_operation_div: dd "/" 

    calculator_text_enter: dd "Answer: "
    calculator_text_equal: dd "="
    ; exit
    message_exit: dd "Exiting program..."
    ; help
    message_help: dd "I can't help you out."

    ; commands
    exit_command: dd "exit", 10
    help_command: dd "help", 10
    calc_command: dd "calc", 10

section .bss
    input: resb 16

    ; calculator data
    calculator_num1: resb 8
    calculator_num2: resb 8
    calculator_ans: resb 16

section .text
    global _start

_start: ; start of code
    ; print intro text
    mov rax, text_intro
    call _console_out
    call _console_space

    ; print commands
    mov rax, text_commands
    call _console_out
    call _console_space

    loop: ; main program loop
        mov rax, 0
        mov [input], rax

        ; cursor thingy
        mov rax, text_console
        call _console_out

        call _console_get ; get input from console

        ; check for commands
        mov rax, [input]
        _input_exit: ; exit command
            mov rbx, [exit_command]
            cmp rax, rbx
            je command_end
        
        _input_help: ; help command
            mov rbx, [help_command]
            cmp rax, rbx
            je command_help
        
        _input_calculator: ; calculator tool
            mov rbx, [calc_command]
            cmp rax, rbx        
            je command_calculator

        ; not found/command does not exit
        mov rax, text_404
        call _console_out
        call _console_space

        jmp loop

    ; help
    command_help:
        mov rax, message_help
        call _console_out
        call _console_space

        jmp loop

    ; calculator
    command_calculator:
        mov rax, calculator_enter_num1
        call _console_out

        call _console_get
        mov rax, input
        mov [calculator_num1], rax

        mov rax, calculator_num1
        call _console_out

        jmp loop

    ; end script
    command_end:
        mov rax, message_exit
        call _console_out
        call _console_space

        call _exit ; exit

_console_out:
    ; subroutine to print out the message stored in rax
    push rax
    mov rbx, 0
    message_len_loop:
        ; increase pointer for the message and count
        inc rax
        inc rbx
        mov cl, [rax] ; load byte to memory address
        cmp cl, 0 ; check for null terminator
    jne message_len_loop
 
    ; print out message
    mov rax, 1
    mov rdi, 1
    pop rsi ; retrive original memory address from stack into rsi
    mov rdx, rbx ; length of message to print
    syscall
    ret ; return to code/end of subroutine

_console_space:
    ; subroutine to print out new line
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret ; end of subroutine

_console_get:
    ; subroutine that fetches input
    mov rax, 0
    mov rdi, 0
    mov rsi, input ; rbx is where the input will be stored
    mov rdx, 256 ; 256 bytes allocation
    syscall
    ret ; end of subroutine

_exit:
    ; subroutine to quit code. required, otherwise segmentation fault.
    mov rax, 60
    mov rdi, 0
    syscall
    ret ; end of subroutine