.data
.align 4     
 
 @printf
input1:
    .ascii "Input array: %d, %d, %d, \000"
input2:     
    .ascii "%d, %d, %d, \000"
input3:
    .ascii "%d, %d, %d, \000"
input4:
    .ascii "%d\n\000"
output1:
    .ascii "Result array: %d, %d, %d, \000"
output2:
    .ascii "%d, %d, %d, \000"
output3:
    .ascii "%d, %d, %d, \000"
output4:
    .ascii "%d\n\000"
  
@array
.type a, %object
.size a, 40
a:
    .word   1
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
    
address_format_input1:
    .word input1
address_format_input2:
    .word input2
address_format_input3:
    .word input3
address_format_input4:
    .word input4
address_format_output1:
    .word output1
address_format_output2:
    .word output2
address_format_output3:
    .word output3
address_format_output4:
    .word output4
    
.arr:
    .word a

main:
    mov ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4
    
    ldr r0, =#10 @put arr size in r0
    ldr r1, .arr @put arr address into r1
    
    bl NumSort
    
    ldr r8 , .arr @put arr address into r8
    mov r9, r0    @put arr size into r9
    
    @printf
    ldr r0, address_format_input1
    ldr r1, [r8], #4
    ldr r2, [r8], #4
    ldr r3, [r8], #4
    bl printf
    
    ldr r0, address_format_input2
    ldr r1, [r8], #4
    ldr r2, [r8], #4
    ldr r3, [r8], #4
    bl printf
    
    ldr r0, address_format_input3
    ldr r1, [r8], #4
    ldr r2, [r8], #4
    ldr r3, [r8], #4
    bl printf
    
    ldr r0, address_format_input4
    ldr r1, [r8], #4
    bl printf
    
    ldr r0, address_format_output1
    ldr r1, [r9], #4
    ldr r2, [r9], #4
    ldr r3, [r9], #4
    bl printf
    
    ldr r0, address_format_output2
    ldr r1, [r9], #4
    ldr r2, [r9], #4
    ldr r3, [r9], #4
    bl printf
    
    ldr r0, address_format_output3
    ldr r1, [r9], #4
    ldr r2, [r9], #4
    ldr r3, [r9], #4
    bl printf
    
    ldr r0, address_format_output4
    ldr r1, [r9], #4
    bl printf
    
    nop
    LDMEA fp, {fp, sp, pc}
    .end
