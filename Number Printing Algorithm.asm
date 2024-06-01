;.....Number Printing Algorithm......


.model stack
.stack 100h
.data
   
.code 

printNum proc
    
      mov bp,sp    
      add bp,2
      
      push ax   
      push bx
      push cx
      push dx
      
      mov ax,[bp]
      
      mov bx,0Ah
      mov cx,0
      mov dx,0   
      
      printLoop:
      
      div bx 
      
      push dx
      
      mov dx,0
      inc cx
      cmp ax,0
      
      jnz printLoop
      
      showLoop:
      pop dx
      add dl,30h  
      mov ah,2
      int 21h
      
      loop showLoop
  
      pop dx
      pop cx
      pop bx
      pop ax
    
    ret
    
printNum endp

main proc 
   
       mov si,44545
       
       push si
       call printNum 
       
       mov ah,4ch
       int 21h
    
main endp
end main
