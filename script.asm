section .data
    count: DB 0
    welcomeMsg: DD "Orca-NASM", 10
    welcomeMsgLen: equ $-welcomeMsg
    finishMsg: DD "Finished counting", 10
    finishMsgLen: equ $-finishMsg
    buffer: times 4 db 0  ; Reserve space for a 4-character string (2 for cycle number, 2 for value)

section .text
global _start

    _start:
        ; Print out welcome message
        mov rax, 1
        mov rdi, 1
        mov rsi, welcomeMsg
        mov rdx, welcomeMsgLen
        syscall

        mov rbx, 1  ; Value to print
        mov rcx, 1  ; Cycle counter
        ; Begin looping
        loop:
            ; If cycle number is 70, exit loop
            cmp rcx, 70
            je end_loop

            ; Convert cycle number to string and store in buffer
            mov rax, rcx
            mov rdi, buffer
            call convert_to_string

            ; Print cycle number
            mov rax, 1
            mov rdi, 1
            mov rsi, buffer
            mov rdx, 2  ; Print 2 bytes (2-digit cycle number)
            syscall

            ; Print separator
            mov rax, 1
            mov rdi, 1
            mov rsi, separator
            mov rdx, 1
            syscall

            ; Convert value to string and store in buffer
            mov rax, rbx
            mov rdi, buffer
            call convert_to_string

            ; Print out the value of rbx
            mov rax, 1
            mov rdi, 1
            mov rsi, buffer
            mov rdx, 2  ; Print 2 bytes (2-digit value)
            syscall

            ; Print newline
            mov rax, 1
            mov rdi, 1
            mov rsi, newline
            mov rdx, 1
            syscall

            ; Increment rbx and rcx
            inc rbx
            inc rcx
            jmp loop

        end_loop:
            ; Print out finish
            mov rax, 1
            mov rdi, 1
            mov rsi, finishMsg
            mov rdx, finishMsgLen
            syscall
        
        ; end program
        mov rax, 60
        mov rdi, 0
        syscall

    convert_to_string:
        ; Convert value in rax to a 2-digit string in rdi
        ; (Assuming rax is a single-digit number)
        add rax, '0'  ; Convert to ASCII
        mov [rdi], al
        ret

    section .data
        newline: db 10, 0
        separator: db ':', 0
