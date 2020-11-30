.data

X:      .word 1

.text

        addi    $s0,    $0,     8           #counter, how many numbers   
        la      $s3,    X                   #load address of X

#DO NOT REMOVE THIS COMMENT - Your code BELOW


	jal  power2	
	
power2:		beq	$s2,	$s0,	exit
 		addi 	$s4, 	$zero,	2	# t0 ----> 2
 		sll 	$s2,	$s4,	2
 		add 	$s5,	$s2,	$s3
 		lw	$t2,	0($s5)				# s2 ----> result
 		add 	$a0,	$zero, 	$s2
 		jal pintn
 		
 		j power2

#DO NOT REMOVE THIS COMMENT - Your code ABOVE

exit:   li      $v0,    10
        syscall

#########################################
#pintn: Print integer in $a0 followed by newline

pintn:  addi    $v0,    $0,     1       # specify Print Integer service
        syscall                         # print integer
        j       br

#########################################
#break: Print newline

br:     addi    $v0,    $0,     11      # specify Print Character service
        addi    $a0,    $0,     '\n'
        syscall                         # print integer
        jr      $ra                     # return
        
 ########################################
 #power2
 
 
 			
