section .data
    message_intro: dd "Organic NASM based project - Orca-NASM", 10
    message_commands: dd "<calc> to use calculator.", 10, "<exit> to exit.", 10
    message_yes: dd "Yes", 10

section .bss
    command: resb 16
    operator: resb 8
    firstNum: resb 8
    secondNum: resb 8
    message: resb 64

section .text
    global _start

_start:
    mov rbx, message_intro ; send intro message
    call _console_out

    call _exit ; exit

_console_out:
    mov rax, 13
    mov rdi, rbx
    syscall

    mov rax, rcx
    
    ; subroutine that prints out a message
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx ; rbx needs to contain the message string
    mov rdx, rcx
    syscall
    ret

_get:
    ; subroutine that fetches input
    mov rax, 0
    mov rdi, 0
    mov rsi, rbx ; rbx is where the input will be stored
    mov rdx, 256 ; 256 bytes allocation
    syscall
    ret

_exit:
    ; subroutine to quit code
    mov rax, 60
    mov rdi, 0
    syscall
    ret
