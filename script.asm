section .data
    message_intro: dd "Organic NASM-based project - Orca-NASM"
    message_commands: dd "<calc> to use calculator. | <exit> to exit."
    message_yes: dd "yes", 10

    message_exit: dd "Exiting program..."
    message_help: dd "I can't help you out."

    newline: db 10 ; Newline
    exit_command: dd "exit", 10
    help_command: dd "help", 10

section .bss
    input: resb 16
    operator: resb 8
    firstNum: resb 8
    secondNum: resb 8
    messageLen: resb 64

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
        call _console_get ; get input from console

        mov rax, [input]
        _command_exit: ; exit command
            mov rbx, [exit_command]
            cmp rax, rbx
            je end
        
        _command_help: ; help command
            mov rbx, [help_command]
            cmp rax, rbx
            
            mov rax, message_help
            call _console_out
            call _console_space

        jmp loop ; repeat until exit

    end: ; end label
        mov rax, message_exit
        call _console_out

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