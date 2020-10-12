@first element at r2
@last element at r4
@r0 contains the starting address of the array
.mergesort:
		@ ADD YOUR CODE HERE
		cmp r4,r2  @condition that r4 is more than r2
		bgt .continue	
		beq .return

.return: 
	ret	

.continue:  @without any corner case

	sub sp,sp,16
	st ra,0[sp]
	st r2,4[sp]  
	st r4,8[sp]

	add r4,r2,r4
	div r4,r4,2
	mod r5,r4,4
	sub r4,r4,r5 @ r4 contains the last address of the half array
	mov r6,r4   @r6 is the medium 

	st r6,12[sp]

	call .mergesort  @X
	ld r2,4[sp]
	ld r4,8[sp]
	ld r6,12[sp]

	sub r8,r6,r2  @r8 stores the difference btw the middle , first 
	add r2,r8,r2
	add r2,r2,4 @ r2 contains the first address of the other half array

	call .mergesort @Y
	ld ra,0[sp] @getting the return address
	ld r2,4[sp]
	ld r4,8[sp]
	ld r6,12[sp]   
	add sp,sp,16 @deleting the activation block

	@CALLING MERGE FROM HERE

	sub sp,sp,4
	st ra,[sp]
	call .merge
	ld ra,[sp]
	add sp,sp,4 

	ret

.merge: 	
		@ ADD YOUR CODE HERE
		@ r2 r6 r4 ARE FIRST MIDDLE LAST ELEMENS OF THE ARRAY 
		sub sp,sp,8
		st r7,4[sp]  @helps in reusing the dummy space
		st ra,[sp]
		@CREATE A LEFT ARRAY
		call .createleft

		@CREATE RIGHT ARRAY
		call .createright

		ld r7,4[sp] 
		ld ra,[sp]
		add sp,sp,8

		@SORT THEM
		sub sp,sp,4
		st ra,[sp]
		mov r5,r2  @r5 points at r2 location

		mov r13,r11 @THIS IS REQUIRED TO STOP SORTING
		sub r9,r4,r2 
		add r9,r9,r10
		add r9,r9,4  @THIS IS REQUIRED TO STOP SORTING
		call .sort
		mov r0,0 
		ld r1,[r0]
		ld r1,4[r0]
		ld ra,[sp]
		
		ret
.sort:
	 
	ld r12,[r10] @element of the left array
	ld r1,[r11] @element of the right array 

	cmp r10,r13
	beq .sortremright  @sort remaining IN the right

	cmp r11,r9
	beq .sortremleft  @sort remaining IN the left

	cmp r12,r1
	bgt .movefromright
	beq .movefromleft
	b .movefromleft

.sortremright:
	cmp r9,r11
	beq .return
	bgt .movefromright

.movefromright:
	st r1,[r5]
	ld r0,[r5]
	add r5,r5,4
	add r11,r11,4
	b .sort

.sortremleft:

	cmp r13,r10
	beq .return
	bgt .movefromleft

.movefromleft:
	st r12,[r5]
	ld r0,[r5]
	add r5,r5,4
	add r10,r10,4
	b .sort


.createleft:
	sub r8,r6,r2
	div r8,r8,4
	add r8,r8,1 @r8 contains the number of elements in left array
	mov r10,r7 @ address of the first element in the left array 
	sub sp,sp,4
	st ra,[sp]
	call .copyleft
	ld ra,[sp]
	add sp,sp,4
	ret

.copyleft:
	sub r8,r8,1
	sub r9,r6,r2
	div r9,r9,4
	sub r9,r9,r8
	mul r9,r9,4
	add r9,r9,r2
	ld r9,[r9]
	st r9,[r7]

	add r7,r7,4 

	cmp r8,0
	bgt .copyleft
	beq .return

.createright:
	sub r8,r4,r6
	div r8,r8,4
	mov r11,r7 @address of the first element in right array
	mov r5,r6  @TEMPORARY VARIABLE
	sub sp,sp,4
	st ra,[sp]
	call .copyright
	ld ra,[sp]
	add sp,sp,4
	ret

.copyright:
	sub r8,r8,1
	add r9,r5,4
	ld r9,[r9]
	st r9,[r7]

	add r7,r7,4
	add r5,r5,4

	cmp r8,0
	bgt .copyright
	beq .return

.main:

	@ Loading the values as an array into the registers
	mov r0, 0
	mov r1, 12 @ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7 @ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11 @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9 @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3 @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15 @ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 5	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3  @r4 contains the end address of the array

	mov r7,r4
	add r7,r7,4 @ FREE MEMORY IS AVAILABLE FROM HERE 
	@ ADD YOUR CODE HERE 
	
	call .mergesort  

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

