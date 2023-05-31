ORG 100h          

MOV AX, 0B800h     ; Load the starting address of the video memory into AX
MOV DS, AX         ; Match DS with the starting address of the video memory

MOV DI, 1833       ; Set DI to address 1833 (DI holds the address of the first letter of the word 'ELMA' in video memory)
MOV [DI], 60h      ; Set the character at the address pointed by DI to 60h (performing the operation to make the letter 'ELMA' red)

; Printing the letter 'S'
MOV AH, 02h    ; File service call: Printing the character
MOV [002h], 83
MOV DL, [002h] ; Loading the ASCII code of the letter 'S' from address [002h]
INT 21h

; Printing the letter 'K'
MOV AH, 02h    ; File service call: Printing the character
MOV [003h], 75
MOV DL, [003h] ; Loading the ASCII code of the letter 'K' from address [003h]
INT 21h

; Printing the letter 'O'
MOV AH, 02h    ; File service call: Printing the character
MOV [004h], 79
MOV DL, [004h] ; Loading the ASCII code of the letter 'O' from address [004h]
INT 21h

;Printing the letter 'R'
MOV AH, 02h    ; File service call: Printing the character
MOV [005h], 82
MOV DL, [005h] ; Loading the ASCII code of the letter 'R' from address [005h]
INT 21h

;Creation of the green line at the bottom
MOV AH, 02h 
MOV [0751h],20h; It creates a line at the bottom with a green stripe using the expression '20h'
MOV DL, [0751h]
INT 21h 

MOV AH, 02h 
MOV [0753h],20h
MOV DL, [0753h]
INT 21h 

MOV AH, 02h 
MOV [0755h],20h
MOV DL, [0755h]
INT 21h 

MOV AH, 02h 
MOV [0757h],20h
MOV DL, [0757h]
INT 21h 

MOV AH, 02h 
MOV [0759h],20h
MOV DL, [0759h]
INT 21h 

MOV AH, 02h 
MOV [0761h],20h
MOV DL, [0761h]
INT 21h 

MOV AH, 02h 
MOV [0763h],20h
MOV DL, [0763h]
INT 21h 

MOV AH, 02h 
MOV [0765h],20h
MOV DL, [0765h]
INT 21h 

MOV AH, 02h 
MOV [0767h],20h
MOV DL, [0767h]
INT 21h 

MOV AH, 02h 
MOV [0769h],20h
MOV DL, [0769h]
INT 21h 

MOV AH, 02h 
MOV [0771h],20h
MOV DL, [0771h]
INT 21h 

MOV AH, 02h 
MOV [0773h],20h
MOV DL, [0773h]
INT 21h 

MOV AH, 02h 
MOV [0775h],20h
MOV DL, [0775h]
INT 21h

MOV AH, 02h 
MOV [0777h],20h
MOV DL, [0777h]
INT 21h 

MOV AH, 02h 
MOV [0779h],20h
MOV DL, [0779h]
INT 21h 

MOV AH, 02h 
MOV [0781h],20h
MOV DL, [0781h]
INT 21h 

MOV AH, 02h 
MOV [0783h],20h
MOV DL, [0783h]
INT 21h 

MOV AH, 02h 
MOV [0785h],20h
MOV DL, [0785h]
INT 21h 

MOV AH, 02h 
MOV [0787h],20h
MOV DL, [0787h]
INT 21h

MOV AH, 02h 
MOV [0789h],20h
MOV DL, [0789h]
INT 21h 

MOV AH, 02h 
MOV [0791h],20h
MOV DL, [0791h]
INT 21h  

MOV AH, 02h 
MOV [0793h],20h
MOV DL, [0793h]
INT 21h 

MOV AH, 02h 
MOV [0795h],20h
MOV DL, [0795h]
INT 21h 

MOV AH, 02h 
MOV [0797h],20h
MOV DL, [0797h]
INT 21h 

MOV AH, 02h 
MOV [0799h],20h
MOV DL, [0799h]
INT 21h 

MOV AH, 02h 
MOV [0801h],20h
MOV DL, [0801h]
INT 21h 

MOV AH, 02h 
MOV [0803h],20h
MOV DL, [0803h]
INT 21h 

MOV [044h], 30h    ; Put the character 30h at the memory address 044h (the score is 0 before the game starts)

; The user screen is designed with dimensions of 39x25

start:             ; The starting label of the program
  MOV AH, 0h       ; Set AH to 0 (for time function)
  INT 1Ah          ; Get the time information
  MOV AX, DX       
  MOV DX, 0        
  MOV BX, 40       
  DIV BX           
  ADD DL, DL       
  ADD DL, 81       ; Add the value of DL to 81 (calculate the column of the first letter of the word APPLE)

  MOV SI, DX       ; Copy the value of DX to SI (position of APPLE)
  MOV [SI], 40h    ; Put the character 40h at the address indicated by SI (display the first letter of the word APPLE)

mainloop:
  MOV [SI], 0      ; Put the character 0 at the address indicated by SI (delete the first letter of the word APPLE)
  ADD SI, 78       ; Add 78 to the value of SI (move SI to the next address)
  MOV [SI], 40h    ; Put the character 40h at the address indicated by SI (display the first letter of the word APPLE)

  MOV AH,1         
  INT 16h          ; Take the character
  JZ mainloop      ; If the character is equal to 0 (if no key is pressed), go to the main loop
  XOR ax,ax        
  INT 16h          ; Read one more character from the keyboard

  CMP SI, DI       ; Check if SI is equal to DI (Is SI, which indicates the first letter of the word APPLE, equal to DI, which indicates the last letter?)
  JNE continue     ; If it is not equal, go to continue

  MOV CL, [044h]   ; Load the value of CL into the memory address 002h (read the score)
  ADD CL, 1        ; Add 1 to the value of CL (increase the score by one)
  MOV [044h], CL   ; Write the value of CL to the memory address 002h (update the score)
  JMP start        ; Go back to the beginning

continue:          
  CMP AH, 75       ; Check if AH is equal to 75 (has the left arrow key been pressed?)
  JNE PASS1        ; If it is not equal, go to PASS1

  CMP DI, 1795     ; Check if DI is equal to 1795 (the address of the last letter of the word APPLE)
  JE mainloop      ; If it is equal, go to the main loop (continue the game loop if the last letter has been reached)

  MOV [DI], 0      ; Put the character 0 at the address indicated by DI (delete the last letter of the word APPLE)
  SUB DI, 2        ; Subtract 2 from the value of DI (move DI to the previous address)
  MOV [DI], 60h    ; Put the character 60h at the address indicated by DI (display the last letter of the word APPLE)

PASS1:
  CMP AH, 77       ; Check if AH is equal to 77 (has the right arrow key been pressed?)
  JNE PASS2        ; If it is not equal, go to PASS2

  CMP DI, 1871     ; Check if DI is equal to 1871 (the address of the last letter of the word APPLE)
  JE mainloop      ; If it is equal, go to the main loop (continue the game loop if the last letter has been reached)

  MOV [DI], 0      ; Put the character 0 at the address indicated by DI (delete the last letter of the word APPLE)
  ADD DI, 2        ; Add 2 to the value of DI (move DI to the next address)
  MOV [DI], 60h    ; Put the character 60h at the address indicated by DI (display the last letter of the word APPLE)

PASS2:
  CMP SI, 2031     ; Check if it is greater than SI 2031 (Has the word APPLE been completed?)
  JG ENDGAME       ; If it is greater, go to ENDGAME (terminate the game)
  JMP mainloop     ; If not, go to the main loop (continue the game loop)

ENDGAME:           ; The point at which the game ends
  HLT               ; Stop the program from running
