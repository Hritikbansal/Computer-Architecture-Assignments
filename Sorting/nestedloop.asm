
.innerloop:
	add r2,r2,1
	cmp r1,7
	beq .break
	add r1,r1,1
	b .innerloop

.break:
	ret

.finalreturn: 
	ret
	

.outerloop:
	sub sp,sp,4 @creating space to store ra
	st ra,0[sp]
	mov r1,1 @ initializing j
	call .innerloop
	ld ra, [sp]
	cmp r0,10
	beq .finalreturn
	add r0,r0,1
	b .outerloop

.main:
	mov r0, 1 @ i
	mov r2, 0 @ count
	call .outerloop	
	.print r2