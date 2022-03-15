@r0=2*r1+4*r2+8*r3
    .section .text
    .global main
    .type main,%function
main:
    mov r1,#10
    mov r2,#20
    mov r3,#12
    mov r0, r1, LSL #1
    add r0,r0,r2,LSL #2
    add r0,r0,r3,LSL #3
    nop
    .end
