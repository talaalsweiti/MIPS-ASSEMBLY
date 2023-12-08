.data
buffer: .space 1024

new_buffer: .space 1024
# file paths may be different from device to another
fin: .asciiz "D:\\MIPS-ASSEMBLY\\calenderFile.txt"


asciidigi : .space 255
appointmentString : .space 1024
conflict: .space 4  



dayFound: .asciiz"\nDay Found"
not_found: .asciiz"\nnot_found"
no_conflict_sen : .asciiz"\nno conflict"
view_slots_to_add_sen : .asciiz"\nSlots to add: "

#holds the file content 
file_content: .space 1024
newLine: .asciiz "\n"
dash: .asciiz "-"

open_file_error: .asciiz"\nError! opening the file"

welcome_message: .asciiz "\nWelcome to our program\n"

view_per_day: .asciiz "\na - View calender per day\n"
view_per_set_days: .asciiz "\nb - View calender per set of days\n"
view_given_slot: .asciiz "\nc - View a given slot of a given day\n"
view_lec_num: .asciiz "\nd - View lectures number\n"
view_OH_num: .asciiz "\ne - View office hours number\n"
view_meets_num: .asciiz "\nf - View meetings number\n"
view_avg_lec: .asciiz "\ng - View the average lectures per day\n"
view_ratio_lec_OH: .asciiz "\nh - View the ratio between total number of lectures and the total number of OH\n"
add_new_appointemnt_sen:  .asciiz "\ni - Add new appointemnt\n"
delete_appointemnt_sen:  .asciiz "\nj - Delete an appointemnt\n"
quit: .asciiz "\nq - Quit the program\n"
quit_message: .asciiz "\nThank you for using our program!!\n"

select:.asciiz " \nPlease choose a, b, c, d, e, f, g, h, i, j, or q: " 
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

error: .asciiz "\nInvalid input, try again\n"
day_not_exist: .asciiz "\nDay not exist, try again\n"
select_day:.asciiz "\nPlease choose a day: "  
select_day_sentence_1:.asciiz "\nThe slots for day "
another_day_q: .asciiz "\nEnter yes to enter another day, or any character to return to menu: "
another_day_answer : .space 50
day: .space 10

# to take the day input from the user
choiced_day_input: .space 10

# To store the day without null terminator (used for comparison)
choiced_day: .space 10
day_slot :  .space 100
line: .asciiz "\n______________________________________________________________________ \n "
current_start_time: .space 10
current_end_time: .space 10
extracted_slot: .space 10
category: .space 10
slot_type: .space 10


enter_slot_1: .asciiz "\nPlease enter the start time: "
enter_slot_2: .asciiz "\nPlease enter the end time: "
given_slot: .space 100
first_num: .space 10
sec_num: .space 10
invalid_slot: .asciiz "\nThe enterd slot is not valid, please try again!"

num_of_L: .space 50
num_of_OH: .space 50
num_of_M: .space 50
start_time: .space 50
end_time: .space 50

L: .asciiz "L"
OH: .asciiz "OH"
M: .asciiz "M"
print_L_sen: .asciiz "\nNumber of Lectures in hours: "
print_OH_sen: .asciiz "\nNumber of Office Hours in hours: "
print_M_sen: .asciiz "\nNumber of Meetings in hours: "
div_by_zero: .asciiz "\nError: Division by zero\n"
ratio_answer: .asciiz "\nThe ratio: "
avg_answer: .asciiz "\nThe average lectures per day: "
view_slots_to_modify_sen: .asciiz "\nThe slots for this day are shown below, please choose one of these slots with it's type: \n"
enter_type: .asciiz "\nPlease enter the slot type: "
slot_after_delete: .space 100

start_time_to_modify: .space 10
end_time_to_modify: .space 10
temp: .space 10
temp_2: .space 10
temp_3: .space 10
temp_start: .space 10
temp_end: .space 10
temp_category: .space 10
temp_category_add:.space 10
category_add_:.space 10

conflict_occured: .asciiz "\nConflict occured, please enter another slot"
Inavlid_end_sen : .asciiz "\nThe slot must be between 8 am and 5 pm"
no_conflict_in_all_slots: .asciiz "\nNo conflict in all slots"
day_not_Found: .asciiz "\nDay not found"


.text
.globl main

main: 	
	la $a0, welcome_message	
	li $a1, 256
	li $v0, 4
	syscall
	
	j START
START: 
	jal read_file 
	j menu
	
menu:
	# Print the menu to the user to view available features
	
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
	
# Get the user selction	
selection:
	la $a0, select			
	li $a1, 256
	li $v0, 4
	syscall
	
	# Get the choice from the user
	la $a0, choice
	# Store the choice in $a3 for later comparison
	la $a3,choice
	la $a1, 10
	li $v0, 8
	syscall
	
	# If the user chooce to view calender per day
	la $a1,a		
	jal strcmp
	beq $v0,$zero, get_day
	
	
	# If the user chooce to view calendar per set of days
	la $a1,b		
	jal strcmp
	beq $v0,$zero, get_set_of_days
	
	# If the user chooce to view a given slot in a given day
	la $a1,c		
	jal strcmp
	beq $v0,$zero, get_given_slot_in_given_day
	
	# If the user chooce to print number of lectures in hours
	la $a1,d		
	jal strcmp
	beq $v0,$zero, count_num_of_hours
	
	# If the user chooce to print number of office hours
	la $a1,e		
	jal strcmp
	beq $v0,$zero, count_num_of_hours
	
	# If the user chooce to print number of meetings in hours
	la $a1,f		
	jal strcmp
	beq $v0,$zero,count_num_of_hours 
	
	# If the user chooce to print the average lectures per day
	la $a1,g		
	jal strcmp
	beq $v0,$zero, count_num_of_hours 
	
	# If the user chooce to print the ratio between lectures numbers and office hours
	la $a1,h		
	jal strcmp
	beq $v0,$zero, count_num_of_hours 
	
	# If the user chooce to add appointemnt
	la $a1,i		
	jal strcmp
	beq $v0,$zero, add_appointemnt
	
	
	# If the user chooce to delete appointemnt
	la $a1,j		
	jal strcmp
	beq $v0,$zero, delete_appointemnt 
	
	
	# If the user chooce to quit the program
	la $a1,q		
	jal strcmp
	beq $v0,$zero, exit
	
	# If the code reach here then the choice is not valid
	la $a0, error		
	li $a1, 256
	li $v0, 4
	syscall
	
	j selection

# Read the input file 	
read_file:
	# Load the file path
	la   $a0, fin
	
	# Open a file for reading
	li   $v0, 13       # system call for open file
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	
	
	# Check if the file was opened successfully
	bnez $v0, readFile
	
	la $a0, open_file_error
	li $a1, 256
	li $v0, 4
	syscall
	
	li $v0,4
	la $a0, newLine
	syscall
	jr $ra 
	
	readFile:
		move $t0, $v0      # Save the file descriptor 
		# Read from file
		li   $v0, 14       # system call for read from file
		move $a0, $t0      # File descriptor 
		la   $a1, file_content  # Store file content
		la   $a2, buffer   # address of buffer to which to read
		syscall            # read from file
		j closeFile
		
	closeFile:
		# Close the file 
		li   $v0, 16       # system call for close file
		move $a0, $t0      # file descriptor to close
		syscall            # close file
		jr $ra 

add_appointemnt:
	la $a0, select_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, choiced_day_input
	la $a1, 10
	li $v0, 8
	syscall		
	
	
	la $a0, choiced_day_input
	la $v0, choiced_day
	jal remove_new_line
	la $t2, choiced_day
	
	# check if the choiced day exist  
	jal check_day
	
	beq $v0 ,$zero, ask_user_to_enter_slot_add

	la $a0, day_not_exist		
	li $v0, 4
	syscall
	
	
	# Ask the user to enter another day
	j add_appointemnt
	
	ask_user_to_enter_slot_add:
	
	 la  $a0, choiced_day
        jal str_to_int
       	 move $s3, $v0
		 
	move $a0, $s3
        li $v0,1
        syscall

	
	# To get this day slot
	j get_slot
		
	 back_to_add_slot:
		
	la $t5,day_slot 
			
	la $a0, view_slots_to_modify_sen		
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
      
         ble $t0, 5, add_12_user_start
         j continue_slot_2  
         
         
         
        add_12_user_start:
        addi $t0, $t0, 12
      
        j continue_slot_2


        continue_slot_2:
        # Ask the user to enter the end time
        la $a0, enter_slot_2
        li $a1, 256
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        # Save it $t1
        move $t1, $v0
      
        ble $t1, 5, add_12_user_end
        j continue_type
        
        
        add_12_user_end:
        addi $t1, $t1, 12
       
        j continue_type


        Invalid_data:
        la $a0, Inavlid_end_sen
        li $a1, 256
        li $v0, 4
        syscall
        j add_appointemnt
        
        
         continue_type:
        # Ask the user to enter the slot type type
        la $a0, enter_type
        li $a1, 256
        li $v0, 4
        syscall
  
        #read user's input and save in $s4
      	la $a0,temp_category_add
	la $a1, 10
	li $v0, 8
	syscall	
	
      	la $a0,temp_category_add
	la $v0, category_add_
	jal remove_new_line
	la $s4, category_add_
	
  	
############################
	
        la $t5,day_slot
        la $t7, current_start_time

        loop_to_get_current_start_time:
        lb $t6, ($t5)
        addi $t5, $t5, 1
        beqz $t6, done_add
        beq $t6, '\n', done_add
        beq $t6, '\r', done_add
        beq $t6, '-', save_current_start_time
        beq $t6, ' ', loop_to_get_current_start_time
        sb $t6, 0($t7)
        addi $t7, $t7, 1
        j loop_to_get_current_start_time

        save_current_start_time:
        sb $zero, 0($t7)

        la  $a0, current_start_time
        jal str_to_int
        move $t7, $v0

        ble $t7, 5, add_12_current_start

        j    get_current_sec_number
#############################
        add_12_current_start:
        addi $t7, $t7, 12
#############################
        get_current_sec_number:
       
        la $t8, current_end_time


        get_cuurent_end_time:
        lb $t6, ($t5)
        addi $t5, $t5, 1
        beq $t6, ' ', save_end_time 
        beqz $t6, save_end_time
        sb $t6, 0($t8)
        addi $t8, $t8, 1
        j  get_cuurent_end_time

        save_end_time:
        sb $zero, 0($t8)
        la  $a0, current_end_time
        jal str_to_int
        move $t8,$v0
        ble $t8, 5, add_12_current_end
       j reach_category
        ####################################
        add_12_current_end:
        addi $t8, $t8, 12
        #####################################
         reach_category:

        save_category:
        lb $t6, ($t5)
        addi $t5, $t5, 1
        beq $t6, '\n',check_the_slots
        beqz $t6, check_the_conflict
        beq $t6, ',', check_the_conflict
        beq $t6, '\r', check_the_conflict

        j  reach_category
        ##########################################
         check_the_conflict:


        bgt $t1, $t7, check_overlap
        j skip_the_current_slot

        check_overlap:
        blt $t0, $t8, conflict_occurred
        j skip_the_current_slot
############################################
        conflict_occurred:

        la $a0, conflict_occured
        li $a1, 256
        li $v0, 4
        syscall

       j add_appointemnt
############################################
 
        skip_the_current_slot:
        #reset
        la $t7, current_start_time
        la $t8, current_end_time


        j loop_to_get_current_start_time
  ############################################################
        done_add:
        la $t7, current_start_time
        la $t8, current_end_time
	
	bge $t0,13, minus_12_for_start
	bge $t1,13, minus_12_for_end
	
	j continue_to_add
	
	minus_12_for_start:
	subi $t0,$t0,12
	
	bge $t1,13, minus_12_for_end
	j continue_to_add
	
	minus_12_for_end:
	subi $t1,$t1,12
	
	
	continue_to_add:
        la $a1 , choiced_day

        
          la $s7, appointmentString
          jal Store_comma
          jal store_space

          move $s1, $t0
          bgt $s1,10, two_digits
          
          
          addi $t0, $s1, 48 
          sb $t0, 0( $s7)       
        addi  $s7,  $s7, 1 
        
        j continue_to_store_dash
          two_digits:
          jal convertTo_Ascii
          
          continue_to_store_dash:
          jal store_dash

          move $s1, $t1
           bgt $s1,10, two_digits_
          
          
          addi $t0, $s1, 48 
          sb $t0, 0( $s7)       
        addi  $s7,  $s7, 1 
        
        j continue_to_store_dash_
        
          
          
          two_digits_:
          jal convertTo_Ascii
          
          continue_to_store_dash_:
          jal store_space
          jal store_type
          j append
  ############################################################
  
  	              
 	convertTo_Ascii:
        # Convert tens digit to ASCII
        li $t4, 10              # Divisor for tens digit
        div $s1, $t4            # Divide start time (t0) by 10
        mflo $a0                # Quotient is the tens digit
        addi $a0, $a0, 48	# Convert to ASCII
        beqz $a0, ones		# if tens is zero, num is one digit
        sb $a0, 0( $s7)          # Store in buffer
        addi  $s7,  $s7, 1        # Move to the next position in the buffer

        ones:
        # Convert units digit to ASCII and print
        mfhi $a0                # Remainder is the units digit
        addi $a0, $a0, 48       # Convert to ASCII
        sb $a0, 0($s7)
        addi $s7, $s7, 1
        
        
        
       
        jr $ra
        
        store_dash:
        li $a0, 45    		# 45 is ascii of -
        sb $a0, 0($s7)
        addi $s7, $s7, 1
        jr $ra

        store_space:
        li $a0, 32   		# 32 is ascii is space
        sb $a0, 0($s7)
        addi $s7, $s7, 1
        jr $ra

        Store_comma:
        li $a0, 44   		# 44 is ascii is space
        sb $a0, 0($s7)
        addi $s7, $s7, 1
        jr $ra


        
        store_type:
        store_type_loop:
        lb $t9, ($s4)
        addi $s4,$s4,1
        beq $t9,'\n',done_tore_type
        beqz $t9,done_tore_type 
        sb $t9 , 0($s7)
       	addi $s7, $s7, 1
        j store_type_loop
        
        done_tore_type:
        
        jr $ra
#################################################

append:	
	# Initialize variables
	li $s2, 0          # $s2 is the index of the buffer
        li $t3, 0      # $t3 will hold the day number
        li $s5,0
	la $a3, new_buffer  # This buffer will hold a copy from the calendar (file_content) with the added appointment\

 	
##########################################################        
# Search for the day in the buffer
search_loop:
	lb $t7, file_content($s2)  # Load a byte from the buffer, t7 will hold a char from the buffer
	sb $t7, 0($a3) #store that byte in the new buffer
        addi $a3, $a3, 1 # move to the next position in the new buffer to hold the next char

        beqz $t7, done_adding_  # the day is there because we call check_day earlier
        beq $t7, '\n', go_to_the_next_line    # If end of line, reset s3 so it can hold the next day number
        beq $t7, ':', extract_day  # after find  the day , go back here to chenge it to int # s2 will be after :
        sub $t7, $t7, 48      # convert ASCII to integer
        mul $t3, $t3, 10      # shift previous digits left
        add $t3, $t3, $t7    # add current digit
        addi $s2, $s2, 1      # move to the next character in the buffer

	j search_loop
#########################################################
extract_day:
 	
   	
	addi $s2, $s2, 1          #move index to the char after :
	bne $s3, $t3, search_loop  #if it's not the day we're looking for, go back to the loop
	
	
        j store_targetDay
        
#######################################################################

 go_to_the_next_line :
	li $t3, 0       # reset $t3 that will hold the day number
	addi $s2, $s2, 1   # Move to next line, # $s2 is the index of the buffer
        j search_loop
#######################################################################
 store_targetDay:
# $s2 is the index of the buffer
# Continue storing the rest of the line, when reached the end of the line, append the new appointment
        lb $t7, file_content($s2)
        beq $t7,'\n', load_address 
        beq $t7,'\r', load_address
        sb $t7, 0($a3)
        addi $a3, $a3, 1
        addi $s2, $s2, 1  # $s2 is the index of the buffer
        j store_targetDay

#######################################################################
comma_store:
	
	sb $t7, 0($a3)
        addi $a3, $a3, 1
        addi $s2, $s2, 1 
	li $s5 ,0 # for new value
j store_targetDay


######################################################################
slash_store:
	bnez $s0, go_back
	#if equal zero 
	beq $s5, $s6, beginning
	# if s0 = 0 , but it is not the charcter we want 
	j go_back
	
       go_back:
       
	
	
	sb $t7, 0($a3)
        addi $a3, $a3, 1
        addi $s2, $s2, 1 
	li $s5 ,0 # for new value
	j store_targetDay

        beginning:
	subi $s2, $s2, 2
       j load_address
#######################################################
isInteger:
    # Load the character from $t0 into $a0
    lb $a0, ($t0)

    # Check if the character is between '0' and '9' in ASCII
    li $t1, '0'
    blt $a0, $t1, notInteger
    li $t1, '9'
    bgt $a0, $t1, notInteger

    # Character is an integer
    li $v0, 1            # Set result to 1 (true)
    jr $ra               # Return from the function

notInteger:
    # Character is not an integer
    li $v0, 0            # Set result to 0 (false)
    jr $ra               # Return from the function
#######################################################################
load_address:
# Load the address of the second string into $a1
	la $a1, appointmentString
	j copy_str2
###################################################################
copy_str2:
lb $t8, 0($a1)   # Load a byte from the second string
        beqz $t8, end_copy_str2  # If the byte is zero, we reached the end of the second string
	sb $t8, 0($a3)   # Store the byte at the end of the new buffer, which contains the chat before new line
        addi $a3, $a3, 1  # Move to the next byte in the first string
        addi $a1, $a1, 1  # Move to the next byte in the second string
        j copy_str2
################################################################
end_copy_str2:
# Continue copying the rest of the lines
	lb $t7, file_content($s2) #at first t7 is at the new line character
	sb $t7, 0($a3) #load that new line charcter in the new buffer and continue copying
        addi $a3, $a3, 1
	addi $s2, $s2, 1
	beq $t7, 0, done_copying
        j end_copy_str2
#############################################################
done_adding_:
jal read_file 
j menu

############################################################
done_copying:
	# Print the new calendar
	li $v0, 4
	la $a0, new_buffer
	syscall


        li $v0, 4
	la $a0, newLine
	syscall

        j write_file
###############################################################
write_file:
	li $v0, 13     #sysCall for openFile is 13
        la $a0, fin
        li $a1, 1      # flag for write is 1
        syscall
        move $s0, $v0  #save file descriptor in $s0

        bnez $s0, write_file_content
	li $s0, 4
	la $a0, open_file_error
	syscall
##############################################################

 write_file_content:
	        li $v0, 15         #sysCall for writeFile is 15
            	move $a0, $s0
            	la $a1, new_buffer   #address of input buffer that will be written
           	li $a2, 1024     # length of string to be written
            	syscall

		#close the file
		li $v0, 16
		move $a0, $s0
		syscall
		
		
		
 		j done_adding_
       
   ###############################################################    

delete_appointemnt:
 	la $a0, select_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	# get the choice from the user
	la $a0, choiced_day_input
	la $a1, 10
	li $v0, 8
	syscall		
	
	
	la $a0, choiced_day_input
	la $v0, choiced_day
	jal remove_new_line
	la $t2, choiced_day
	
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
			
	la $a0, view_slots_to_modify_sen		
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
	
	la $a0,temp
	la $a1, 10
	li $v0, 8
	syscall	
	

	la $a0,temp
	la $v0, start_time_to_modify
	jal remove_new_line
	la $t0, start_time_to_modify
	
	# Ask the user to enter the end time	
	la $a0, enter_slot_2		
	li $a1, 256
	li $v0, 4
	syscall
	
	la $a0, temp_2
	la $a1, 10
	li $v0, 8
	syscall	
	
	
	la $a0, temp_2
	la $v0,end_time_to_modify
	jal remove_new_line
	la $t1, end_time_to_modify
	
	# Ask the user to enter the slot type type
	la $a0, enter_type		
	li $a1, 256
	li $v0, 4
	syscall
	
	
	la $a0,temp_3
	la $a1, 10
	li $v0, 8
	syscall
	

	la $a0,temp_3
	la $v0,slot_type
	jal remove_new_line
	la $t3,slot_type
	

	la $t6,slot_after_delete 
	
	la $t7, temp_start
	
	move $s1,$t5
	move $s2,$t5
	
	get_start_time_to_comapre:
		lb $t4, ($t5)       
        	addi $t5, $t5, 1
        	beqz $t4, end_delete_loop
        	beq $t4, '-', start_time_found_
        	beq $t4, ' ', get_start_time_to_comapre
        	sb $t4, 0($t7)
        	addi $t7, $t7, 1  
        	j get_start_time_to_comapre 
 
	start_time_found_:
		sb $zero, 0($t7)
		la $t7, temp_start
	
		
		move $a1,$t0
		move $a0,$t7
		jal strcmp 
		
		
		
		move $s4,$t7
		
		beq $v0,$zero, go_check_end_time
		
		
		save_this_slot_start_time:
		lb $t4, ($s4)
		addi $s4, $s4, 1
		beqz $t4, end_saving_start_time
        	beq $t4, '\r', end_saving_start_time
        	beq $t4, '\n', end_saving_start_time
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1         	
        	j save_this_slot_start_time
        	
		end_saving_start_time:
		 li  $s3, '-'  
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
        	
        	save_the_rest_of_slot:
        	lb $t4, ($t5)
		addi $t5, $t5, 1
		beqz $t4,end_delete_loop
        	beq $t4, '\n', end_delete_loop
        	beq $t4, '\r', end_delete_loop
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1   
        	beq $t4, ',', add_space
		j save_the_rest_of_slot
		
		add_space:
		 li  $s3, ' '  
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
        	
		j get_start_time_to_comapre
	go_check_end_time:
	la $t8, temp_end
	
	get_end_time_:
	 	lb $t4, ($t5)         
        	addi $t5, $t5, 1
        	beq $t4, ' ', end_time_found
        	beqz $t4,  end_time_found
        	sb $t4, 0($t8)         
        	addi $t8, $t8, 1
        	j get_end_time_
		
	
	 end_time_found:
	 	sb $zero, 0($t8)
	 	la $t8, temp_end
	 	
		move $a1,$t8
		move $a0,$t1
		jal strcmp 
		
		
		move $s0,$t8
		
		
		beq $v0,$zero, go_check_categ
		
		
		
		save_start:
		lb $t4, ($s4)
		addi $s4, $s4, 1
		beqz $t4, save_dash_1
        	beq $t4, '\r',  save_dash_1
        	beq $t4, '\n', save_dash_1
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1  
		j save_start
		
		save_dash_1:
		 li  $s3, '-'  
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
        	
		save_end:
		lb $t4, ($s0)
		addi $s0, $s0, 1
		beqz $t4, end_saving_end_time
        	beq $t4, '\r',  end_saving_end_time
        	beq $t4, '\n', end_saving_end_time
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1         	
        	j save_end
        	
		 end_saving_end_time:
		 li   $s3, ' ' 
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
		j save_the_rest_of_slot
		
		
	
	go_check_categ:
		la $t9, temp_category
		
	check_categ_loop:
		lb $t4, ($t5)  
		#lb $s1,($t5)       
        	addi $t5, $t5, 1
        	beq $t4, '\n',check_the_slots_to_delete
        	beqz $t4, check_the_slots_to_delete
        	beq $t4, ',', check_the_slots_to_delete
        	beq $t4, '\r', check_the_slots_to_delete
        	
        	sb $t4, 0($t9)         
        	addi $t9, $t9, 1    	
	j check_categ_loop
	
	check_the_slots_to_delete:
		sb $zero, 0($t9)
		la $t9, temp_category	
		
		move $a1,$t9
		move $a0,$t3
		jal strcmp 
		
		move $s6,$t9
		beq $v0,$zero, get_start_time_to_comapre
		
		
		save_start_2:
		lb $t4, ($s4)
		addi $s4, $s4, 1
		beqz $t4, save_dash_2
        	beq $t4, '\r',  save_dash_2
        	beq $t4, '\n', save_dash_2
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1  
		j save_start_2
		
		save_dash_2:
		 li  $s3, '-'  
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
        	
		save_end_2:
		lb $t4, ($s0)
		addi $s0, $s0, 1
		beqz $t4, end_saving_end_time_2
        	beq $t4, '\r',  end_saving_end_time_2
        	beq $t4, '\n', end_saving_end_time_2
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1         	
        	j save_end_2
        	
		 end_saving_end_time_2:
		 li  $s3, ' ' 
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
        	
		save_this_slot_category:
		lb $t4, ($s6)
		addi $s6, $s6, 1
		beqz $t4,end_saving_category
		beq $t4,'\n',end_saving_category
		beq $t4,'\r',end_saving_category
		sb $t4, 0($t6)        
        	addi $t6, $t6, 1         	
        	j save_this_slot_category
        	
		end_saving_category:
		 li  $s3, ',' 
		 sb $s3, 0($t6)        
        	addi $t6, $t6, 1 
		j get_start_time_to_comapre
		
		
			
	
	end_delete_loop:
	
    	sb $zero, 0($t6)
    	la $t6, slot_after_delete 
	
	la $t1, choiced_day
	
	la $a3, new_buffer
	
	la $t4, file_content
	la $t7,day
	
	copy_file_content:
	 	lb $t8, ($t4)         
        	addi $t4, $t4, 1
        	beqz $t8, end_copy_loop  
        	beq $t8, ':', day_found_
        	sb $t8, 0($t7)        
        	addi $t7, $t7, 1       
	j copy_file_content
	
	day_found_:
	 # Null-terminate the day buffer
         sb $zero, 0($t7)
	la $t7,day
	
	la $a1, choiced_day
	la $a0,day
	jal strcmp
	move $t9,$v0
	la $t7,day
	
	store_day_num:
		lb $t8, ($t7)         
        	addi $t7, $t7, 1
        	beqz $t8, store_colon  
        	beq $t8,'\0' , store_colon
               	sb $t8, 0($a3)        
        	addi $a3, $a3, 1  
	j store_day_num
	
		store_colon :
		li  $s3, ':'  
       		sb $s3, 0($a3)
        	addi $a3, $a3, 1
        	
        	 li  $s3, ' '  
		 sb $s3, 0($a3)
        	addi $a3, $a3, 1
        	
        	la $t7,day
		beq $t9,$zero, store_new_day
	la $t7,day
        	 
        	store_the_line:
        	lb $t8, ($t4)         
        	addi $t4, $t4, 1
        	
        	 sb $t8, 0($a3)        
        	addi $a3, $a3, 1 
        	beq $t8,'\n',copy_file_content 
        	beqz $t8,copy_file_content 
        	j store_the_line

	
	store_new_day:
        	# store #t6
        	store_the_rest:
		lb $t8, ($t6)         
        	addi $t6, $t6, 1
        	beqz $t8, skip_the_line
        	beq $t8,'\0' ,skip_the_line
               	sb $t8, 0($a3)        
        	addi $a3, $a3, 1  
	j store_the_rest
        	
        skip_the_line:
        	 li  $s3, '\n'  
		 sb $s3, 0($a3)
        	addi $a3, $a3, 1
        	
        	skip_the_line_loop:
        	lb $t8, ($t4)         
        	addi $t4, $t4, 1
        	beqz $t8,copy_file_content 
        	beq $t8,'\n',copy_file_content 
        	
        	j skip_the_line_loop
        	
        
	end_copy_loop :
	# print to file
	sb $zero, 0($a3)
	
	la $a3,new_buffer
	move $a0,$a3
	li $a1, 256
	li $v0, 4
	syscall
	

write_file_after_delete:
	li $v0, 13     #sysCall for openFile is 13
        la $a0, fin
        li $a1, 1      # flag for write is 1
        syscall
        move $s0, $v0  #save file descriptor in $s0

        bnez $s0,  write_file_content_after_delete
	li $s0, 4
	la $a0, open_file_error
	syscall
##############################################################

 write_file_content_after_delete:
	        li $v0, 15         #sysCall for writeFile is 15
            	move $a0, $s0
            	la $a1, new_buffer   #address of input buffer that will be written
           	li $a2, 1024     # length of string to be written
            	syscall

		#close the file
		li $v0, 16
		move $a0, $s0
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
	
	
# This function prints the slots that are in the range of user input slot 	
get_given_slot_in_given_day:
	# Print a sentence to ask the user to enter a day
	la $a0, select_day		
	li $a1, 256
	li $v0, 4
	syscall
	
	# Get the enterd day from the user
	la $a0, choiced_day_input
	li $a1, 10
	li $v0, 8
	syscall		
	
	# Remove the null terminater/new line from the input 
	la $a0, choiced_day_input
	la $v0, choiced_day
	jal remove_new_line
	
	# Move the input to $t2
	la $t2,choiced_day
	
	# Check if the choiced day exist  
	jal check_day
	
	# If the day exist, branch to get slot 
	beq $v0 ,$zero, get_slot_in_day

	# TODO : return to menu ? 
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
	
	# Save end time $t1
	move $t1, $v0

	 		
	# if start time or end time are less than or equal 5, we need to add 12 for comparsion 
	ble $t0, 5 , add_12_num1	
	ble $t1, 5 , add_12_num2
	
	j find_and_print_slot
			
	add_12_num1:
    	addi $t0, $t0, 12  
					
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
		
		# Exctract the start time to compare it with the given start time
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
		
   	 	# get the end time to compare it 
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
	la $a1, 10
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
	la $a1, 10
	li $v0, 8
	syscall
	
	la $a0, choiced_day_input
	la $v0, choiced_day
	jal remove_new_line
	la $t2, choiced_day
	
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
		
		move $a0,$a3
		la $a1, i
		jal strcmp
		beq $v0,$zero, back_to_add_slot
		
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
        lb $s0, 0($a0)
        beqz $s0,continue
        beq $s0, '\0', continue  # Check for null terminator
        beq $s0, '\n', skip_newline  # Skip newline characters
        sb $s0, 0($v0)
        addi $v0, $v0, 1  # Move to the next position in the destination buffer

    skip_newline:
        addi $a0, $a0, 1  # Move to the next character in the source buffer
        j loop_new_line  # Continue the loop

    continue:
        sb $zero, 0($v0)  # Null-terminate the modified string
        jr $ra

	
str_to_int:
    li $v0, 0            # Initialize result to 0
    
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

