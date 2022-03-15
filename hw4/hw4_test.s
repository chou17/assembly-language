 .data
 .align 4     
    
 .type a, %object
 .size a, 40
a:
        .word   10
        .word   2
        .word   3
        .word   5
        .word   1
        .word   8
        .word   6
        .word   4
        .word   9
        .word   7
        
    .section .text
    .global main
    .type main,%function
    .arr:
        .word a

main:
    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4
    @input arr

    @put arr size in r9
    @put arr address into r10
    ldr r9, =#10
    ldr r10, .arr
    
    bl NumSort
    nop
    LDMEA fp, {fp, sp, pc}
    .end
