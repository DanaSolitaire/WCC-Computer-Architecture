    #Dana Solitaire
    .data
pquot:  .asciiz "Enter a quotient: "
pdiv:   .asciiz "Enter a divisor: "
pmod:   .asciiz " % "
pequ:   .asciiz " = "

    .text

    #Store the address of the quotient prompt message in a0
    la  $a0,    pquot   
    # Call pstr functon, this stores the current pc into $ra
    jal     pstr        
    #Call rint, this function WAITS for user to enter an integer, the integer will be in $v0 when it returns
    jal     rint    
    #Copy the integer the user entered in into s0 so that it is saved for later output
    add     $s0,    $v0,    $zero
    #output a newline
    jal     br

    #Store the address of the quotient prompt message in a0
    la  $a0,    pdiv    
    # Call pstr functon, this stores the current pc into $ra
    jal     pstr        
    #Call rint, this function WAITS for user to enter an integer, the integer will be in $v0 when it returns
    jal     rint    
    #Copy the integer the user entered in into s1 for later output
    add     $s1,    $v0,    $zero
    #output a newline
    jal     br

    #Setup the call to the modulus function
    add $a0,    $0, $s0
    add $a1,    $0, $s1
    jal     mod
    #Save the result to s2
    add     $s2,    $v0,    $zero

    #Output the text part of the result
    add $a0,    $0, $s0
    jal     pint
    la  $a0,    pmod
    jal pstr
    add $a0,    $0, $s1
    jal     pint
    la  $a0,    pequ
    jal pstr    
    #Output the result
    add     $a0,    $0,     $s2
    jal     pint

    j exit


#mod recursive function
#Precondition: Quotient is in a0, divisor is in a1 and is not 0
#Postcondition: Modulus is returned in v0, recursion is used
#Note: The mod label is assumed to exist right above your code
mod:
#DO NOT REMOVE THIS COMMENT - Your code BELOW
	
	#return val/quotient 
	addiu 	$sp,	$sp,	-8
	
	add 	$v0,	$zero,	$a0	
	sw	$a1,	0($sp)
	sw	$a0,	4($sp)
	slt 	$t1,	$a0,	$a1
	slti 	$t2,	$a0,	0
	#if true exit	
	beq 	$a0,	0,	temp
	beq	$t1,	1,	temp
	beq 	$t2,	1,	temp
	

	#val = val - divisor	
	sub 	$a0,	$a0,	$a1
	sw	$a0,	4($sp)
	addiu	$sp,	$sp,	8
	jal mod


temp:	lw	$a0,	4($sp)
	lw	$a1,	0($sp)
	addiu 	$sp,	$sp,	8
	jal	pint
	jr $ra


#DO NOT REMOVE THIS COMMENT - Your code ABOVE

#exit: terminate program

exit:   addi    $v0,    $0,     10          
        syscall                         # System call / send interrupt to OS

#########################################
#pint: Print integer in $a0

pint:   addi    $v0,    $0,     1       # specify Print Integer service
        syscall                         # print integer
        jr      $ra                     # return

#########################################
#pintn: Print integer in $a0 followed by newline

pintn:  addi    $v0,    $0,     1       # specify Print Integer service
        syscall                         # print integer
        j   br

#########################################
#break: Print newline

br:     addi    $v0,    $0,     11      # specify Print Character service
        addi    $a0,    $0,     '\n'
        syscall                         # print integer
        jr      $ra                     # return

#########################################
#pcolon: Print a colon character

pcolon: addi    $v0,    $0,     11      # specify Print Character service
        addi    $a0,    $0,     ':'
        syscall
        jr      $ra                     # return

#########################################
#pstr: Print string pointed to by $a0

pstr:   addi    $v0,    $0,     4       # specify Print String service
        syscall                         # print heading
        jr   $ra                        # return

#########################################
#pchr: Print character in $a0

pchr:   addi    $v0,    $0,     11      # specify Print Character service
        syscall         
        jr   $ra                        # return

#########################################
#rint: Read integer from keyboard and put into $v0

rint:   li      $v0,    5               # specify Print Integer service
        syscall                         # read integer and place into $v0
        jr   $ra                        # return

#########################################
#rstr: Read string from keyboard
#   $a0 = base address of input buffer
#   $a1 = Max number of characters to read in

rstr:   addi    $v0,    $0,     8       # specify String Get service
        syscall             
        jr      $ra                     # return
