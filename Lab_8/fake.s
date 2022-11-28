.global _start 
.text 

_start: 
	la s8, LIST		# load memory address of LIST into s8 
	addi s7, zero, 1	# compare against for length of list
	
	lw s1, 0(s8)		# load # of elements into s1 
	addi s1, s1, 1		# i counter: add 1 to # of elements bc 1 is subtracted in loop 
				# (but swap needs to check until end)
	addi, s2, zero, 1	# j counter

LISTLENGTH:
	beq s1, s7, END		# if length of list = 1, then done sort
	addi s1, s1, -1		# i--
	addi s2, zero, 1	# add 1 to s2 for each j loop 

COMPARE:
	beq s1, s2, LISTLENGTH	# if j (s2) <= i (s1), passed you need to where to check 
	addi s4, zero, 0 
	addi s5, zero, 0
	addi s6, zero, 0 
	
	slli s0, s2, 2		# add s2 shifted left by 2 (s2 multiplied by 2^2) >> shifting by multiple of four to get to the next elem of list
	add s0, s0, s8 		# assign list to s0
	addi s4, s0, 4		# assgin s4 to next word in list (s0)
	
	jal SWAP 
	addi s2, s2, 1		# j++ to go to next element 
	b COMPARE 		# loop compare 

SWAP:
	addi sp, sp, -8		# allocate 2 word locations on stack 
	sw s5, 4(sp) 		# push s5 to stack
	sw s6, 0(sp)		# push s6 to stack
	
	lw s5, 0(s0)		# 1st element 
	lw s6, 0(s4)		# 2nd element
	
	bgt s6, s5, NOSWAP	# no swap if 2nd element > 1st element
	
	sw s5, 0(s4)		# otherwise, perform swap
	sw s6, 0(s0)		
	addi s0, zero, 1	# return 1 if swapped
	b EXIT
	
NOSWAP:
	addi s0, zero, 0	# return 0 if no swap

EXIT:
	addi sp, sp, 8 		# pop stack, s5 and s6
	jr ra 
	
END:
	ebreak
	
	
.global LIST
.data 
LIST:
.word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33
