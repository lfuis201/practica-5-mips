.data
    msg1: .asciiz "\nIngrese un numero: "
    msg2: .asciiz "\nLos numeros impares hasta "
    msg3: .asciiz "son: "
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

li $t0 0

# incompleto
loop:
bgt $t0,$t1, exit     

addi $t0,$t0,1       # i=i+1
div $t2,t0,2

beq $t2,0,print

print:
li $v0,1
move $a0, $t0
syscall

li $a0 ' '
li $v0 11
syscall
b multing            # repeat loop

exit:
li $v0,10
syscall