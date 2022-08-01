# Travis Cassell
# CS 321 1
# Assignment 1 Problem 2
# Using Mars Mips Simulator
# 2 Convert pseudocode given below into Assembly code. 10 points
# int A[]={4, 8, 12, 16, 20, 24, 28}
# int sum=0
# for( int i=0;i<7;i++)
# {
#   if i%2==0
#     {
#       sum+=A[i]
#     }
# }

.data
# Create space in memory for array of 7 elements of size 32 bits
A: .word 4, 8, 12, 16, 20, 24, 28
# Save string array for output
output: .asciiz "The sum is: "

.text
# Load address of elemnt 0 of array
la $a1, A
addi $t7, $zero, 2 # Put integer 2 into register $t7 for modulo
addi $t4, $zero, 0 # Sum added to register $t4, initialized to 0
addi $t0, $zero, 7 # Register $t0 store 7 for # array elements to iterate through
# Main array loop
A_loop:
    beqz $t0, end_A_loop # If out of elements, end loop
    subi $t0, $t0, 1     # Decrement # iterations needed
    lw $t1, ($a1)        # Load current element of array
    add $t2, $zero, $t1  # Save array element in $t2
    addi $a1, $a1, 4     # Move to next element
    div $t1, $t7         # Division of element by 2
    mfhi $t3             # Pull remainder to $t3
    bgtz $t3, A_loop     # If i%2 > 0, go back to top of loop
    add $t4, $t4, $t2    # Otherwise add element to accumulator
    b A_loop             # Branch back to main loop
    
end_A_loop:                  # End of array loop

# Print output
li $v0, 4
la $a0, output
syscall

# Print out sum
li $v0, 1
add $a0, $t4, $zero
syscall

li $v0, 10
syscall
