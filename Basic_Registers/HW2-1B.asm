#HW2 1b
.data 
arr: .word 18, 48, 16, 51, 98

.text

#max valu

#array pointer
la s0, arr

#pull first element
lw t0, 0(s0)

#current max
mv s1, t0

#index of array
mv s2, zero

#number of array elements
li s3, 5

#5 instructions before loop

#8 instructions per loop if smaller than max, 9 if changing max
#times N loops
#Plus one more instruction for the branch greater than check that fails
#gives us 5 + 8 * N + ln(N) + .577 + 1
#or 6.577 + ln(N) + 8 * N
LOOP:
	#first check we still are in list, if not exit
	bge s2, s3, EXIT

	#t1 is the address of the element we are looking at
	
	#zero out address register
	xor t1, t1, t1
	
	
	#memory offset - takes i value times 8
	slli t1, s2, 2
	
	#add offset to start of array
	add t1, t1, s0
	
	#load element into t0
	lw t0, 0(t1)
	
	#check if the value is bigger
	bge s1, t0 GREATER
	
	#set s1 equal to t0
	mv s1, t0
	
	GREATER:
	#since the current max is bigger than the current element we skip to here
		
	#increment our i value
	addi s2, s2, 1
	

j LOOP


EXIT:
