# Scrolling-Message-Board
## Design Concept

This project consists of a “Message Board” on the seven-segment display that’s built onto the Basys 3 Artix-7 FGPA Trainer Board. The user should be able to enter messages via a PS/2 keyboard that is connected to the board in the HID port by USB. The messages should be scrolled across the seven-segment display at an adequate speed with some space or pause between each individual message. In addition, the five pushbuttons are also utilized to further customize the messages. Here is a list of the functionality of each pushbutton:
  1. Center Button: **_Restart_** the scrolling messages starting from the first inputted message.
  2. Left Button: **_Decrease_** the speed of the scrolling message(s)
  3. Right Button: **_Increase_** the speed of the scrolling message(s)
  4. Up Button: Go to the **_previous_** message to be displayed
  5. Down Button: Go to the **_next_** message to be displayed

## Design Limitations
There are a few limitations that the user should be aware of prior to running the program:
1. **The keyboard functionality does not work currently.** 
2. Maximum number of characters for each message is 8.
3. Maximum number of individual messages is 2.
4. There are only 3 speeds: slow, normal, and fast.
a. Pressing left will change the speed to fast.
b. Pressing right will change the speed to slow.
c. You cannot cycle through the speeds; you can only choose one or the other.
5. Only the letters shown below are implemented. Other keys do not work.
a. Do not use uppercase letters.
6. Do not press the UP/DOWN buttons while the message is scrolling. Wait till it is done.

## Siekoo 7-Segment Alphabet
I used the Siekoo 7-Segment Alphabet by Alexander Fakoo to display the letters of the English alphabet on the seven-segment displays since there are certain letters that cannot be properly displayed due to the design of the segments.
![alt text](https://github.com/dgao17/Scrolling-Message-Board/blob/master/Siekoo-Alphabet.gif)

## How to Run the Project
### Tools Needed ###
  * Vivado 2019.2.1 Design Suite
  * Basys 3 Artix-7 FGPA Trainer Board
  * Micro-USB cable (for connecting the Basys 3 to the computer)
  * Wired USB PS/2 keyboard
  
### Instructions ###
  1. Start Vivado 2019.2.1.
  2. Go to File Project Open < path where the project is saved >
  3. Open the file called project_2.xpr
  4. Wait for the project to be fully loaded on Vivado. It may take a few minutes.
  5. In the Flow Navigator on the left side, click Run Synthesis and press ‘OK’ for all subsequent pop-ups that follow.
  6. Once synthesis is complete, click on Run Implementation.
  7. Once implementation is complete, click on Generate Bitstream.
  8. Locate the bitstream file: < path where proj. is saved > / project_2.runs/impl_1/project_2.bit
  9. Upon completion, click on Open Hardware Manager in the popup or in the Flow Navigator.
  10. Plug in your Basys 3 Board and turn it on.
  11. Plug in your PS/2 keyboard to the USB port located on the top right of the board.
  12. On Vivado, there should be a green bar on the top that says, “No hardware target is open.”
  13. Click on Open Target Auto Connect
  14. Wait for your board to connect. It should show up inside the Hardware window.
  15. Click on Program Device.
  16. The program should be loaded onto the board now.
  17. Try the program!
