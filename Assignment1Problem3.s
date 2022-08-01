# Travis Cassell
# CS 321 01
# Assignment 1 Problem 3
# Using Mars Mips Simulator
# Write an Assembly language code that returns the result based on the logic given.
#
# If n is even, it returns the result of below expression
# n^2 + (n − 1)^2 + (n − 2)^2 + (n-3)^2 +(n-4)^2 +( n-5)^2

# If n is odd , it returns the result of below expression
# n^2 + (n + 1)^2 + (n + 2)^2 + (n+3)^2 +(n+4)^2 +( n+5)^2

.data
input: .asciiz "Enter an integer: "
output: .asciiz "The answer is: "

.text
# Print input prompt
li $v0, 4
la $a0, input
syscall

# Take integer from user
li $v0, 5
syscall
move $t0, $v0

# Save int into another register to test for even or odd
addi $t2, $zero, 2  # Save 2 for modulo division (check even/odd)
add $t1, $zero, $t0 # Backup of user int for div
div $t1, $t2
mfhi $t1            # Pull HI bits
bnez $t1, odd       # If remainder != 0, branch to odd

# Logic for even int
even:
    # n^2 + (n − 1)^2 + (n − 2)^2 + (n-3)^2 +(n-4)^2 +( n-5)^2
    # Calculate parentheses subtractions
    #                   # n stored in $t0
    addi $t1, $t0, -1   # n - 1 $t1
    addi $t2, $t0, -2   # n - 2 $t2
    addi $t3, $t0, -3   # n - 3 $t3
    addi $t4, $t0, -4   # n - 4 $t4
    addi $t5, $t0, -5   # n - 5 $t5
    b multiply
    
# Logic for odd int
odd:
    # n^2 + (n + 1)^2 + (n + 2)^2 + (n+3)^2 +(n+4)^2 +( n+5)^2
    # Calculate parentheses additions
    #                  # n stored in $t0
    addi $t1, $t0, 1   # n + 1 $t1
    addi $t2, $t0, 2   # n + 2 $t2
    addi $t3, $t0, 3   # n + 3 $t3
    addi $t4, $t0, 4   # n + 4 $t4
    addi $t5, $t0, 5   # n + 5 $t5
    b multiply

# Square numbers and add together
multiply:
    # Do multiplications, number * itself for square
    mult $t0, $t0
    mflo $t0
    mult $t1, $t1
    mflo $t1
    mult $t2, $t2
    mflo $t2
    mult $t3, $t3
    mflo $t3
    mult $t4, $t4
    mflo $t4
    mult $t5, $t5
    mflo $t5
    
    # Add all together
    add $t0, $t0, $t1
    add $t0, $t0, $t2
    add $t0, $t0, $t3
    add $t0, $t0, $t4
    add $t0, $t0, $t5
    
# Print output
li $v0, 4
la $a0, output
syscall

# Print out sum
li $v0, 1
add $a0, $t0, $zero
syscall

li $v0, 10
syscall

