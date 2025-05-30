# Radhika Agrawal
# CS 255 - HW 5

.data   

input_cents:         .asciiz "\nHow many cents to make change? "
input_num_denom:     .asciiz "How many denominations? "
input_denominations: .asciiz "Enter the denominations: "
incorrect_input:     .asciiz "Enter a POSITIVE number! "
output_start:        .asciiz "\nYou will need: "
output_mid:          .asciiz " of the "
output_end:          .asciiz " cent coins\n"
go_again:            .asciiz "\nGo again? (1: yes, 0: no) "

.align 2

denominations:       .space 40

.text   

.globl main    

main:

    While_Loop:
    addi $sp, $sp, -8
    sw $ra, 4($sp)

    la $a0, input_cents
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 5
    syscall
    add $s0, $v0, $zero

    la $a0, input_num_denom
    addi $v0, $zero, 4
    syscall

    addi  $v0, $zero, 5
    syscall
    add $s1, $v0, $zero

    la $t3, denominations
    addi $sp, $sp, -8
    sw $t3, 4($sp)
    sw $s1, 0($sp)
    jal Read_Num

    la $t1, denominations
    add $t2, $zero, $zero
    la $a0, output_start
    addi $v0, $zero, 4
    syscall

Denomination:
    beq $t2, $s1, Continue
    lw $s2, 0($t1)
    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $s2, 8($sp)
    jal Process_Denomination

Skip_Output:
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j Denomination

Continue:

    lw $ra, 4($sp)
    addi $sp, $sp, 8

    la $a0, go_again
    addi $v0, $zero, 4
    syscall

    addi  $v0, $zero, 12
    syscall

    addi $t0, $zero, 121
    beq $v0, $t0, While_Loop 

    addi $t0, $zero, 110  
    beq $v0, $t0, End 

End:
    addi  $v0, $zero, 10
    syscall

Read_Num:

    lw $a0, 4($sp)
    lw $a1, 0($sp)

    add $t0, $zero, $zero

Read_Loop:
	beq $t0, $a1, Exit_Read_Loop
	addi $v0, $zero, 5
    syscall

    sw $v0, 0($a0)  
    addi $t0, $t0, 1 
    addi $a0, $a0, 4  
    j Read_Loop

Exit_Read_Loop:

    addi $sp, $sp, 8
    jr $ra  

Process_Denomination:
    lw   $a0, 4($sp)       
    lw   $a1, 8($sp)       
    div $t0, $a0, $a1  
    mflo $v0  
    mfhi $v1  
    addi $sp, $sp, 8

    add $s0, $v1, $zero  
    beq $v0, $zero, Skip_Output  
    add $a0, $v0, $zero
    addi $v0, $zero, 1
    syscall
    
    la $a0, output_mid
    addi $v0,$zero, 4
    syscall

    add $a0, $s2, $zero
    addi $v0, $zero, 1
    syscall

    la $a0, output_end
    addi $v0, $zero, 4
    syscall

    jr $ra 