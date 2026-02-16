    .data
str:    .asciiz "hello world"
ch:     .byte 'l'

    .text
    .globl main
main:
    la      t1, str       # pointer for walking the string
    lb      a1, ch        # load search char into a1
    li      t0, 0         # initialize last occurrence pointer = NULL

loop:
    lb      t2, 0(t1)     # load current char
    beq     t2, zero, finish   # if end of string
    beq     t2, a1, mark      # if match

    j       next_char

mark:
    mv      t0, t1          # record last occurrence

next_char:
    addi    t1, t1, 1       # move to next char
    j       loop

finish:
    mv      a0, t0          # return pointer in a0
    nop                     # (end of program)
