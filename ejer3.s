.data
    msg1: .asciiz "\nIngrese un numero: "
    primo: .asciiz "\nEl numero es primo"
    nprimo: .asciiz "\nEl numero no es primo"
.text

main:
# imprimimos el msg1
li $v0,4
la $a0,msg1
syscall

# recibimos el ingreso de usuario
li $v0,5
syscall
move $t1,$v0

# incializamos t2 en 2
li $t2, 2

# excluimos los numeros que son menores o iguales a 1
blt $t1,1,inNotPrime
beq $t1,1,inNotPrime
beq $t1,2,isPrime

# bucle para los numeros primos
loopPrime:

beq $t2,$t1, isPrime
div $t1,$t2
mfhi $t3
beq $t3, $0, inNotPrime
addi $t2,$t2,1

b loopPrime

# imrpimimos si el numero el si es primo
isPrime:
li $v0,4
la $a0,primo
syscall
b exit

# imrpimimos si el numero si no es primo
inNotPrime:
li $v0,4
la $a0,nprimo
syscall
b exit

exit:
li $v0, 10
syscall