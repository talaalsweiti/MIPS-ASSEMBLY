.data
buffer: .space 1024

# file path may be different from device to another
fin: .asciiz "D:\MIPS-ASSEMBLY/calenderFile.txt"

#holds the file content 
file_content: .space 1024 
newLine: .asciiz "\n"

open_file_error: .asciiz"Error! opening the file"

welcome_message: .asciiz "Welcome to our program!!\n"

view_per_day: .asciiz "\n a - View calender per day\n"
view_per_set_days: .asciiz "\n b - View calender per set of days\n"
view_given_slot: .asciiz "\n c - View a given slot of a given day\n"
view_lec_num: .asciiz "\n d - View lectures number\n"
view_OH_num: .asciiz "\n e - View office hours number\n"
view_meets_num: .asciiz "\n f - View meetings number\n"
view_avg_lec: .asciiz "\n g - View the average lectures per day\n"
view_ratio_lec_OH: .asciiz "\n h - View the ratio between total number of lectures and the total number of OH\n"
quit: .asciiz "\n q - quit the program\n"
quit_message: .asciiz "Thank you for using our program!!\n"

select:.asciiz " \n Please choose a, b, c, d, e, f, g, h, or q: " 
a: .asciiz "a\n"
b: .asciiz "b\n"
c: .asciiz "c\n"
d: .asciiz "d\n"
e: .asciiz "e\n"
f: .asciiz "f\n"
g: .asciiz "g\n"
h: .asciiz "h\n"
q: .asciiz "q\n"


choice: .space 10

error: .asciiz "invalid input, try again\n"
day_not_exist: .asciiz "Day not exist, try again\n"
select_day:.asciiz " \n Please choose a day: "  
day: .space 10

# to take the day input from the user
choiced_day_input: .space 10

# the taken day without new line (used for comparision)
choiced_day: .space 10


.text
.globl main

main: 	
	#la $a0, welcome_message	
	#li $a1, 256
	#li $v0, 4
	#syscall
	j START
START: 
	jal read_file 
	j menu
	
menu:
	#printing the menue 
	la $a0, view_per_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_per_set_days		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_given_slot		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_lec_num		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_OH_num		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_meets_num		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, view_avg_lec		
	li $a1, 256
	li $v0, 4
	syscall


	la $a0, view_ratio_lec_OH		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, quit					
	li $a1, 256
	li $v0, 4
	syscall
	
	
selection:
	#load the addrees of the string select(which define in .data section) to a0	
	la $a0, select			
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, choice
	li $v0, 8
	syscall
	
	# if the user chice a
	la $a1,a		
	jal strcmp
	beq $v0,$zero, get_day
	
	
	# if the user chice b
	#la $a1,b		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice c
	#la $a1,c		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice d
	#la $a1,d		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice e
	#la $a1,e		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice f
	#la $a1,f		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice g
	#la $a1,g		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice h
	#la $a1,h		
	#jal strcmp
	#beq $v0,$zero, 
	
	# if the user chice q
	la $a1,q		
	jal strcmp
	beq $v0,$zero, exit
	
	#if the code reach here then the choice is not valid
	la $a0, error		
	li $a1, 256
	li $v0, 4
	syscall
	
	j selection
	
read_file:
	la   $a0, fin
	move $t2,$a1
	#open a file for writing
	li   $v0, 13       # system call for open file
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	
	
	# Check if the file was opened successfully
	bnez $v0, readFile
	
	# Todo : not working
	li $v0, 4
	la $a0, open_file_error
	syscall
	
	li $v0,4
	la $a0, newLine
	syscall
	jr $ra 
	
	readFile:
		move $t0, $v0      # save the file descriptor 
		#read from file
		li   $v0, 14       # system call for read from file
		move $a0, $t0      # file descriptor 
		la   $a1, file_content  
		la   $a2, buffer   # address of buffer to which to read
		syscall            # read from file
		j closeFile
		
	closeFile:
		# Close the file 
		li   $v0, 16       # system call for close file
		move $a0, $t0      # file descriptor to close
		syscall            # close file
		jr $ra 


get_day:
	la $a0, select_day			
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, choiced_day_input
	li $v0, 8
	syscall
	
	la $t3, choiced_day_input
	la $t2, choiced_day
	
	jal remove_new_line
	
	jal check_day
	
	beq $v0 ,$zero, print_slot

		
	la $a0, day_not_exist		
	li $v0, 4
	syscall
	j get_day

		
	print_slot:
		la $a0,welcome_message
		li $v0, 4
		syscall
		j menu

check_day:
	move  $s0, $ra  
	la $t4,file_content
	la $t7,day 	
   loop:
        lb $t6, ($t4)         # Load the byte at the current address in $t4
        addi $t4, $t4, 1
        beqz $t6, end_loop    # Exit the loop if the null terminator is encountered
        beq $t6, '\n', end_line  # If newline is encountered, go to end_line
        beq $t6, ':', process_colon  # If colon is encountered, process the day number

        # Process the character as part of the day number
        sb $t6, 0($t7)         # Store the character in day buffer
        addi $t7, $t7, 1       # Move to the next position in day buffer
        j loop

    process_colon:
        # Null-terminate the day buffer
         sb $zero, 0($t7)
	
	
	la $a1, choiced_day
	la $a0,day
	
	jal strcmp

	
	# day is found
	beq $v0,$zero, day_found
        
        # Reset the day buffer for the next line
        la $t7, day

         skip_line:
            lb $t6, ($t4)
            beqz $t6, loop    # Exit the loop if the null terminator is encountered
            beq $t6, '\n', loop  # Exit the loop when newline is encountered
            addi $t4, $t4, 1
            j skip_line
            
 	day_found: 
 	    	li $v0, 0        	
		j exit_find_day
        
    	end_line:
        	# Continue to the next line
        	j loop

    	end_loop:
    		la $a0, day_not_exist		
		li $v0, 4
		syscall
		li $v0, 5  
				
	exit_find_day:
		move  $ra, $s0	
		jr $ra
	



strcmp:  		
	loop1:
		# Load byte from string1
 		lb $s5, ($a0)   
 		# Load byte from string2  	
		lb $s6, ($a1)    
		#If end of string1, strings are equal 	
		beqz $s5, equal   
		# If end of string2, strings are not equal	
		beqz $s6, notequal 
		# If bytes are not equal, strings are not equal
		bne $s5, $s6, notequal 
		# Increment string1 pointer
		addi $a0, $a0, 1 
		# Increment string2 pointer	
		addi $a1, $a1, 1 	
		# Jump to loop1
		j loop1           	
	equal:
		# Set return value to 1
		li $v0, 0  
		#Jump to done      	
		j done
		
		           	           	
	notequal:
		# Set return value to 0
		li $v0, 1  
		      	
	done:
		# Exit function
		jr $ra
	

remove_new_line:
	
	loop_new_line:
        lb $t6, ($t3)         
        addi $t3, $t3, 1
        beqz $t6, continue 
        beq $t6, '\n', continue  
	sb $t6, 0($t2)         
	addi $t2, $t2, 1       
	j loop_new_line
continue:
	sb $zero, 0($t2)
	jr $ra


exit:
	la $a0, quit_message
	li $v0, 4
	syscall

	li $v0, 10
	syscall	
