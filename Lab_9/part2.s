.data

# Messages
msg_1: .asciz "Please take a deep breath "
msg_2: .asciz "Please drink some water "
msg_3: .asciz "Please give your eyes a break "

# Timer Related
timeNow: .word 0xFFFF0018 # current time
cmp: .word 0xFFFF0020 # time for new interrupt

.text
# Display Related
.eqv OUT_CTRL 0xffff0008
.eqv OUT 0xffff000C

main:
	la s0, timeNow
	la s1, cmp
	# Set time to trigger interrupt to be 5000 milliseconds (5 seconds)
	li s2, 5000
	sw s2, 0(s1)

	# Set the handler address and enable interrupts
	la t0, timer_handler
	csrrw zero, utvec, t0
	csrrsi zero, ustatus, 0x1
	csrrsi zero, uie, 0x10
	
	li s7, 0xFFFF000c # Transmitter data register (bottom 8 bits)
	li s8, 0xFFFF0008 # Transmitter control register (bottom bit)
	li t5, 0
	li t6, 32
	
	
	# Loop over the messages
LOOP:
	la s3, msg_1 
	bne s1, s2, LOOP

LOOP_BYTES:
	lb s4, 0(s3) # Load in letter
	beqz s8, LOOP_BYTES # Wait until ready
	sw s4, 0(s7) # Print letter
	addi s3, s3, 1 # Move to next byte
	addi t5, t5, 1
	bne t5, t6, LOOP_BYTES
	
	li t5, 0
	j LOOP


timer_handler:
# Push registers to the stack
	# Saving used registers
	addi sp, sp -12
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	
	# Indicate that 5 seconds have passed
	la s0, timeNow
	la s1, cmp
	li s2, 5000
	sw s2, 0(s1)

	# Pop registers from the stack
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)

	addi sp, sp, 12
	
	uret
