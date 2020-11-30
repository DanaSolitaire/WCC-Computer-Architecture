# Code by 1

#By the way, any text followed by a "#" is a comment

#Data section of the MIPS assembly
.data
# Create a label of A with a list of integers (ie array)
A:	.word	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 234, 20, 40
# Create a label of B with an allocation of 40 bytes (enough for an array of 10 words)
B:	.space	52

#Mips code starts
.text

	
	#The following is called a pseudo instruction, it really asssembles into TWO instructions
	#What what happens when you execute it
	#Get the address of the variable A and put it in register s6
	la	$s6,	A
	#Get the address of the variable B and put it in register s7
	la	$s7,	B

	#DO NOT REMOVE THIS COMMENT - Your code BELOW
	
	sub	$t0,	$s3,	$s2
	add 	$t1,	$t0,	$s4		#t1 is calculated index
	sll	$t3,	$t1,	2		#t3 is offset, 2^2 = 4
	add	$t4,	$s6,	$t3
	lw	$t2,	0($t4) 			#t2 = *(t4)
	add	$t0,	$t2,	$s1
	sw	$t6,	$t0($s7)

	
	#DO NOT REMOVE THIS COMMENT - Your code ABOVE

#This is a exit label, if we do not do the following two lines you will see a message about falling of the bottom
#The next two lines are the equivalent of return 0 in C++
#I will never require the syscall functions on an quiz or exam
exit:
	addi   	$v0, 	$0,	10	# system call for exit
	syscall               			# we are out of here.
