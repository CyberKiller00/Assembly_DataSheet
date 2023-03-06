Add R0,R1,R2 ;R0=R1+R2
Sub R0,R1,R2 ;R0=R1-R2
Add R0,R0,#5 ;R0=R0+5

;CPSR => N = negative, V = OverFlow , C = CarryOut , Z = Zero , M = mode , I = Interrupt

Adc R0,R1,R2 ; R0=R1+R2+C
Sbc R0,R1,R2 ; R0=R1-R2-C

Cmp R0,R1 ;R0-R1 e atualiza os bits de estado de CPSR

mov R0,#5 ;copia o valor 5 para o reg0 e 0 para os bits de maior peso ----> reg0 = 0000 0000 0000 0101
movt R0,#5 ;copia o valor 5 para os bits de maior peso de reg0 ---> reg0 = 0000 0101 0000 0000

;se fizermos mov e depois movt com os mesmos exemplos reg0 = 0000 0101 0000 0101
;se for feito movt e depois mov reg0 = 0000 0000 0000 0101

mvn R0,R1 ;R0 = Not R1
And R0,R1,R2 ;R0 = R1 & R2 (bit a bit)
Orr R0,R1,R2 ;R0 = R1 | R2 (bit a bit)
Eor R0,R1,R2 ;R0 = R1 xor R2 (bit a bit)


LSL R0,R1,#4 ;R0 = logical shift left 4 bits de R1
LSR R0,R1,#4 ;R0 = logical shift right 4 bits de R1
ASR R0,R1,#4 ;R0 = aritmetic shift right 4 bits de R1


ROR R0,R1,#4 ;R0 = dá rotate para a direita 4 bits
;Se R1 = 0000 0000 0000 1001 , com o rotate R0 = 1001 0000 0000 0000

;labels = "nome": ou seja "loop:" é uma label

loop:
Add R0,R1,R2
Sub R0,R1,R2
;Quando o label for chamado este realizará o Add , pois o label é apenas a expressão seguinte

loop:
Add R0,R1,R2 ;1
Sub R0,R1,R2 ;2
B loop
;Este excerto de código realiza os pontos 1,2,1 , pois B(Branch) serve para chamar e realizar o label

bzc/bne label ; se Z = 0 então realiza a label
bzs/beq label ; se Z = 1 então realiza a label

Bhs/Bcc Label ;se C = 0 então realiza Label
Blo/Bcs Label ;se C = 1 então realiza Label

Blt Label ; se N xor V = 0 então realiza Label
Bge Label ; se N xor V = 1 então realiza Label

;condições para inteiros não assinalados

 cmp R0, R1 bne label ;(a == b)
 cmp R0, R1 beq label ;if(a != b)
 cmp R1, R0 bhs label ;if(a > b)
 cmp R0, R1 bhs label ;if(a < b)
 cmp R0, R1 blo label ;if(a >= b)
 cmp R1, R0 blo label ;if(a <= b)

 ;condições para inteiros assinalados

  cmp R0, R1 bne label ;if(a == b)
 cmp R0, R1 beq label ;if(a != b)
 cmp R1, R0 bge label ;if(a > b)
 cmp R0, R1 bge label ;if(a < b)
 cmp R0, R1 blt label ;if(a >= b)
 cmp R1, R0 blt label ;if(a <= b)