INCLUDE IRVINE32.INC
.data
partition BYTE "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * ",0
display BYTE "                       ==================================================== ",0
BYTE              "                     ||                                                   ||",0                                      
BYTE              "                     ||           *    Q U I Z   S Y S T E M  *           ||",0
BYTE              "                     ||                                                   ||",0
BYTE              "                     ||---------------------------------------------------||",0
BYTE              "                     ||                                                   ||",0
BYTE              "                     ||      Please read the rules carefully              ||",0
BYTE              "                     ||                then press Enter                   ||",0 
BYTE              "                     ||                to start the game                  ||",0
BYTE              "                     ||                                                   ||",0
BYTE              "                     ||                                                   ||",0
BYTE              "                      ===================================================== ",0
space BYTE " ",0

wrongCheck PROTO
filehandle DWORD ?
filename BYTE "game_rules2.txt",0
buffSize=2000
buffer  BYTE buffSize DUP(?)

prompt4 BYTE "Incorrect-Try Again",0
prompt5 BYTE "Correct Answer",0
prompt7 BYTE "Your Typed Answer Is : ",0
instruction BYTE "Subtract Factor : ",0
msg BYTE "Enter The Number Which Should Come Next: ",0 
msg4 BYTE "Incorrect",0
msg5 BYTE "Correct Answer",0
msg6 BYTE "_ : Predict the series",0
msg7 BYTE "Score = ",0

series DWORD 3 DUP(?)
check1 DWORD ?
check2 DWORD ?
temp DWORD ?
score DWORD ?
diff DWORD ?
verify1 DWORD ?
verify2 DWORD ?
ans1 DWORD ?
ans2 DWORD ?
ans3 DWORD ?
ans4 DWORD ?
c1 DWORD ?

tie1 BYTE "It's a tie between player1 and player2!", 0
tie3 BYTE "It's a tie between three players!", 0
tie2 BYTE "It's a tie between player2 and player3!", 0
tie4 BYTE "It's a tie between player1 and player3!", 0

qans DWORD 5 DUP(?)
store DWORD ?
sub_factor DWORD ?
flag DWORD ?
flags DWORD ?

player_1 PROTO
player_2 PROTO
Randomfunc PROTO
RandomNumber DWORD ?
player_3 PROTO

welcome BYTE "WELCOME TO THE QUIZ SYSTEM!!",0
players BYTE "NO. OF PLAYERS: 1 player, 2 player, 3 player",0
player DWORD ? 

Deets1 BYTE "P1 Details: ",0
Deets2 BYTE "P2 Details: ",0
Deets3 BYTE "P3 Details: ",0

msg1P1 BYTE "P1 Enter Your Name: ",0
msg1P2 BYTE "P2 Enter Your Name: ",0
msg1P3 BYTE "P3 Enter Your Name: ",0

nam1 BYTE 50 Dup(?)
score1 DWORD ?

nam2 BYTE 50 Dup(?)
score2 DWORD ?

nam3 BYTE 50 Dup(?)
score3 DWORD ?

BUFFER_nam1 BYTE 50 DUP(?)
BUFFER_nam2 BYTE 50 DUP(?)
BUFFER_nam3 BYTE 50 DUP(?)

outhandle_1 HANDLE ?
outhandle_2 HANDLE ?
outhandle_3 HANDLE ?

outputfile_1 BYTE "1 player.txt", 0
outputfile_2 BYTE "2 player.txt", 0
outputfile_3 BYTE "3 player.txt", 0

q1p1 BYTE "Questions for player 1:", 0
q2p2 BYTE "Questions for player 2:", 0
q3p3 BYTE "Questions for player 3:", 0

win1 BYTE "Player1 is winner!", 0
win2 BYTE "Player2 is winner!", 0
win3 BYTE "Player3 is winner!", 0

msg_q byte "Enter Number Of Question: ",0
a_question DWORD ?

.code
main PROC
    mov eax,0
    mov edx,0
    mov esi,0
    mov eax, blue + (lightGray * 16)
    call SetTextColor
    call displayP
    mov edx, OFFSET welcome
    call WriteString
    call crlf
    mov edx, OFFSET players
    call WriteString
    call crlf
    call ReadDec
    mov player,eax

    CMP player,1
    jz player_1
    CMP player,2
    mov flags,1
    jz player_1
    CMP player,3
    mov flags,1
    mov flag,1
    jz player_1
    exit
main ENDP

;-------------------------------------------P L A Y E R  1---------------------------------------
player_1 PROC
    call crlf

    mov edx, OFFSET msg1P1
    call WriteString
    mov edx, OFFSET nam1
    mov ecx, SIZEOF nam1
    call ReadString
    call crlf

    mov edx,offset q1p1
    call WriteString
    call crlf
    call crlf
    call Randomfunc
    mov eax,score
    mov score1,eax

    mov edx, offset outputfile_1
    call Createoutputfile
    mov outhandle_1, eax

    mov eax, outhandle_1 
    mov edx, OFFSET nam1
    mov ecx, LENGTHOF nam1
    call WriteToFile

    mov eax, outhandle_1 
    mov edx, OFFSET score1
    mov ecx, LENGTHOF score1
    call WriteToFile

    mov eax,outhandle_1
    call CloseFile

    mov  EDX,OFFSET outputfile_1
    call OpenInputFile
    mov  outhandle_1, EAX
    call crlf
    mov edx,OFFSET Deets1
    Call WriteString
    call crlf

    mov eax, outhandle_1
    mov edx, OFFSET BUFFER_nam1
    mov ecx, LENGTHOF BUFFER_nam1
    call ReadFromFile
    mov edx,OFFSET BUFFER_nam1
    call WriteString
    call crlf

    mov eax, outhandle_1
    mov edx, OFFSET score1
    mov ecx, LENGTHOF score1
    call ReadFromFile

    mov eax,outhandle_1
    call CloseFile
    mov edx,offset msg7
    call WriteString
    mov eax,score1
    call WriteDec
    call crlf
    call crlf

    cmp flags,1
    jz player_2
    ret
player_1 ENDP

;-------------------------------------------P L A Y E R  2-----------------------------------------
player_2 PROC
    mov score,0

    mov edx, OFFSET msg1P2
    call WriteString
    mov edx, OFFSET nam2
    mov ecx, SIZEOF nam2
    call ReadString
    call crlf

    mov edx,offset q2p2
    call WriteString
    call crlf
    call Randomfunc
    mov eax,score
    mov score2,eax

    mov edx, offset outputfile_2
    call Createoutputfile
    mov outhandle_2, eax

    mov eax, outhandle_2 
    mov edx, OFFSET nam2
    mov ecx, LENGTHOF nam2
    call WriteToFile

    mov eax, outhandle_2
    mov edx, OFFSET score2
    mov ecx, LENGTHOF score2
    call WriteToFile

    mov eax,outhandle_2
    call CloseFile

    ; *** REOPEN file BEFORE reading to avoid INVALID HANDLE ***
    mov edx, OFFSET outputfile_2
    call OpenInputFile
    mov outhandle_2, eax

    mov edx,OFFSET Deets2
    Call WriteString
    call crlf

    mov eax, outhandle_2
    mov edx, OFFSET BUFFER_nam2
    mov ecx, LENGTHOF BUFFER_nam2
    call ReadFromFile
    mov edx,OFFSET BUFFER_nam2
    call WriteString
    call crlf

    mov eax, outhandle_2
    mov edx, OFFSET score2
    mov ecx, LENGTHOF score2
    call ReadFromFile

    mov eax,outhandle_2
    call CloseFile

    mov edx,offset msg7
    call WriteString
    mov eax,score2
    call WriteDec
    call crlf
    call crlf

    cmp flag,1
    jz player_3

    mov eax,score1
    cmp eax,score2
    ja L1
    jb L2
    je L3 

L1:
    mov edx,offset win1
    call WriteString
    call crlf
    jmp done2

L2:
    mov edx,offset win2
    call WriteString
    call crlf
    jmp done2

L3:
    mov edx,offset tie1
    call Writestring
    call crlf

done2:
    ret
player_2 ENDP

;-------------------------------------------P L A Y E R  3-----------------------------------------
player_3 PROC
    mov score,0

    mov edx, OFFSET msg1P3
    call WriteString
    mov edx, OFFSET nam3
    mov ecx, SIZEOF nam3
    call ReadString
    call crlf

    mov edx,offset q3p3
    call WriteString
    call crlf
    call Randomfunc
    mov eax,score
    mov score3,eax

    mov edx, offset outputfile_3
    call Createoutputfile
    mov outhandle_3, eax

    mov eax, outhandle_3 
    mov edx, OFFSET nam3
    mov ecx, LENGTHOF nam3
    call WriteToFile

    mov eax, outhandle_3
    mov edx, OFFSET score3
    mov ecx, LENGTHOF score3
    call WriteToFile

    mov eax,outhandle_3
    call CloseFile

    ; *** REOPEN file BEFORE reading to avoid INVALID HANDLE ***
    mov edx, OFFSET outputfile_3
    call OpenInputFile
    mov outhandle_3, eax

    mov edx,OFFSET Deets3
    Call WriteString
    call crlf

    mov eax, outhandle_3
    mov edx, OFFSET BUFFER_nam3
    mov ecx, LENGTHOF BUFFER_nam3
    call ReadFromFile
    mov edx,OFFSET BUFFER_nam3
    call WriteString
    call crlf

    mov eax, outhandle_3
    mov edx, OFFSET score3
    mov ecx, LENGTHOF score3
    call ReadFromFile

    mov eax,outhandle_3
    call CloseFile

    mov edx,offset msg7
    call WriteString
    mov eax,score3
    call WriteDec
    call crlf
    call crlf

    ; --- Winner Logic Unchanged ---
    mov eax,score1
    cmp eax,score2
    ja L1
    jb L2
    je L6

L1:
    cmp eax,score3
    ja L3
    jb L4
    je L7

L2:
    mov ebx,score3
    cmp ebx,score2
    ja L4
    jb L5
    je L10

L3:
    mov edx,offset win1
    call Writestring
    call crlf
    jmp done3

L4:
    mov edx,offset win3
    call Writestring
    call crlf
    jmp done3

L5:
    mov edx,offset win2
    call Writestring
    call crlf
    jmp done3

L6:
    cmp eax,score3
    je Lee
    ja L8
    jb L4

Lee:
    mov edx,offset tie3
    call Writestring
    call crlf
    jmp done3

L8:
    mov edx,offset tie1
    call WriteString
    call crlf
    jmp done3

L7:
    cmp ebx,score2
    je Lee
    ja L9
    jb L5

L9:
    mov edx,offset tie4
    call WriteString
    call crlf
    jmp done3

L10:
    cmp eax,score2
    je Lee
    ja L3
    jb L11

L11:
    mov edx,offset tie2
    call WriteString
    call crlf
    jmp done3

done3:
    ret
player_3 ENDP

;------------------------------------------- NUMBER SERIES TYPE 1 -----------------------------------
NumberSeries1 PROC
    call Randomize
    mov eax,15
    call RandomRange
    mov diff,eax

    call Randomize
    mov eax,30
    call RandomRange
    mov ecx,4

L1:
    add eax,diff
    call WriteDec
    mov edx,OFFSET space
    call WriteString
    Loop L1

    mov edx,OFFSET msg6
    Call WriteString
    call Crlf

    mov ebx,eax
    add ebx,diff
    mov edx,OFFSET msg
    call WriteString
    call ReadDec

    cmp eax,ebx
    je correct
    jne wrong

wrong:
    dec score
    cmp score,0
    jg lmov
    mov score, 0

lmov:
    mov edx,OFFSET msg4
    call WriteString
    call crlf
    jmp endproc

correct:
    add score,1
    mov edx,OFFSET msg5
    call WriteString
    call crlf

endproc:
    mov edx,OFFSET msg7
    call WriteString
    mov eax,score
    call WriteDec
    call crlf
    ret
NumberSeries1 ENDP

;------------------------------------------- NUMBER SERIES TYPE 2 -----------------------------------
NumberSeries2 PROC
    call Randomize
    mov eax,15
    call RandomRange
    mov diff,eax

    call Randomize
    mov eax,50
    call RandomRange
    mov ecx,5

L1:
    sub eax,diff
    call WriteInt
    mov edx,OFFSET space
    call WriteString
    Loop L1

    mov edx,OFFSET msg6
    Call WriteString
    call Crlf

    mov ebx,eax
    sub ebx,diff
    mov edx,OFFSET msg
    call WriteString
    call ReadInt

    cmp eax,ebx
    je correct
    jne wrong

correct:
    add score,1
    mov edx,OFFSET msg5
    call WriteString
    call crlf
    jmp endproc

wrong:
    dec score
    cmp score, 0
    jg lllmov
    mov score, 0

lllmov:
    mov edx,OFFSET msg4
    call WriteString
    call crlf
    call crlf

endproc:
    mov edx,OFFSET msg7
    call WriteString
    mov eax,score
    call WriteDec
    call crlf
    ret
NumberSeries2 ENDP

;------------------------------------------- R A N D O M   F U N C T I O N ---------------------------
Randomfunc PROC
    mov eax,0 
    mov ecx,3

L1:
    push ecx
    call crlf

    mov edx,OFFSET Partition
    call WriteString
    call crlf
    call NumberSeries1
    call crlf

    mov edx,OFFSET Partition
    call WriteString
    call crlf
    call NumberSeries2
    call crlf

    mov edx,OFFSET Partition
    call WriteString
    call crlf

    pop ecx
    Loop L1
    ret
Randomfunc ENDP

;------------------------------------------- D I S P L A Y -----------------------------------------
displayP PROC
    mov ecx,7
L1:
    call crlf
    Loop L1

    mov edx,OFFSET display
    mov eax,LENGTHOF display
    mov ecx,12
L2:
    call crlf
    call WriteString
    add edx,eax
    Loop L2

    mov ecx,4
L6:
    call crlf
    Loop L6

    mov edx,OFFSET filename
    call OpenInputFile
    mov filehandle, EAX
    mov eax,filehandle
    mov edx,OFFSET buffer
    mov ecx,buffSize
    call ReadFromFile

    mov edx,OFFSET buffer
    call WriteString
    call crlf
    call crlf
    call crlf
    call waitmsg
    call clrscr
    ret
displayP ENDP
END main