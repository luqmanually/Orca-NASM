section .data
    message_intro: dd "Organic NASM-based project - Orca-NASM"
    message_commands: dd "<calc> to use calculator. | <exit> to exit."
    message_yes: dd "yes", 10

    ; some texts for the console
    text_console: dd ">- "
    text_404: dd "Command does not exist!"

    ; calculator
    calculator_enter_num1: dd "Enter first number"
    calculator_enter_num2: dd "Enter second number"
    calculator_enter_operation: dd "Enter operation =,-,/,*"
    calculator_result: dd "Answer: "

    calculator_add: dd "+"
    calculator_sub: dd "-"
    calculator_div: dd "/"
    calculator_mul: dd "*"

    message_exit: dd "Exiting program..."
    message_help: dd "I can't help you out."

    newline: db 10 ; Newline
    exit_command: dd "exit", 10
    help_command: dd "help", 10

section .bss
    input: resb 16

    ; calculator data
    calculator_num1: resb 8
    calculator_num2: resb 8
    calculator_ans: resb 16

section .text
    global _start

_start:
    ; start of code
    mov rax, message_intro ; intro text
    call _console_out
    call _console_space

    mov rax, message_commands ; list down commands
    call _console_out
    call _console_space

    loop: ; main program loop
        mov rax, text_console
        call _console_out

        call _console_get ; get input from console

        mov rax, [input]
        _input_exit: ; exit command
            mov rbx, [exit_command]
            cmp rax, rbx
            je end
        
        _input_help: ; help command
            mov rbx, [help_command]
            cmp rax, rbx
            je command_help
        
        mov rax, text_404
        call _console_out
        call _console_space ; repeat until exit

        jmp loop

    command_help:
        mov rax, message_help
        call _console_out
        call _console_space

    jmp loop

    command_calculator:
        mov rax, calculator_enter_num1 ; enter first number
        call _console_out
        call _console_space

        call _console_get
        mov calculator_num1, input ; store input to num1

        mov rax, calculator_enter_num2 ; enter second number
        call _console_out
        call _console_space

        call _console_get
        mov calculator_enter_num2, input ; store input to num2

        mov rax, calculator_enter_operation ; enter operation
        call _console_out
        call _console_space

        mov rax, [calculator_enter_operation] ; check for operation
        _input_addition:
            mov rbx, [calculator_add]
            cmp rax, rbx
            je operation_addition ; jump to addition label

        _input_subtraction:
            mov rbx, [calculator_sub]
            cmp rax, rbx
        
        _input_division:
            mov rbx, [calculator_div]
            cmp rax, rbx
        
        _input_multiplication:
            mov rbx, [calculator_mul]
            cmp rax, rbx

        operation_addition:
            mov calculator_result, [calculator_num1]
            add calculator_result, [calculator_num2]


    end: ; end label
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