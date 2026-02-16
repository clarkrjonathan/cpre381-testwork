#set s0 to biggest value

#load values into registers
addi t0, zero, 18
addi t1, zero, 20

bge t0, t1, GREATER

#if we reach here then the condition wasnt met so t1 is bigger
mv s0, t1

j EXIT


#t0 is greater or equal to t1
GREATER:
#set s0 to t0
mv s0, t0

EXIT:
#exit program