.global _start
.text

_start:
	li s0, 0xFFFF0004 # Receiver data register (bottom 8 bits)
	li s1, 0xFFFF0000 # Receiver control register (bottom bit)
	li s2, 0xFFFF000c # Transmitter data register (bottom 8 bits)
	li s3, 0xFFFF0008 # Transmitter control register (bottom bit)
	
POLL:
	lw s4,  0(s1)
	beqz s4, POLL

UPDATE:
	lw s5, 0(s0)
	beqz s3, UPDATE
	sw s5, 0(s2)
	j POLL
	
END:
	ebreak
	

