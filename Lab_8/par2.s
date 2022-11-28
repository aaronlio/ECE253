# steps:
	# start at first element, SWAP(element_1, element_2)
	# SWAP(new_elem_2, elem_3)... continue until end of list.
	# add the return of each swap to a variable
	# if any swaps have been made, the return from at least 1 SWAP subroutine call will be 1
	# if the SWAP_sum > 0, must repeat the bubble sort process, else, return the list

.global _start
.text
_start:
	la s2, LIST # Load the memory address into s2
	
	lw a1, 0(s2)
	addi t1, a1, 1 #outer loop index
	addi t2, zero, 1 # inner loop index
	
	addi s0, zero, 1 # register to hold constant value 1

	
LOOP_size:
	beq t1, s0, END #when the outer loop size is 1 the list is sorted
	sub t1, t1, s0
	
	
LOOP:
	bge t1, t2, LOOP_size # if t1

SWAP: 
	addi sp, sp, -8 
	sw t0, 4(sp)
	sw t1, 0(sp)

SWAP_vals:


END: 
	ebreak
	
		
