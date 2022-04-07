.data

msg1: .asciiz "\nIngrese un numero: "
msg2: .asciiz "\nEl maximo comun divisor es: "
.text
.globl main
main:
    # imprimimos el msg1
    li $v0,4
    la $a0,msg1
    syscall
    # recibimos el ingreso de usuario
    li $v0,5
    syscall
    move $a1,$v0
    # imprimimos el msg1
    li $v0,4
    la $a0,msg1
    syscall
    # recibimos el ingreso de usuario
    li $v0,5
    syscall
    move $a0,$v0

    # imprimimos el msg1
    li $v0,4
    la $a0,msg1
    syscall

    jal MCD # llamado a la funcion MCD

    add $a0,$v0,$zero 
    li $v0,1
    syscall
li $v0, 10
syscall

MCD:
    # MCD(n1, n2)
    # n1 = $a0
    # n2 = $a1

    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    add $s0, $a0, $zero
    add $s1, $a1, $zero

    addi $t1, $zero, 0
    beq $s1, $t1, return1

    add $a0, $zero, $s1
    div $s0, $s1
    mfhi $a1

    jal MCD

exitMCD:
    lw $ra, 0 ($sp)
    lw $s0, 4 ($sp)
    lw $s1, 8 ($sp)
    addi $sp,$sp , 12
    jr $ra
return1:
    add $v0, $zero, $s0
    j exitMCD