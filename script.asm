section .data
    message_intro: db "Organic NASM-based project - Orca-NASM", 10
    message_commands: db "<calc> to use calculator.", 10, "<exit> to exit.", 10

section .bss
    command: resb 16
    operator: resb 8
    firstNum: resb 8
    secondNum: resb 8
    message: resb 64

section .text
    global _start

_start:
    mov rbx, message_intro

    ; Call _console_out with the dynamic length
    call _console_out

    call _exit

_console_out:
    ; subroutine that prints out a message
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 256
    syscall

    ret

_exit:
    ; subroutine to quit code
    mov rax, 60
    mov rdi, 0
    syscall

    ret
