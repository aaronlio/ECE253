# Vars
	# s2: holds entire list
	# s1: holds number of items in list
	# t1: outer loop index
	# t2: inner loop index
	# t3: 1

	# t5: holds value to compare #1
	# t6: holds value to compare #2
	# a1: holds shifted list (current item at index zero)
	
.global _start
.text
_start:
	la s2, LIST # Load the memory address into s2
	
	lw s1, 0(s2)
	addi t1, s1, 1 #outer loop index
	addi t2, zero, 1 # inner loop index
	
	addi t3, zero, 1 # register to hold constant value 1

	
LOOP_size:
	beq t1, t3, END #when the outer loop size is 1 the list is sorted
	sub t1, t1, t3 # decrement outer loop
	mv t2, t3 #reset t2 to 1
	
LOOP:
	beq t1, t2, LOOP_size 
	
	slli a1, t2, 2 # j * 4 to get next elem address in list
	add a1, a1, s2 # shift list to so value to compare is at first index
	
	jal SWAP
	add t2, t2, t3 # increment j
	j LOOP

SWAP: 
	lw t5, 0(a1)
	lw t6, 4(a1)
	
	bgt t6, t5, CORRECT_ORDER
	
	sw t6, 0(a1)
	sw t5, 4(a1)
	
	addi a0, zero, 1
	jr ra

CORRECT_ORDER:
	addi a0, zero, 0
	jr ra
END: 
	ebreak
	
	
.global LIST
.data 
LIST:
.word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33