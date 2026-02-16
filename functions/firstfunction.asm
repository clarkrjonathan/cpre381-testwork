#first function
#function takes in two values, returns the sum
.data

num1: .word 12
num2: .word 18

.text 


#load parameters
lw a0, num1
lw a1, num2
#call function
jal ra, FUNCTION

#pull value off stack
#put into t0
lw s0, 0(sp)

#move stack pointer back
addi sp, sp, 16

j EXIT

#Function label to jump to
#importantly this label is a constant known offset so we use jump and link which uses an immediate value
FUNCTION:

	#store sum in t0
	add t0, a0, a1
	
	#storing a word to memory (our return value on the stack)
	
	#allocate one word in stack
	addi sp, sp, -16
	
	sw t0, 0(sp)

jalr x0, 0(ra)

EXIT:
#exit program