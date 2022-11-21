.global _start
.text

_start:
	la s2, LIST
	addi s10, zero, 0
	addi s11, zero, 0
	
	# Write your code here
	lw s9, 0(s2)
	addi s8, zero, -1
	
WHILE:
	beq s9, s8, END
	add s10, s10, s9
	addi s11, s11, 1  
	addi s2, s2, 4
	lw s9, 0(s2)
	j WHILE
END:
	ebreak
	
.global LIST
.data
LIST:
.word 1, 1, 1, 1, 100, -1