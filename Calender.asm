.data
buffer: .space 1024

# file path may be different from device to another
fin: .asciiz "D:\\MIPS-ASSEMBLY\\calenderFile.txt"


#holds the file content 
file_content: .space 1024
newLine: .asciiz "\n"
dash: .asciiz "-"

open_file_error: .asciiz"Error! opening the file"

welcome_message: .asciiz "\n Welcome to our program!!\n"

view_per_day: .asciiz "\n a - View calender per day\n"
view_per_set_days: .asciiz "\n b - View calender per set of days\n"
view_given_slot: .asciiz "\n c - View a given slot of a given day\n"
view_lec_num: .asciiz "\n d - View lectures number\n"
view_OH_num: .asciiz "\n e - View office hours number\n"
view_meets_num: .asciiz "\n f - View meetings number\n"
view_avg_lec: .asciiz "\n g - View the average lectures per day\n"
view_ratio_lec_OH: .asciiz "\n h - View the ratio between total number of lectures and the total number of OH\n"
add_new_appointemnt_sen:  .asciiz "\n i - Add new appointemnt\n"
delete_appointemnt_sen:  .asciiz "\n j - Delete an appointemnt\n"
quit: .asciiz "\n q - quit the program\n"
quit_message: .asciiz "\n Thank you for using our program!!\n"

select:.asciiz " \n Please choose a, b, c, d, e, f, g, h, i, j, or q: " 
a: .asciiz "a\n"
b: .asciiz "b\n"
c: .asciiz "c\n"
d: .asciiz "d\n"
e: .asciiz "e\n"
f: .asciiz "f\n"
g: .asciiz "g\n"
h: .asciiz "h\n"
i: .asciiz "i\n"
j: .asciiz "j\n"
q: .asciiz "q\n"
yes: .asciiz "yes\n"
space: .asciiz " "
choice: .space 10

error: .asciiz "\n Invalid input, try again\n"
day_not_exist: .asciiz "\n Day not exist, try again\n"
select_day:.asciiz " \n Please choose a day: "  
select_day_sentence_1:.asciiz " \n The slots for day "
another_day_q: .asciiz "\n Enter yes to enter another day, or any character to returb to menu: "
another_day_answer : .space 10
day: .space 10

# to take the day input from the user
choiced_day_input: .space 10

# the taken day without new line (used for comparision)
choiced_day: .space 10
day_slot :  .space 100
line: .asciiz "\n ______________________________________________________________________ \n "
current_start_time: .space 10
current_end_time: .space 10
extracted_slot: .space 100
category: .space 5
slot_type: .space 5

# the taken day without new line (used for comparision)
given_day: .space 10
given_day_input: .space 10


enter_slot_1: .asciiz "\n Please enter the start time: "
enter_slot_2: .asciiz "\n Please enter the end time: "
given_slot: .space 20
first_num: .space 10
sec_num: .space 10
invalid_slot: .asciiz "\n The enterd slot is not valid, please try again!"

num_of_L: .space 10
num_of_OH: .space 10
num_of_M: .space 10
start_time: .space 10
end_time: .space 10

L: .asciiz "L"
OH: .asciiz "OH"
M: .asciiz "M"
print_L_sen: .asciiz "\n Number of Lectures in hours: "
print_OH_sen: .asciiz "\n Number of Office Hours in hours: "
print_M_sen: .asciiz "\n Number of Meetings in hours: "
div_by_zero: .asciiz "\n Error: Division by zero\n"
ratio_answer: .asciiz "\n The ratio: "
avg_answer: .asciiz "\n The average lectures per day: "
view_slots_to_delete_sen: .asciiz "\n The slots for this day are shown below, please choose one of these slots with it's type: \n"
enter_type: .asciiz "\n Please enter the slot type: "
flag:   .word 0
slot_after_delete: .space 100
temp_slot: .space 100

.text
.globl main

# TODO : check if invalid day in the file
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
	
	la $a0, line		
	li $a1, 256
	li $v0, 4
	syscall
	
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
	
	la $a0,add_new_appointemnt_sen		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, delete_appointemnt_sen	
	li $a1, 256
	li $v0, 4
	syscall
	
	
	la $a0, quit					
	li $a1, 256
	li $v0, 4
	syscall
	
	
selection:
	la $a0, select			
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, choice
	la $a3,choice
	
	li $v0, 8
	syscall
	
	# if the user choice to view per day
	la $a1,a		
	jal strcmp
	beq $v0,$zero, get_day
	
	
	# if the user choice to view per set of days
	la $a1,b		
	jal strcmp
	beq $v0,$zero, get_set_of_days
	
	# if the user choice to view given slot in a given day
	la $a1,c		
	jal strcmp
	beq $v0,$zero, get_given_slot_in_given_day
	
	# if the user choice to print number of lecs
	la $a1,d		
	jal strcmp
	beq $v0,$zero, count_num_of_hours
	
	#if the user choice e
	la $a1,e		
	jal strcmp
	beq $v0,$zero, count_num_of_hours
	
	# if the user choice f
	la $a1,f		
	jal strcmp
	beq $v0,$zero,count_num_of_hours 
	
	# if the user choice g
	la $a1,g		
	jal strcmp
	beq $v0,$zero, count_num_of_hours 
	
	# if the user choice h
	la $a1,h		
	jal strcmp
	beq $v0,$zero, count_num_of_hours 
	
	#la $a1,i		
	#jal strcmp
	#beq $v0,$zero, 
	
	
	# if th
	la $a1,j		
	jal strcmp
	beq $v0,$zero, delete_appointemnt 
	
	
	# if the user choice q
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
	
	la $a0, open_file_error
	li $a1, 256
	li $v0, 4
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


# TODO remember to clear  choiced_day register
delete_appointemnt:
 	# Set the flag to 0
    	li $t0,0          
    	sw $t0, flag     

	la $a0, select_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, given_day_input
	li $v0, 8
	syscall		
	
	
	la $t3, given_day_input
	la $t2, choiced_day
	jal remove_new_line
	
	# check if the choiced day exist  
	jal check_day
	
	beq $v0 ,$zero, ask_user_to_enter_slot

	la $a0, day_not_exist		
	li $v0, 4
	syscall
	
	# Ask the user to enter another day
	j delete_appointemnt
	
	ask_user_to_enter_slot:
	
	# To get this day slot
	j get_slot
		
	 back_to_get_deleted_slots:
		
	la $t5,day_slot 
			
	la $a0, view_slots_to_delete_sen		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, day_slot 		
	li $a1, 256
	li $v0, 4
	syscall
		
	la $a0, newLine		
	li $a1, 256
	li $v0, 4
	syscall
	
		
	# Ask the user to enter the start time	
	la $a0, enter_slot_1		
	li $a1, 256
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall	
	
	# Save it in $t0
	move $t0, $v0
	
	# Ask the user to enter the end time	
	la $a0, enter_slot_2		
	li $a1, 256
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall	
	
	# Save it $t1
	move $t1, $v0
	
	
	# Ask the user to enter the slot type type
	la $a0, enter_type		
	li $a1, 256
	li $v0, 4
	syscall
	
	
	la $a0, slot_type
	li $v0, 8
	syscall
	
	move $t3, $v0
	
	# copy the day slots 
	move $t7, $t5
	
	la $t6,slot_after_delete 
	
	check_if_slot_exist:
		lb $t4, ($t5)          
        	addi $t5, $t5, 1
        	beq $t4, $t0, check_end_time_match
        	beq $t4, '\n',end_delete_loop
        	sb $t4, 0($t6)        
        	addi $t6, $t6, 1   
        	j check_if_slot_exist  
        
        # checksss
        
	check_end_time_match:
		lb $t4, ($t5)          
        	addi $t5, $t5, 1
        	beq $t4, '-',check_end_time_match
        	beq $t4, ' ',check_end_time_match
        	beq $t4, $t1, check_category_match
        	# if the end time is not eqaul return to checking the whole slot  
		j check_if_slot_exist
	
	check_category_match:
	
	
	j check_category_match
		lb $t4, ($t5)          
        	addi $t5, $t5, 1
        	beq $t4, ' ',check_category_match
        	beq $t4, $t3, slot_to_delete
        	j remove_comma
    	
    	remove_comma:
    		lb $t4, ($t5)          
        	addi $t5, $t5, 1
        	beq $t4, ',',check_if_slot_exist
        	beq $t4, '\n',end_delete_loop
    		beqz $t4, end_delete_loop
        j remove_comma
        
        slot_to_delete:
        # set flg to one 
        li $t0,1         
    	sw $t0, flag 
        j check_if_slot_exist
        
	end_delete_loop:
	 # Check the flag
    	lw $t1, flag     
    	beq $t1, 1, print_with_delete   # Branch if equal to 1 (flag is set)
	
	move $a0, $t7	
	li $a1, 256
	li $v0, 4
	syscall
	
	j menu
	
	print_with_delete:
	la $a0, slot_after_delete 		
	li $a1, 256
	li $v0, 4
	syscall
	
	j menu


count_num_of_hours:
	li $t0, 0 #to srore lectures
	li $t1, 0 # to store meetings
	li $t2, 0 # to store OH
	
	la $t4,file_content
	
	 	
	get_start_time_from_file:
		lb $t6, ($t4)          
        	addi $t4, $t4, 1
        	beqz $t6, end_adding
        	beq $t6, '\r', get_start_time_from_file
        	beq $t6, '\n', get_start_time_from_file
		beq $t6, ':', store_start_time
		beq $t6, ' ', store_start_time
        	j get_start_time_from_file  
        	 
	store_start_time:
	la $t9, current_start_time
       
       start_time_loop:
       		lb $t6, ($t4)          
        	addi $t4, $t4, 1
        	beqz $t6, end_adding
        	beq $t6, '-', start_time_done
		beq $t6, ' ', start_time_loop
		sb $t6, 0($t9)        
        	addi $t9, $t9, 1   
       
      j start_time_loop
      
      
      start_time_done:
      	sb $zero, 0($t9)
      	
      	la $t5,current_end_time
      	
      	end_time_loop:
       		lb $t6, ($t4)          
        	addi $t4, $t4, 1
        	beqz $t6, end_adding
		beq $t6, ' ', end_time_done
		sb $t6, 0($t5)        
        	addi $t5, $t5, 1   
       
      j end_time_loop
      	
      	end_time_done:
      	sb $zero, 0($t5)
      	
      	la $t7,category
      	catagory_loop_10:
      		lb $t6, ($t4)          
        	addi $t4, $t4, 1
        	beqz $t6, catagory_loop_10_done
        	beq $t6, ',', catagory_loop_10_done
        	beq $t6, '\n', catagory_loop_10_done
        	beq $t6, '\r', catagory_loop_10_done
		beq $t6, ' ', catagory_loop_10
		sb $t6, 0($t7)        
        	addi $t7, $t7, 1
      	j catagory_loop_10
      	
      	catagory_loop_10_done:
      	sb $zero, 0($t7)
      	  	
      	
   	 la  $a0, current_start_time
   	 jal str_to_int  
   	 move $t9,$v0
   	 
   	 la  $a0, current_end_time
   	 jal str_to_int  	 
   	 move $t5,$v0
   	 
   	 ble $t9, 5, add_12_to_start_time
   	 ble $t5, 5, add_12_to_end_time
   	 
   	 
   	 add_results:
   	 
   	 sub $t5, $t5, $t9
   	 
   	 la $a0,category
   	 la $a1,L
   	 jal  strcmp
   	 beq $v0,$zero, add_lectures
   	 
   	 la $a0,category
   	 la $a1,OH
   	 jal  strcmp
   	 beq $v0,$zero, add_OH
   	 
   	 
   	 # add meetings
   	add $t1, $t1, $t5
   	 
   	 j get_start_time_from_file
   	 
   	 add_12_to_start_time:
   	 addi $t9, $t9, 12
   	 ble $t5, 5, add_12_to_end_time
         j add_results  	
         
         
        add_12_to_end_time:
   	 addi $t5, $t5, 12
         j add_results  	
           	
        add_lectures:
         add $t0, $t0, $t5
         j get_start_time_from_file
           	
         add_OH:  
         add $t2, $t2, $t5
         j get_start_time_from_file
           	
           
      	end_adding:
      	move $a0,$a3
      	
      	la $a1,d
	jal strcmp	
	beq $v0,$zero, print_L
	
	 	
      	la $a1,e
	jal strcmp	
	beq $v0,$zero, print_OH
	
      
      	la $a1,f
	jal strcmp	
	beq $v0,$zero, print_M
	
	la $a1,g
	jal strcmp	
	beq $v0,$zero, get_avg_lecs
	
	la $a1,h
	jal strcmp	
	beq $v0,$zero, print_ratio
      	j menu
	
	 print_L:
	 	la $a0, print_L_sen
 	    	li $a1, 256
		li $v0, 4
		syscall
		
		move $a0, $t0
		li $v0, 1
		syscall
		
		la $a0, newLine
		li $v0, 4
		syscall
		
	 
	 j menu
	
	print_OH:
		la $a0, print_OH_sen
 	    	li $a1, 256
		li $v0, 4
		syscall
		
		move $a0, $t2
		li $v0, 1
		syscall
		
		la $a0, newLine
		li $v0, 4
		syscall
	j menu
	print_M:
		la $a0, print_M_sen
 	    	li $a1, 256
		li $v0, 4
		syscall
		
		move $a0, $t1
		li $v0, 1
		syscall
		
		la $a0, newLine
		li $v0, 4
		syscall
		j menu
	print_ratio:
	# Check if the office hours is zero to avoid division by zero
	beq $t2, $zero, division_by_zero
	
	# Calculate the ratio: t0 / t2
	div $t0, $t2
	mflo $t6  # t6 now contains the quotient
	
	li $v0,4
	la $a0, ratio_answer
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	j menu
	
	
	
	get_avg_lecs:
	
	jal count_days
	
	move $t6,$v0
	# Calculate the averge: number of lecs / num of days
	div $t0, $t6
	mflo $t7  # answer
	
	
	li $v0,4
	la $a0, avg_answer
	syscall
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	j menu
	
	division_by_zero:
	  # Handle division by zero
    	li $v0, 4
    	la $a0, div_by_zero
    	syscall
    
    	j menu
    	
    	
count_days:
	li $t9 ,0 
	la $t4,file_content 	
	count_days_loop:
		lb $t6, ($t4)          
        	addi $t4, $t4, 1
        	beqz $t6, end_counting
		beq $t6, ':', increment
        	j count_days_loop 
        	 
	increment:
	add  $t9, $t9,1
	j count_days_loop
	
	end_counting:
	move $v0, $t9
	jr $ra
	
	
	
get_given_slot_in_given_day:
	
	la $a0, select_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, given_day_input
	li $v0, 8
	syscall		
	
	
	la $t3, given_day_input
	la $t2, choiced_day
	jal remove_new_line
	
	# check if the choiced day exist  
	jal check_day
	
	beq $v0 ,$zero, get_slot_in_day

	la $a0, day_not_exist		
	li $v0, 4
	syscall
	
	# Ask the user to enter another day
	j get_given_slot_in_given_day
	
	get_slot_in_day:
	
	# Ask the user to enter the start time	
	la $a0, enter_slot_1		
	li $a1, 256
	li $v0, 4
	syscall

	li $v0, 5
	syscall	
	
	# Save it in $t0
	move $t0, $v0
	
	# Ask the user to enter the end time	
	la $a0, enter_slot_2		
	li $a1, 256
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall	
	
	# Save it $t1
	move $t1, $v0

	 		
	# if num1 is less than or equal 5, we need to add 12 for comparsion 
	ble $t0, 5 , add_12_num1	
	ble $t1, 5 , add_12_num2
	
	j find_and_print_slot
			
	add_12_num1:
    	addi $t0, $t0, 12  # Add 12 to the loaded value
					
	ble $t1, 5 , add_12_num2								
	    
	j find_and_print_slot
	
	add_12_num2:
	addi $t1, $t1, 12
	
	j find_and_print_slot
	
	num_not_valid:
		la $a0, invalid_slot			
		li $a1, 256
		li $v0, 4
		syscall
		j menu
					
	
 	find_and_print_slot:
 		# If the start time is greater than the end  tinme -> invalid slot
 		bgt $t0 , $t1, num_not_valid 
 		
 		# To get this day slot
		j get_slot
		
		
		continue_process_slot:
		
		la $t5,day_slot 
		la $t2, current_start_time
		
		# TODO remove
		la $a0, day_slot 		
		li $a1, 256
		li $v0, 4
		syscall
		
		la $a0, newLine		
		li $a1, 256
		li $v0, 4
		syscall
		
   		loop_to_get_start_time:
        	lb $t6, ($t5)         
        	addi $t5, $t5, 1
        	beqz $t6, done_5   
        	beq $t6, '\n', done_5
        	beq $t6, '\r', done_5
        	beq $t6, '-', process_dash
		beq $t6, ' ', loop_to_get_start_time
        	sb $t6, 0($t2)        
        	addi $t2, $t2, 1       
        	j loop_to_get_start_time

    		process_dash:
    		sb $zero, 0($t2)
    		 
    		la  $a0, current_start_time
   	 	jal str_to_int
		move $t2, $v0
		ble $t2, 5, add_12_1
		j get_sec_number
		
		add_12_1:
		addi $t2, $t2, 12
		
		
		
		get_sec_number:
		  	 	
	 	la $t3, current_end_time
		
   	 	# get the second num
   	 	get_end_time:
            	lb $t6, ($t5)         
        	addi $t5, $t5, 1
        	beq $t6, ' ', get_category
        	beqz $t6, get_category
        	sb $t6, 0($t3)         
        	addi $t3, $t3, 1       
            	j  get_end_time
   	 	
   	 	get_category:
   	 	sb $zero, 0($t3)
   	 	
   	 	la  $a0, current_end_time
   	 	jal str_to_int  	 
   	 	move $t3,$v0
   	 	ble $t3, 5, add_12_3
		
		j get_category_
		
		add_12_3:
		addi $t3, $t3, 12
		
   	 	get_category_:
   	 	la $t4, category
   	 	get_category_loop :
   	 	lb $t6, ($t5)         
        	addi $t5, $t5, 1
        	beq $t6, '\n',check_the_slots
        	beqz $t6, check_the_slots
        	beq $t6, ',', check_the_slots
        	beq $t6, '\r', check_the_slots
        	sb $t6, 0($t4)         
        	addi $t4, $t4, 1       
        	
            	j    get_category_loop  
		
		check_the_slots:
   	 	sb $zero, 0($t4)	
   	 	
   	 	#branch if t0 is greater than or equal t2
   	 	bge $t0,$t2, check_second_slot
   	 	
   	 	bge $t1,$t2, take_t2_as_start_slot 
   	 	j skip
   	 	
   	 	take_t2_as_start_slot:
   	 	bge $t2,13, minus_12
   	 	
   	 	j print_start_time_0
   	 	
   	 	minus_12:
   	 	subi $t2,$t2,12
   	 	
   	 	print_start_time_0:
   	 	la $a0, space
   	 	li $v0,4
   	 	syscall
   	 	
   	 	move $a0, $t2
   	 	li $v0,1
   	 	syscall
   	 	
   	 	j check_end_time  
   	 	  
   	 	check_second_slot:
   	 	bgt $t0, $t3 , skip
   	 	
   	 	bge $t0,13, minus_12_1
   	 	j print_start_time_1
   	 	
   	 	
   	 	minus_12_1:
   	 	subi $t0,$t0,12
   	 	
   	 	print_start_time_1:
   	 	la $a0, space
   	 	li $v0,4
   	 	syscall
   	 	
   	 	move $a0, $t0
   	 	li $v0,1
   	 	syscall
   	 	
   	 	check_end_time:
   	 	ble $t1,$t3, t1_as_end_time
   	 	   	 	
   	 	j print_result
   	 	
   	 	t1_as_end_time: 	
   	 	move $t3,$t1
   	 	
   	 	print_result:
   	 	
   	 	bge $t3,13,minus_12_2
   	 	j print_res
   	 	
   	 	minus_12_2:
   	 	subi $t3,$t3,12
   	 	
   	 	print_res:
   	 	
   		la $a0, dash
   	 	li $v0,4
   	 	syscall
   	 	
   	 	move $a0, $t3
   	 	li $v0,1
   	 	syscall
   	 	
   	 	la $a0, space
   	 	li $v0,4
   	 	syscall
   	 	
   	 	la $a0, category
   	 	li $v0,4
   	 	syscall
   	 	
   	 	
		skip:
	 	#reset
	 	la $t2, current_start_time
	 	la $t3, current_end_time
	 	la $t4, category
	 		
    		j loop_to_get_start_time
    		
    		done_5:
    		 la $t2, current_start_time
	 	la $t3, current_end_time
	 	la $t4, category
	 		
		la $a1 , choiced_day
 		j menu
 
 

get_set_of_days:
	j get_day
	
	enter_another_day:
	la $a0, another_day_q			
	li $a1, 256
	li $v0, 4
	syscall
	
	
	
	# ask the user to enter another day if wanted
	la $a0, another_day_answer
	li $v0, 8
	syscall		

	la $a1,yes		
	jal strcmp
	beq $v0,$zero, get_set_of_days
		
	j menu
	

get_day:
	la $a0, select_day			
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, choiced_day_input
	li $v0, 8
	syscall
	
	la $t3, choiced_day_input
	la $t2, choiced_day
	jal remove_new_line
	
	jal check_day
	
	beq $v0 ,$zero, get_slot

	la $a0, day_not_exist		
	li $v0, 4
	syscall
	j menu
		
	get_slot:
		la $t4,file_content
		la $t7,day 
		la $t5,day_slot 	
   	loop_0:
        	lb $t6, ($t4)         
        	addi $t4, $t4, 1
        	beqz $t6, end_loop_0   
        	beq $t6, '\n', loop_0
        	beq $t6, ':', process_slot 

        	# Process the character as part of the day number
        	sb $t6, 0($t7)         # Store the character in day buffer
        	addi $t7, $t7, 1       # Move to the next position in day buffer
        	j loop_0

     process_slot:
        # Null-terminate the day buffer
        sb $zero, 0($t7)
       
	la $a1, choiced_day
	la $a0,day
	jal strcmp
	
	beq $v0,$zero, copy_slot
        
        # Reset the day buffer for the next line
        la $t7, day
        skip_line_0:
            lb $t6, ($t4)
            beqz $t6, loop_0    # Exit the loop if the null terminator is encountered
            beq $t6, '\n', loop_0  # Exit the loop when newline is encountered
            addi $t4, $t4, 1
            j    skip_line_0
            
         copy_slot:
            lb $t6, ($t4)
            beqz $t6, slot_found    
            beq $t6, '\n', slot_found    
            sb $t6 , 0($t5)
            addi $t4, $t4, 1
            addi $t5, $t5, 1
            j copy_slot
            
 	slot_found: 
 	    	 sb $zero, 0($t5)
 	    	# If the user choiced c, returh the slot and dont print it 
 	    	move $a0,$a3	
		la $a1,c
		jal strcmp		
		beq $v0,$zero, continue_process_slot
		
		move $a0,$a3
		la $a1, j
		jal strcmp
		beq $v0,$zero, back_to_get_deleted_slots
		
 	    	la $a0, select_day_sentence_1
 	    	li $a1, 256
		li $v0, 4
		syscall
		
		la $a0,choiced_day
		li $a1, 256
		li $v0, 4
		syscall
		la $a0,newLine
		li $v0, 4
		syscall
		
 	    	la $a0, day_slot
 	    	li $a1, 256
		li $v0, 4
		syscall
		la $a0,newLine
		li $v0, 4
		syscall
		
		#la $t5, day_slot
		move $a0,$a3	
		la $a1,a
		jal strcmp
		beq $v0,$zero, end_loop_0
	
		j enter_another_day
		
    	end_loop_0:
    	
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
		li $v0, 1  
				
	exit_find_day:
		move  $ra, $s0	
		la $a1, choiced_day
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
		bnez $s6, notequal 
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
	
str_to_int:
    li $v0, 0            # Initialize result to 0
    #li $t4, 10           # Set divisor to 10 for decimal digits

    loop_3:
        lb $t3, 0($a0)    # Load the current character from the string
        beq $t3, $zero, done_3  # If the character is null (end of string), exit the loop

        sub $t3, $t3, '0'  # Convert ASCII character to numerical value
        mul $v0, $v0, 10  # Multiply the current result by the divisor
        add $v0, $v0, $t3  # Add the numerical value of the current digit
        addi $a0, $a0, 1   # Move to the next character in the string
        j loop_3          # Repeat the loop

    done_3:
        jr $ra             # Return with the result in $v0

    
exit:
	la $a0, quit_message
	li $a1, 256
	li $v0, 4
	syscall

	li $v0, 10
	syscall	

