.quicksort:
		@ ADD YOUR CODE HERE
		cmp r4,r2 @if r4 is greater than r2
		bgt .partition
		beq .return
.return:	
	ret

.partition:

	sub sp,sp,12
	st ra,[sp]
	st r2,4[sp]
	st r4,8[sp]
	
	ld r5,[r4] @storing the pivot in r5
	sub r6,r2,4 @acts as index i
	mov r7,r2   @acts as index j
	
	sub sp,sp,4
	st ra,[sp]
	call .continue @statement X
	ld ra,[sp]  
	add sp,sp,4 
	@WE HAVE THE INDEX OF PIVOT HERE  
	
	sub r4,r4,4
	ld r2,4[sp]
	call .quicksort
	
        add r2,r4,8
	ld r4,8[sp]
	call .quicksort
	ld ra,[sp]
	add sp,sp,12
	ret

.continue:
	cmp r4,r7  @till j is less than higher index
	bgt .comparepivot
	beq .positionpivot

.positionpivot:
	add r6,r6,4 @i+1
	@swap i+1 with high(r4)
	ld r10,[r6]
	st r5,[r6]
	st r10,[r4] 
	b .return @return to statement X
	
.comparepivot:
	ld r9,[r7] @acts as arr[j]	
	cmp r5,r9  @comparison btw pivot and arr[j]
	bgt .swap
	@if arr[j] is greater than pivot-do nothing
	add r7,r7,4
	b .continue
	

.beforecontinue:
	add r7,r7,4 @increase j by 1 index
	b .continue
.swap:
	add r6,r6,4
	cmp r6,r7
	beq .beforecontinue
	@Swap r6 and r7 if index i and j are not same
	ld r10,[r6] @temp variable r10
	st r9,[r6]
	st r10,[r7]
	b .beforecontinue	

 .main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11  	@ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   	@ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   	@ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  	@ replace 15 with the number to be sorted
	st r1, 20[r0]
	
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 5	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3	@r4 contains the end address of the array
	
 	@ ADD YOUR CODE HERE 

	call .quicksort

 	@ ADD YOUR CODE HERE

	@ Print statements for the result
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

