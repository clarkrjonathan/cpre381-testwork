#HW3 2 - b

#Recursive strategy -
#We want a function that can take in n as a parameter and get its value
#it will do this by returning F(n-1) + F(n-2)


#base case is F(1) OR F(0) which should return 1 and 0 respectively

#NOTE: At least this recursive approach is naive and poor performance because of many repeated calculations
#but its a simple demonstration of recursive functions in

Main:

	#set parameter
	li a0, 10
	jal FIBONACCI
	
	j EXIT



#a0 is n
#after each call all s registers should be preserved but a0 should be the return value

FIBONACCI:
	#because we are calling a function we need to save anything we need in this scope in the stack
	#eg current scope return address and any register values that need saved
	
	#stack pointer is 16 byte aligned so lets shift by 16
	addi sp, sp, -16
	
	#now lets save the current return address
	sw ra, 0(sp)
	
	#followed by our s registers
	sw s0, 4(sp)
	
	sw s1, 8(sp)
	
	#now we can use s registers freely
	mv s0, a0
	
	
	#check our base cases 0 and 1
	
	beqz s0, ZERO
	
	li t0, 1
	beq t0, s0, ONE
	
	#otherwise recursively call
	
	#set argument
	addi t0, s0, -1
	
	#set a0 (as a parameter) to s0 - 1
	mv a0, t0
	
	
	#calling this will change our a0 register from what we passed it (s0 -1) to the result F(s0 - 1)
	#our s0 value should be untouched however
	
	jal ra, FIBONACCI
	
	#save a0 so we can change to the paramater for our next call
	mv s1, a0
	
	#pass S0 - 2
	addi t0, s0, -2
	
	#set a0 (as a parameter) to s0 - 2
	mv a0, t0
	
	#Call for S0 - 2
	jal ra, FIBONACCI
	
	#save return value
	mv s0, a0
	
	#now just need to return s1 + s0
	
	#set our a0 again but this time as a return value
	add a0, s0, s1
	
	j RETURN
	
	
	ZERO:
		#Base case 0, return 0 and exit
		mv a0, zero
		j RETURN
	
	ONE:
		#Base case 1, return 1 and exit
		li a0, 1
		j RETURN
	
	RETURN:
		#need to clean up what we changed in the function
		
		#shift back stack pointer
		#reset s registers
		
		#our current stack frame has the values saved from the scope this function was called from so we can revert them
		
		
		lw ra, 0(sp)
		lw s0, 4(sp)
		lw s1, 8(sp)
		
		addi sp, sp, 16
		
		
		#return
		jalr ra
	
	
		
	
	
	#call Fibonacci on n-1
	
EXIT: