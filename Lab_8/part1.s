.global _start
.text

_start:
	la s2, LIST
	lw s3, 0(s2)
	addi s9, zero, 0 # Temporary variable
	addi s10, zero, 0 # Stores the results
	addi s11, zero, -1 # Used to terminate the LOOP
	addi a0, zero, 0 # Stores the results of the ONES subroutine
	
LOOP: 
	lw s3, 0(s2)
	add s9, s9, s3
	beq s3, s11 END
	addi s2, s2, 4
	jal ONES
	b LOOP
	
ONES: 
	beqz s3, COMPARE
	srli s9, s3, 1
	and s3, s3, s9
	addi a0, a0, 1
	j ONES
	
COMPARE:
	bge s10, a0, FINISH
	addi s10, a0, 0
	j ONES
	
FINISH:
	xor a0, a0, a0
	jr ra
	
END:
	ebreak
	
.global LIST
.data
LIST:
.word 0x0101, 0x1, 0x11, 0xf, 0xff, 0xf, 0xfff,-1