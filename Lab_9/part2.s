.data

# Messages
msg_1: .asciz "Please take a deep breath      "
msg_2: .asciz "Please drink some water        "
msg_3: .asciz "Please give your eyes a break  "

# Timer Related
timeNow: .word 0xFFFF0018 # current time
cmp: .word 0xFFFF0020 # time for new interrupt

.text
# Display Related
.eqv OUT_CTRL 0xffff0008
.eqv OUT 0xffff000C

main:
	lw s0, timeNow
	lw s1, cmp
	# Set time to trigger interrupt to be 5000 milliseconds (5 seconds)
	li s2, 5000
	sw s2, 0(s1)
	la s3, msg_1
	li s6, 268501088

	# Set the handler address and enable interrupts
	la t0, timer_handler
	csrrw zero, utvec, t0
	csrrsi zero, ustatus, 0x1
	csrrsi zero, uie, 0x10
	
	li s7, 0xFFFF000c # Transmitter data register (bottom 8 bits)
	li s8, 0xFFFF0008 # Transmitter control register (bottom bit)
	
	li t5, 0
	li t6, 32
	
	addi t4, zero, 0
	
	
	# Loop over the messages
LOOP:
	beqz t4, LOOP
	jal pick_word

LOOP_BYTES:
	lb s4, 0(s3) # Load in letter
	beqz s8, LOOP_BYTES # Wait until ready
	sw s4, 0(s7) # Print letter
	addi s3, s3, 1 # Move to next byte
	addi t5, t5, 1
	bne t5, t6, LOOP_BYTES
	
	li t5, 0
	addi t4, t4, -1
	j LOOP

pick_word:
	beq s3, s6, subtract
	jr ra
	
subtract:
	addi, s3, s3, -96
	jr ra

timer_handler:
# Push registers to the stack
	# Saving used registers
	addi sp, sp -12
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	
	addi t4, t4, 1
	# Indicate that 5 seconds have passed
	li s0, 0xFFFF0018
	li s1, 0xFFFF0020
	
	lw s2, 0(s0)
	li a7, 5000
	
	add s2, s2, a7
	sw s2, 0(s1)

	# Pop registers from the stack
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)

	addi sp, sp, 12
	
	uret
