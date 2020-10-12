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
	
	sub r4,r6,4
	ld r2,4[sp]
	call .quicksort
	
    add r2,r6,4
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
mov r0, 0
mov r1, 505
st r1, 0[r0]
mov r1, 460
st r1, 4[r0]
mov r1, 348
st r1, 8[r0]
mov r1, -679
st r1, 12[r0]
mov r1, 681
st r1, 16[r0]
mov r1, 558
st r1, 20[r0]
mov r1, -934
st r1, 24[r0]
mov r1, 745
st r1, 28[r0]
mov r1, 556
st r1, 32[r0]
mov r1, -428
st r1, 36[r0]
mov r1, 577
st r1, 40[r0]
mov r1, -931
st r1, 44[r0]
mov r1, -285
st r1, 48[r0]
mov r1, 624
st r1, 52[r0]
mov r1, -919
st r1, 56[r0]
mov r1, 626
st r1, 60[r0]
mov r1, 959
st r1, 64[r0]
mov r1, -458
st r1, 68[r0]
mov r1, -770
st r1, 72[r0]
mov r1, -593
st r1, 76[r0]
mov r1, 101
st r1, 80[r0]
mov r1, 613
st r1, 84[r0]
mov r1, 868
st r1, 88[r0]
mov r1, -580
st r1, 92[r0]
mov r1, 658
st r1, 96[r0]
mov r1, 344
st r1, 100[r0]
mov r1, 681
st r1, 104[r0]
mov r1, -439
st r1, 108[r0]
mov r1, 150
st r1, 112[r0]
mov r1, 145
st r1, 116[r0]
mov r1, 662
st r1, 120[r0]
mov r1, -140
st r1, 124[r0]
mov r1, -385
st r1, 128[r0]
mov r1, 381
st r1, 132[r0]
mov r1, -125
st r1, 136[r0]
mov r1, -505
st r1, 140[r0]
mov r1, 537
st r1, 144[r0]
mov r1, -296
st r1, 148[r0]
mov r1, 959
st r1, 152[r0]
mov r1, -613
st r1, 156[r0]
mov r1, 506
st r1, 160[r0]
mov r1, -872
st r1, 164[r0]
mov r1, -630
st r1, 168[r0]
mov r1, -184
st r1, 172[r0]
mov r1, 366
st r1, 176[r0]
mov r1, 216
st r1, 180[r0]
mov r1, 270
st r1, 184[r0]
mov r1, 97
st r1, 188[r0]
mov r1, -114
st r1, 192[r0]
mov r1, 642
st r1, 196[r0]


	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 49	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3	@r4 contains the end address of the array
	
 	@ ADD YOUR CODE HERE 

	call .quicksort

 	@ ADD YOUR CODE HERE

	
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
ld r1, 24[r0]
.print r1
ld r1, 28[r0]
.print r1
ld r1, 32[r0]
.print r1
ld r1, 36[r0]
.print r1
ld r1, 40[r0]
.print r1
ld r1, 44[r0]
.print r1
ld r1, 48[r0]
.print r1
ld r1, 52[r0]
.print r1
ld r1, 56[r0]
.print r1
ld r1, 60[r0]
.print r1
ld r1, 64[r0]
.print r1
ld r1, 68[r0]
.print r1
ld r1, 72[r0]
.print r1
ld r1, 76[r0]
.print r1
ld r1, 80[r0]
.print r1
ld r1, 84[r0]
.print r1
ld r1, 88[r0]
.print r1
ld r1, 92[r0]
.print r1
ld r1, 96[r0]
.print r1
ld r1, 100[r0]
.print r1
ld r1, 104[r0]
.print r1
ld r1, 108[r0]
.print r1
ld r1, 112[r0]
.print r1
ld r1, 116[r0]
.print r1
ld r1, 120[r0]
.print r1
ld r1, 124[r0]
.print r1
ld r1, 128[r0]
.print r1
ld r1, 132[r0]
.print r1
ld r1, 136[r0]
.print r1
ld r1, 140[r0]
.print r1
ld r1, 144[r0]
.print r1
ld r1, 148[r0]
.print r1
ld r1, 152[r0]
.print r1
ld r1, 156[r0]
.print r1
ld r1, 160[r0]
.print r1
ld r1, 164[r0]
.print r1
ld r1, 168[r0]
.print r1
ld r1, 172[r0]
.print r1
ld r1, 176[r0]
.print r1
ld r1, 180[r0]
.print r1
ld r1, 184[r0]
.print r1
ld r1, 188[r0]
.print r1
ld r1, 192[r0]
.print r1
ld r1, 196[r0]
.print r1
