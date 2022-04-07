.data
esPar: .asciiz "\nEl numero es par "
esImpar: .asciiz "\nEl numero es impar"
msg1: .asciiz "\nIngrese un numero: "
.text
main:
# imprimimos el msg1
li $v0,4
la $a0,msg1
syscall

# recibimos el ingreso de usuario
li $v0,5
syscall
move $t0,$v0

li $t1,2
div $t0,$t1
mfhi $t1

beq $t1,0,par

impar:
    # imprimimos el msg1
    li $v0,4
    la $a0,esImpar
    syscall
    li $v0,10
    syscall
par:
    # imprimimos el msg1
    li $v0,4
    la $a0,esPar
    syscall
    li $v0,10
    syscall