; input number and display
.model small
.stack 100h
.data
.code
main proc  
     ;input FN
     mov ah,1  ; input set in al value as hex value 31h
     int 21h      
     sub al,30h
     
     ;output
     mov ah,2 
     mov dl,al
     add dl,30h
     int 21h     
main endp
end main


; hello world print

.model small
.stack 100h
.data    
  message db 'Hello world $', 
.code
 main proc     
    mov ax, @data
    mov ds, ax
    
    mov ah,09h
    mov dx , offset message
    int 21h
    
    mov ah,4ch
    int 21h
    
main endp
end main


; 1 to 10 print loop
.model small
.stack 100h
 
.data 
.code
main proc    
    
    mov ax, @data
    mov ds,ax
    
    MOV CX, 10        ; Set the loop counter to 10

    MOV BX, 1         ; Initialize the starting number

PrintLoop:

    MOV DL, BL        ; Move the current number to DL for printing
    ADD DL, 30h       ; Convert the number to ASCII
    MOV AH, 02h       ; Print the character in DL
    INT 21h

    ADD BL, 1         ; Increment the number

    LOOP PrintLoop    ; Repeat the loop until CX becomes zero

    MOV AH, 4Ch       ; Terminate the program
    INT 21h
    
    
    main endp  
end main

; array item insert and display
.model small
.stack 100h
.data   
array db 5 dup(?)
.code
main proc    
    
mov ax, @data
mov ds, ax  
mov si,0h

  insert:
       cmp si, 4h
       jg   next
       
       mov ah,1
       int 21h
       
       sub al, 30h
       mov array[si],al
       inc si
       jmp insert
       
    next: ;new lie 
     mov ah,2
     mov dl,0ah
     int 21h   
     
         
     mov dl,0dh   
     int 21h      
     mov si, 0h
   
   display:
     cmp si, 4h
     jg exit
      
     mov ah,2
     mov dl,array[si]
     add dl, 30h
     int 21h
     inc si   
     jmp display
      
   exit:      
     mov ah, 4ch
     int 21h
    
main endp  
end main

; array item insert and  reverse display
.model small
.stack 100h
.data
 array db 5 dup(?) 
 
.code
    main proc
    mov ax,@data    
    mov ds,ax
    
    mov si,0h

    insert:
        cmp si,4h
        jg next
        
        mov ah,1
        int 21h
   
        sub al, 30h
        mov array[si],al
        inc si
        jmp insert  
        
     next:   
     ;new lie
     mov ah,2
     mov dl,0ah
     int 21h
     
     mov dl,0dh   
     int 21h    
     mov si,4h
           
    display:   
      cmp si,0h
      jl exit  
      
      mov ah,2
      mov dl,array[si]  
      add dl,30h
      int 21h
      dec si
      jmp display
      
      exit:
        mov ah, 4ch
        int 21h 
    
    main endp
    end main







