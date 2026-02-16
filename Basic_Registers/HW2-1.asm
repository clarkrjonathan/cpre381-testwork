#HW2 problem 1

li t0, 0xFFFF


li t1, 0xEFF01270
li t2, 0x00000001
li, t3, 0x0000001F
	
	
	lui t0, 0xFFFFF
	#t0 is now 0xFFFF0000
	
	#set t1 to 1 if t1 is less than t0
	slt t1, t1, t0
	#t0 is negative as is t1 but t1 is much more negative
	
	
	#branch if equal, t1 and 0
	beq t1, zero, SOMEPLACE
	#t1 is 1 because it was more negative than t0 so this wont branch
	
	#shifts out the 1, preserves msb but msb is 0 so t2 is 0
	#the amount of times we shift isnt really relevant to this because after one bit shift the values already 0
	#and will remain 0 no matter how many shifts after
	sra t2, t1, t3
	j EXIT
	
	
SOMEPLACE:
	#not reached
	add t2, t2, t1
EXIT:
