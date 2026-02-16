#HW2 1C

#init a0
li a0, 59

#first check if bigger than 90
li t0, 90
bge a0, t0, GRADE_A

#then 80
li t0, 80
bge a0, t0, GRADE_B

#then 70
li t0, 70
bge a0, t0, GRADE_C

#then 60
li  t0, 60
bge a0, t0, GRADE_D

j GRADE_F

GRADE_A:
	li a1, 65
	j EXIT

GRADE_B:
	li a1, 66
	j EXIT

GRADE_C:
	li a1, 67
	j EXIT

GRADE_D:
	li a1, 68
	j EXIT

GRADE_F:
	li a1, 70
	j EXIT


EXIT: