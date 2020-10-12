.innerloop:

	ld r8,[r5]  @value at arr[j]
	ld r9,4[r5] @value at arr[j+1]  
	
	cmp r8,r9
	bgt .swap

	mov r11,r4  @ Moving the value of i here
	mov r12,r3     @ Moving the value of size of array-2
	sub r12,r12,r11    
	mul r12,r12,4   

	cmp r5,r12
	beq .break

	add r5,r5,4
	b .innerloop

.break:  
	ret

.swap:
	mov r10,r8   @r10 is temporary variable
	mov r8,r9
	mov r9,r10
	st r8,[r5]
	st r9,4[r5]
	b .innerloop  @unconditional branching


.bubblesort:  @acting as an Outerloop 
	
	cmp r3,-2  @empty array
	beq .completed  

	cmp r3,-1 @only one element present
	beq .completed

	sub sp,sp,4 @space to store the ra 
	st ra, 0[sp]

	mov r5,r2     @ initializing j with the starting address of the array 
	call .innerloop
	
	ld ra,[sp]
	add sp,sp,4 @deleting the activation block
	cmp r4,r3
	beq .completed
	add r4,r4,1
	b .bubblesort

.completed:  @Although .break label is same, just used it for my convenience
	ret

.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11  @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  @ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 6	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
	sub r3,r3,2  @ # passes is 2 less than the size of the array
	mov r4,0 @initializing i
	call .bubblesort
	
	@ Print statements
	ld r1, 0[r0]
	.print r1
	ld r1, 4[r0]
	.print r1
	ld r1, 8[r0]
	.print r1
	ld r1, 12[r0]
	.print r1
	ld r1, 16[r0]
	.print r1
	ld r1, 20[r0]
	.print r1
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS
	