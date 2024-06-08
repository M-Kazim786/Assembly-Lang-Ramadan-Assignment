.model small
.stack 100h
.data     
    prompt db 'Enter a number:$'
    wr db 0Ah,0Dh,'Invalid input$'    
    number dw 0 
    
    msg db 0Ah,0Dh,'Hello$'
    
.code 
inputNum macro num  
    
    local dgt,warn,done
    
    push ax
    push bx
    push cx
    
    mov cx,10
    mov bx,0  
    
    dgt:
    mov ah,1
    int 21h
    
    cmp al,13
    je done
    
    cmp al,48
    jl warn
    
    cmp al,57
    jg warn
    
    sub al,48 
    cbw
    
    xchg ax,bx
    mul cx
    xchg ax,bx
    
    add bx,ax  
    
    jmp dgt
    
    warn:
    
    lea dx,wr
    mov ah,9
    int 21h 
     
    
    mov bx,0 
    
    done:
    mov num,bx 
    
    pop cx
    pop bx
    pop ax  
 
endm    
    
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt
    mov ah,9
    int 21h
    
    inputNum number 
    
    cmp number,0
    je exit
    
    mov cx,number
    
    L1:
    
    lea dx,msg
    mov ah,9
    int 21h
    
    
    loop L1  
    
    exit:
    mov ah,4ch
    int 21h 
    
main endp
end main
