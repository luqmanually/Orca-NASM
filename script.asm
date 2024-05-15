; x86 Assembly

section .bss
    ;variables

section .data
    ;contants
    hello: db "Heyy, Mommy..!", 10      ; string to print, by itself does nothing
    helloLen: equ $-hello       ; length of string

    congrats: db "Mommy look, I counted till 69!", 10
    congratsLen: equ $-congrats

section .text
    global _start        ; entry level for code

    _start:     ; program starts here
        ;instructions       ;operand
        mov rax, 1      ; system write
        mov rdi, 1      ; standard out
        mov rsi, hello      ; message to write
        mov rdx, helloLen       ; message length
        syscall     ; call kernel (execute)

        ; each program needs to end otherwhise we'll get segmentation fault

        loop:       ; loop counts till 69
            cmp rax, 69     ; terminates after 69 cycles
            je end_loop     ; go to end loop

            inc rax     ; increments and repeat
            jmp loop        ; jump back to top

        end_loop:       ; when finish loop
            mov rax, 1      ; system write
            mov rdi, 1      ; standard out
            mov rsi, congrats   ; write congrats
            mov rdx, congratsLen        ; congrats message length
            syscall     ; call kernel (execute)

        ; end program
        mov rax, 60     ; system exit
        mov rdi,0       ; 0 error code (success)
        syscall     ; call kernel (execute)