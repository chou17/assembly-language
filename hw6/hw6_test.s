.set SWI_Write, 0x5
.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set AngelSWI, 0x123456

    .data
    .align 4     
 
filename:
	.ascii "result.txt\000"

@to string
str_addr:
    .space 40, 0
    .align    
  
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
    
.arr:
    .word a
.str:
    .word str_addr
.open_param:
    .word filename
    .word 0x4
    .word 0x8
.write_param:
    .space 4   /* file descriptor */
    .space 4   /* address of the string */
    .space 4   /* length of the string */
.close_param:
    .space 4

main:
    mov ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4
    
    ldr r0, =#10    @put arr size in r0
    ldr r1, .arr   @put arr address into r1
    
    bl NumSort
    
    mov r6, r0     @store result arr to r6
    ldr r8, .str   @store string address to r8
    ldr r0, [r0]   @result[0] to r0
    mov r9, #10     @transform for 10 times
    mov r7, #44      /* "," is 44 */

Trans:
    cmp r9, #0
    beq File
    add r0, r0 ,#48   @transform to char

    strb r0, [r8], #1 @store to string*/
    strb r7, [r8], #1 @store "," after the number
                
    add r6, r6, #4
    ldr r0, [r6]
    sub r9, r9, #1    @loop count--
    b Trans


File:
 /* open a file */
    mov r0, #SWI_Open
    adr r1, .open_param
    swi AngelSWI
    mov r2, r0        @file descriptor
      
/* write array to a file */
    adr r1, .write_param
    str r2, [r1, #0]  @file descriptor
 
    ldr r3, .str
    str r3, [r1, #4]  @store string address

    mov r3, #19
    str r3, [r1, #8]  @store the length of the string

    mov r0, #SWI_Write
    swi AngelSWI

 /* close a file */
    adr r1, .close_param
    str r2, [r1, #0]
	
    mov r0, #SWI_Close
    swi AngelSWI

    
    nop
    LDMEA fp, {fp, sp, pc}
    .end
