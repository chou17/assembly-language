    .data
    .align 4
    
r:
    .space 400,0
 
    .section .text
    .global NumSort
    .type NumSort,%function
    .result:
        .word r
        
NumSort:
/* function start */
    STMFD sp!, {r0-r9, fp, ip, lr}

/* --- copy the data --- */
     ldr r0, [r10], #4  @put arr[0] address into r0
     ldr r1, .result    @put result[0] address into r1
     mov r2, #0         @index
 
LOOP: 
    cmp r2, r9 @check index < array size
    beq EXIT
    str r0, [r1, r2, LSL #2] @put the element into result array
    add r2, r2, #1           @index++
    ldr r0, [r10], #4
    b   LOOP

EXIT: 
    ldr r10, .result @put result address into r10

bsort_next:
    mov r3,#0        @r3 = current element number
    mov r4,#0        @r4 = number of swap
bsort_loop:     
    add r0,r3,#1     @r0 = next index
    cmp r0,r9        @Check index < array size
    bge bsort_check  
    ldr r2,[r10,r3,lsl #2]    @r2 = current element val
    ldr r5,[r10,r0,lsl #2]    @r5 = next element val
    cmp r2,r5                 @compare val
    strgt r5,[r10,r3,lsl #2]  @if r2 > r5, store current val at next
    strgt r2,[r10,r0,lsl #2]  @if r2 > r5, store next value at current
    addgt r4,r4,#1    
    mov   r3,r0           
    b     bsort_loop  
bsort_check:                  @check for changes
     cmp r4,#0      
     subgt r9,r9,#1      
     bgt bsort_next           @if there were changes, do it again

/* put result array’s address into r10 */
    ldr r10, .result
/* --- end of your function --- */
/* function exit */
EndFunc:
    nop
    
    LDMFD sp!, {r0-r9, fp, ip, pc}
    .end
