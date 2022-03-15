    .data
    .align 4
 
    .section .text
    .global NumSort
    .type NumSort,%function
        
NumSort:
/* function start */
    STMFD sp!, {r4-r9, fp, ip, lr}

/* --- copy the data --- */
    mov r3, r0         @get array size from r0
    mov r10, r1        @get array address from r1
    bl malloc
    mov r1, r0         @result address放入r1
    mov r6, r0         @result array[0] address放入r6
    mov r0, r3         @get array size
    ldr r4, [r10], #4  @put array val into r4
    mov r5, #0         @index
 
LOOP: 
    cmp r5, r0 @check index < array size
    beq EXIT
    str r4, [r1, r5, LSL #2] @put the element into result array
    add r5, r5, #1           @index++
    ldr r4, [r10], #4
    b   LOOP

EXIT: 
    mov r1, r6 @put result address into r1

bsort_next:
    mov r2,#0        @r2 = current element number
    mov r6,#0        @r6 = number of swap
bsort_loop:     
    add r4,r2,#1     @r4 = next index
    cmp r4,r0        @Check index < array size
    bge bsort_check  
    ldr r5,[r1,r2,lsl #2]    @r5 = current element val
    ldr r7,[r1,r4,lsl #2]    @r7 = next element val
    cmp r5,r7                 @compare val
    strgt r7,[r1,r2,lsl #2]  @if r5 > r7, store current val at next
    strgt r5,[r1,r4,lsl #2]  @if r5 > r7, store next value at current
    addgt r6,r6,#1    
    mov   r2,r4           
    b     bsort_loop  
bsort_check:                  @check for changes
     cmp r6,#0      
     subgt r0,r0,#1      
     bgt bsort_next           @if there were changes, do it again


/* --- end of your function --- */
/* function exit */
EndFunc:
    mov r0, r1 //put result array's address into r0
    nop
    LDMFD sp!, {r4-r9, fp, ip, pc}
    .end
