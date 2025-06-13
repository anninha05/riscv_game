.data
color_white: .word 0x00ffffff
color_black: .word 0x00000000
color_red: .word 0x00ff0000
color_cyan: .word 0x0000ffff
color_orange: .word 0x00ffa500
color_green: .word 0x0000ff00
color_yellow: .word 0x00ffff00

.include "MACROS.asm"


.text

 addi t4,x0,0

loop:
 
   mv t1,x0 #posição do pixel X do desenho
   mv t0,x0 #posição do pixel Y do  desenho
   
   addi t1,t2,1
   addi t0,t3,0

   mv a0, t1    # X
   mv a1,t0  #Y
   jal recupera_ponto
   lw a3, color_white
   beq a2, a3, fim
 
 
 addi t4,t4,1 #t4++

 addi t0,x0,1
 beq t4, t0, turno_um
 
 addi t0,x0,2
 beq t4, t0, turno_dois
 
 addi t0,x0,3
 beq t4,t0, fim
 
 addi t0,x0,4
 beq t4,t0, fim
 
 addi t0,x0,5
 beq t4,t0, fim
 
 addi t0,x0,6
 beq t4,t0, fim
 
 addi t0,x0,7
 beq t4,t0, fim
 
 addi t0,x0,8
 beq t4,t0, fim
 
 addi t0,x0,9
 beq t4,t0, fim
 
 turno_um:
 mv t1,x0
 addi t5,x0,0
 print("turno 1: digite um numero de um a nove")
 
 li a7, 5
 ecall
 mv t1,a0
 
 addi t0,x0,1
 beq t1, t0, casa_1
 
 addi t0,x0,2
 beq t1, t0, casa_2
 
 addi t0,x0,3
 beq t1,t0, casa_3
 
 addi t0,x0,4
 beq t1,t0, casa_4
 
 addi t0,x0,5
 beq t1,t0, casa_5
 
 addi t0,x0,6
 beq t1,t0, casa_6
 
 addi t0,x0,7
 beq t1,t0, casa_7
 
 addi t0,x0,8
 beq t1,t0, casa_8
 
 addi t0,x0,9
 beq t1,t0, casa_9
 
 j turno_um
 
 turno_dois:
 mv t1,x0
 addi t5,x0,1
 print("turno 2: digite um numero de um a nove")
 
 li a7, 5
 ecall
 mv t1,a0
 
 addi t0,x0,1
 beq t1, t0, casa_1
 
 addi t0,x0,2
 beq t1, t0, casa_2
 
 addi t0,x0,3
 beq t1,t0, casa_3
 
 addi t0,x0,4
 beq t1,t0, casa_4
 
 addi t0,x0,5
 beq t1,t0, casa_5
 
 addi t0,x0,6
 beq t1,t0, casa_6
 
 addi t0,x0,7
 beq t1,t0, casa_7
 
 addi t0,x0,8
 beq t1,t0, casa_8
 
 addi t0,x0,9
 beq t1,t0, casa_9
 
 
 
 
 
 casa_1:
 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 0
 addi t3,x0,0

 beq t5,x0, desenha_bola
 j desenha_x
 
 
 casa_2: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 6
 addi t3,x0,0
 
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_3: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 12
 addi t3,x0,0
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_4: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 0
 addi t3,x0,6
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_5: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 6
 addi t3,x0,6
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_6: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 12
 addi t3,x0,6
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_7: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 0
 addi t3,x0,12
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_8: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 6
 addi t3,x0,12
 
 beq t5,x0, desenha_bola
 j desenha_x
 
 casa_9: 
 mv t2,x0
 mv t3, x0
 
 addi t2, x0, 12
 addi t3,x0,12
 
 beq t5,x0, desenha_bola
 j desenha_x
 

	
	
 j turno_um
 
 
desenha_bola:

   #
   mv t1,x0 #posição do pixel X do desenho
   mv t0,x0 #posição do pixel Y do  desenho
   
   addi t1,t2,1
   addi t0,t3,0

   mv a0, t1    # X
   mv a1,t0  #Y
   lw a2, color_red
   jal desenha_ponto
   #
    
   #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,2
   addi t0,t3,0
    
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
   #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,3
   addi t0,t3,0
    
   mv a0, t1    # X
   mv a1, t0  #Y
   lw a2, color_red
   jal desenha_ponto
   #
    
   #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,4
   addi t0,t3,1
    
   mv a0, t1    # X
   mv a1, t0  #Y
   lw a2, color_red
   jal desenha_ponto
   #
   
   #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,4
   addi t0,t3,2
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,4
   addi t0,t3,3
    
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,3
   addi t0,t3,4
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,2
   addi t0,t3,4
    
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,1
   addi t0,t3,4
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,0
   addi t0,t3,1
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,0
   addi t0,t3,2
    
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,0
   addi t0,t3,3
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    j loop
    
    
desenha_x:

   #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,0
   addi t0,t3,0
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,1
   addi t0,t3,1
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,2
   addi t0,t3,2
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,3
   addi t0,t3,3
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
   mv t1,x0
   mv t0,x0
   
   addi t1,t2,4
   addi t0,t3,4
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,1
   addi t0,t3,3
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,0
   addi t0,t3,4
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,3
   addi t0,t3,1
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    mv t1,x0
   mv t0,x0
   
   addi t1,t2,4
   addi t0,t3,0
   
    mv a0, t1    # X
    mv a1, t0  #Y
    lw a2, color_red
    jal desenha_ponto
    #
    
    #
    j loop
    #

desenha_ponto:
    slli t1, a1, 6          # y * 64
    add t1, a0, t1          # + x
    slli t1, t1, 2          # * 4 (bytes)
    add t1, t1, gp          # + base
    sw a2, 0(t1)            # armazena cor
    jr ra
    
recupera_ponto:
    slli t1, a1, 6          # y * 64
    add t1, a0, t1          # + x
    slli t1, t1, 2          # * 4 (bytes)
    add t1, t1, gp          # + base
    lw a2, 0(t1)            
    jr ra
    
    
fim:
li a7, 10
ecall