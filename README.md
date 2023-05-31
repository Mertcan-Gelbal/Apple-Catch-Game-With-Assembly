# Apple-Catch-Game-With-Assembly

This program is a game written in assembly language using the Emu8086 simulator. In the game, a word "apple" is displayed on the screen, and the user moves the apple using the left and right arrow keys to align it with the basket. By pressing the forward arrow key, the user can make the apple fall into the basket and earn points. However, if the apple crosses the green line, which represents the grass, the game is lost and it ends.


## Getting Started

At the beginning of the program, the video memory address is set, and then the letters 'S', 'C', 'O', and 'R' are displayed sequentially. After a space, the value of the score is printed. A strip is drawn below the basket as an indicator for the grass.


## Game Flow

The rest of the program forms the main loop of the game. In this loop, the apple falls down without waiting for the user to press a key. The user must move the apple directly below using the right and left arrow keys. When the user presses the forward arrow key and the apple aligns with the basket, the apple falls into the basket, and the score increases by 1.

The program uses the video memory to display characters on the screen, using low-level assembly language. Additionally, it uses the INT 16h interrupt call to read and process user input from the keyboard. Since we prevent the interrupt within the loop, the apple continues to fall down if no key is pressed.


## Installation

1. Download and install the Emu8086 simulator.
2. Download the files and extract them to a folder.
3. Launch the Emu8086 simulator.
4. Select the "File" menu and then choose "Open" to open the files in the simulator.
5. In the file selection window, locate and open the downloaded and extracted files.
6. To run the program, select the "Run" option or press F9.
