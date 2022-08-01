# Travis Cassell
# CS 321 01
# Using Mars Mips Simulator
# Assignment One Problem One
#
# Write an Assembly language code that takes in two numbers b and p, and returns the
# result of below expression
#
# x= ((b+5) * (p-2) * 10) / 4;

.data
input_b: .asciiz "Enter the first number: "
input_p: .asciiz "Enter the second number: "
result_x: .asciiz "x quotient: "
result_x_remainder: .asciiz ", remainder is: "

.text
# Display the prompt for input_b
li $v0, 4
la $a0, input_b
syscall

# Read the first integer from user for "b"
li $v0, 5
syscall
move $t0, $v0

# Display the prompt for input_p
li $v0, 4
la $a0, input_p
syscall

# Read in the second integer from user for "p"
li $v0, 5
syscall
move $t1, $v0

# Add (b + 5)
addi $t0, $t0, 5

# Add (p - 2)
subi $t1, $t1, 2

# Multiply (b result) * (p result)
mult $t0, $t1
mflo $t2

# Multiply result of (b result) * (p result) by 10
addi $t4, $zero, 10
mult $t2, $t4
mflo $t5

# Divide result of ((b result) * ( result) * 10) by 4
addi $t6, $zero, 4
div $t5, $t6
mflo $t0
mfhi $t1
bgtz $t1, finish # If remainder positive, skip the folling, branch to finish

# If remainder negative, make positive
addi $t9, $zero, -1
mult $t1, $t9
mflo $t1

finish:
    # Print out result message
    li $v0, 4
    la $a0, result_x
    syscall

    # Print quotient
    li $v0, 1
    add $a0, $t0, $zero
    syscall

    # Print out remainder message
    li $v0, 4
    la $a0, result_x_remainder
    syscall

    # Print out remainder
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    # Terminate the program
    li $v0, 10
    syscall

