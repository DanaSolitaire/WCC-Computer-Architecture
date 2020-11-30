.data

total:  .word       5
prompt: .asciiz     "Enter number (negative to exit): "
gtr:    .asciiz     " is greater than "
less:   .asciiz     " is less than "
equal:  .asciiz     " is equal to "

.text

    #Get the address of the prompt string and store in s0
    la  $s0,    prompt


    #DO NOT REMOVE THIS COMMENT - Your code BELOW

    #Output prompt
    add $a0,    $s0,    $0
    jal pstrz

    #Read in integer
    jal rint
    #The number entered in by the user is stored in $v0
	la  	$s1,    gtr
	la 	$s2,	less
	la	$s3,	equal
	addi 	$s4,	$zero,	0
 	jal neg
 	
 neg:	
	slti 	$t1,	$v0,	0
	addi 	$s5,	$v0,	0			#less than 0
	beq	$t1,	1,	exit	
			
	slt	$t1,	$s5,	$s4			#existing int < return int
	addi	$a0,	$s2,	0
	beq	$t1,	1,	pstrz	
	
	sgt	$t1,	$s5,	$s4			#existing int > return int
	addi	$a0,	$s1,	0
	beq	$t1,	1,	pstrz	
	
	seq 	$t1,	$s5,	$s4			#existing int > return int
	addi	$a0,	$s3,	0
	beq	$t1,	1,	pstrz
	
	j get
	

		
get:	add $a0,    $s0,    $0
    	jal pstrz
	jal rint
	addi $s4,	$v0,	0
	j neg
 	
    #DO NOT REMOVE THIS COMMENT - Your code ABOVE

    exit:   li      $v0,    10
            syscall

    #########################################
    #pstrz: Print string pointed to by $a0

    pstrz:  addi    $v0,    $0,     4       # specify Print StringZ service
            syscall                         # print string
            jr      $ra

    #########################################
    #rint: Read integer, $v0 will contain the read in integer

    rint:  addi    $v0,    $0,     5       # specify Read Integer service
           syscall                         # read integer
           jr   $ra

    #########################################
    #pintn: Print integer in $a0 followed by newline

    pintn:  addi    $v0,    $0,     1       # specify Print Integer service
            syscall                         # print integer
            j       br

    #########################################
    #break: Print newline

    br:     addi    $v0,    $0,     11      # specify Print Character service
            addi    $a0,    $0,     '\n'
            syscall                         # print newline character
            jr      $ra                     # return



	
	
