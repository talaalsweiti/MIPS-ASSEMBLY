# Calendar Management System

This project implements a MIPS assembly code to manage and interact with a monthly calendar. The application allows users to view, edit, and manage appointments for specific dates within the calendar. The calendar is stored in a text file with a specific format, and the program provides a user-friendly interface for performing various operations.
This project has been done as a requiremnt for Computer Architecture course in Birzeit University.

## Calendar Format
The calendar is stored in a text file with the following format:

1. Each line represents a day in the month.
2. The line starts with an index indicating the day in the month.
3. Working hours are from 8 AM to 5 PM.
4. There are three types of appointments: Lectures (L), Office Hours (OH), and Meetings (M).
5. To reserve a slot, provide the start and end time with the type of appointment separated by a comma. For example:
    * 11: 8-9 L, 10-12 OH, 12-2 M
    * Indicates a lecture from 8 to 9, office hours from 10 to 12, and a meeting from 12 to 2. Other slots are free.

## Functionality
The program offers the following functionality:

1. View the Calendar:
    * Users can view the calendar per day, per set of days, or for a specific slot in a given day.

2. View Statistics:
    * Displays the number of lectures (in hours), number of office hours (in hours), and the number of meetings (in hours).
    * Provides the average lectures per day and the ratio between the total number of hours reserved for lectures and the total number of hours reserved for office hours.

3. Add a New Appointment:

    * Users can add a new appointment by providing the required information: day number, slot, and type.
    * The program checks for conflicts with existing appointments.

4. Delete an Appointment:

    * Users can delete an appointment by providing the required information: day number, slot, and type.

## Uasge
To use the program, simply run the MIPS assembly code, and follow the prompts to perform the desired operations on the calendar.

Happy scheduling!
