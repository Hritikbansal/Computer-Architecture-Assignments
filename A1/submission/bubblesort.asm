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


mov r2, 0       @ Starting address of the array
	
@ Retreive the end address of the array
mov r3, 50	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
sub r3,r3,2  @ # passes is 2 less than the size of the array       
mov r4,0 @initializing i


call .bubblesort         


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
