/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 32
a:
	.word   1
        .word   2
        .word   3
        .word   1
        .word   2
        .word   3
        .word   1
        .word   2


/* --- variable b --- */
	.type b, %object
	.size b, 32
b:
	.word   1
        .word   2
        .word   1
        .word   2
        .word   1
        .word   2
        .word   1
        .word   2

c:
	.space 16, 0

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
main:
	ldr r0, .matrix     /*a[0][0]*/
	ldr r1, [r0], #4    /* r1 := mem32[r0] 
	                     r0=r0+4*/
	ldr r2, [r0], #4    /*a[0][1]*/
	ldr r3, [r0], #4    /*a[0][2]*/
	ldr r4, [r0]        /*a[0][3]*/

	ldr r0, .matrix + 4 /*r0:=matrix+4(b[0][0])*/
	ldr r5, [r0], #8    /*r5 := mem32[r0]
	                      r0=r0+8*/
	ldr r6, [r0], #8    /*b[1][0]*/
	ldr r7, [r0], #8    /*b[2][0]*/
	ldr r8, [r0]        /*b[3][0]*/

	ldr r9, .matrix + 8 /*c[0][0]*/

	mul r10, r1, r5     /*r10 := a[0][0] * b[0][0]*/
	mul r11, r2, r6     /*r11 := a[0][1] * b[1][0]*/
	add r10, r10, r11  
	mul r11, r3, r7     /*r11 := a[0][2] * b[2][0]*/
	add r10, r10, r11
	mul r11, r4, r8     /*r11 := a[0][3] * b[3][0]*/
	add r10, r10, r11
	
	str r10, [r9], #4  /* mem32[r9] := r10 (c[0][0])
	                      r9 := r9 + 4*/
        

	ldr r0, .matrix + 4
	ldr r5, [r0, #4]!  /*b[0][1]*/
	ldr r6, [r0], #8   /*b[1][1]*/
	ldr r7, [r0], #8   /*b[2][1]*/
	ldr r8, [r0]       /*b[3][1]*/  
        
        mul r10, r1, r5    /*r10 := a[0][0] * b[0][1]*/
	mul r11, r2, r6    /*r11 := a[0][1] * b[1][1]*/
	add r10, r10, r11
	mul r11, r3, r7    /*r11 := a[0][2] * b[2][1]*/
	add r10, r10, r11  
	mul r11, r4, r8    /*r11 := a[0][3] * b[3][1]*/
	add r10, r10, r11
        
	str r10, [r9], #8  /* mem32[r9] := r10 (c[0][1]) 
	                      r9 := r9 + 8*/
	ldr r0, .matrix
	ldr r1, [r0, #16]! /*a[1][0]*/
	ldr r2, [r0], #4   /*a[1][1]*/
	ldr r3, [r0], #4   /*a[1][2]*/
	ldr r4, [r0]       /*a[1][3]*/
	
	mul r10, r1, r5    /*r10 := a[1][0] * b[0][1]*/
	mul r11, r2, r6    /*r11 := a[1][1] * b[1][1]*/
	add r10, r10, r11  
	mul r11, r3, r7    /*r11 := a[1][2] * b[2][1]*/
	add r10, r10, r11
	mul r11, r4, r8    /*r11 := a[1][3] * b[3][1]*/
	add r10, r10, r11
	
	str r10, [r9]      /* mem32[r9] := r10 (c[1][1])*/
	
	ldr r0, .matrix + 4/*r0:=matrix+4(b[0][0])*/
	ldr r5, [r0], #8   /*r5 := mem32[r0]
	                      r0=r0+8*/
	ldr r6, [r0], #8   /*b[1][0]*/
	ldr r7, [r0], #8   /*b[2][0]*/
	ldr r8, [r0]       /*b[3][0]*/
	
	mul r10, r1, r5     /*r10 := a[1][0] * b[0][0]*/
	mul r11, r2, r6     /*r11 := a[1][1] * b[1][0]*/
	add r10, r10, r11   
	mul r11, r3, r7     /*r11 := a[1][2] * b[2][0]*/
	add r10, r10, r11
	mul r11, r4, r8     /*r11 := a[1][3] * b[3][0]*/
	add r10, r10, r11
	
	ldr r9, .matrix + 8
	str r10, [r9,#8]    /* mem32[r9+8] := r10 (c[1][0])*/
	
	ldr r1, .matrix + 8; /*r1:=matrix+8 (c[0][0])*/
	
        nop

