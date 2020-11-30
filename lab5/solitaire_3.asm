# Code by {Your name here}

#By the way, any text followed by a "#" is a comment

#Data section of the MIPS assembly
.data
# Create a label of A with a list of integers (ie array)
A:	.word	1, 2, 4, 8, 16, 32, 64, 128, 256, 512
# Create a label of B with an allocation of 40 bytes (enough for an array of 10 words)
B:	.word	23,4,2,4,5,6,7,1,45,66

#Mips code starts
.text

	addi	$s0,	$0,	5	#f
	addi	$s1,	$0,	10	#g
	addi	$s2,	$0,	15	#h
	addi	$s3,	$0,	20	#i
	addi	$s4,	$0,	3	#j
	
	#The following is called a pseudo instruction, it really asssembles into TWO instructions
	#What what happens when you execute it
	#Get the address of the variable A and put it in register s6
	la	$s6,	A
	#Get the address of the variable B and put it in register s7
	la	$s7,	B

	#DO NOT REMOVE THIS COMMENT - Your code BELOW
	lw $t1,	0($s7)
	lw $t2,	4($s7)
	lw $t3, 8($s7)
	
	add $t1,	$t1,$t2			# t1 = b[0] + b[1]
	add $t1,	$t1,$t3		#t1 = t1 + b[2]
	sw $t1,	0($s6)
	
	add $t1,	$s0,$s1
	sw $t1, 4($s6)
	
	sub $t1,	$s3,$s2
	sw $t1, 8($s6)
	
	
	
	
	#DO NOT REMOVE THIS COMMENT - Your code ABOVE

#This is a exit label, if we do not do the following two lines you will see a message about falling of the bottom
#The next two lines are the equivalent of return 0 in C++
#I will never require the syscall functions on an quiz or exam
exit:
	addi   	$v0, 	$0,	10	# system call for exit
	syscall               			# we are out of here.
