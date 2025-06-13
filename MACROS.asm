.data

.eqv STRING 4
.eqv SLEEP 32
.eqv READCHAR 12
.eqv EXIT 10
.eqv CHAR 11
.eqv RANDINT 42

###############################################
#					MACROS					  #
###############################################

.macro print(%str)
	.data
	texto: .asciz %str
	
	.text
	li a7, STRING
	la a0, texto
	ecall
.end_macro

# Pausa a execu��o do programa pelo tempo dado por %int (em milissegundos)
.macro delay(%int)
	.text
	li a7, SLEEP
	li a0, %int
	ecall
.end_macro
