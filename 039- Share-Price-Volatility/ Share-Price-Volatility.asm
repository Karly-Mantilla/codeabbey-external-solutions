;x64 assembly in MASM
;I/O handled in C++ 
;Procedure codeabbey is called by C++ file to handle computation

;External printf is declared to resolve linker issues with C++
extrn printf: PROC

;Length of Return array hard coded in: 23
.data
array BYTE 23 DUP(?)
tempint SDWORD ?
sd REAL8 ?
avg REAL8 ?
fourteen REAL8 14.0
twentyfive REAL8 25.0
.code
average PROC
    ;array length in rcx, array address in rdx
    mov r8, 0
    mov rax, 0
LA1:
    mov r10d, [rdx + r8 * 4]
    add rax, r10
    inc r8
    loop LA1
    mov tempint, eax
    fild tempint
    fdiv fourteen
    fstp avg
    ret
average ENDP

stdev PROC
    ;array length in rcx, array address in rdx, average in VAR avg
    mov r8, 0
    fldz
LS1:
    mov r10d, [rdx + r8 * 4]
    mov tempint, r10d
    fild tempint
    fld avg
    fsub
    fmul st(0), st(0)
    fadd
    inc r8
    loop LS1

    fld fourteen
    fld1
    fsub
    fdiv
    fsqrt
    fstp sd
    ret
stdev ENDP

codeabbey PROC
    ;array length passed into rcx, array address in rdx
    mov rsi, rdx
    mov rdi, OFFSET array
    mov r9, 0
    mov r11, 0
L1:
    push rcx
    mov rcx, 14
    lea rdx, [rsi + r9 * 4]
    sub rsp, 8
    call average
    add rsp, 8
    mov rcx, 14
    sub rsp, 8
    call stdev
    add rsp, 8
    pop rcx
    fld avg
    fdiv twentyfive
    fld sd
    fcompp
    fnstsw ax
    sahf
    ja Yes
    mov array[r11], 0
    jmp Store
Yes:
    mov array[r11], 1
Store:
    add r9, 14
    inc r11
    loop L1
    
    lea rax, array
    ;return array of BOOLs to tell c++ which names to print
    ret
codeabbey ENDP
END