#define save_context()
asm volatile 
























TaskSwitch:
; preserve all general purpose registers for last task
        PUSH    R0
        PUSH    R1
        PUSH    R2
        PUSH    R3
        PUSH    R4
        PUSH    R5
        PUSH    R6
        PUSH    R7
        PUSH    R8
        PUSH    R9
        PUSH    R10
        PUSH    R11
        PUSH    R12
        PUSH    R13
        PUSH    R14
        PUSH    R15
        PUSH    R16
        PUSH    R17
        PUSH    R18
        PUSH    R19
        PUSH    R20
        PUSH    R21
        PUSH    R22
        PUSH    R23
        PUSH    R24
        PUSH    R25
        PUSH    R26
        PUSH    R27
        PUSH    R28
        PUSH    R29
        PUSH    R30
        PUSH    R31 
; retreive PID
        LDS     R29,LWRD(PID)
; preserve status register for last task
        IN      R16,LOW(63)           ; save SREG in temporary register
        MOV     R30,R29               ; get PID
        CLR     R31                   
        SUBI    R30,LOW(-(sReg))      ; calculate pointer for sReg Array
        SBCI    R31,HIGH(-(sReg))
        ST      Z,R16                 ; save SREG
; preserve RSTACK pointer for last task       
        IN      R17,LOW(62)           ; save StackPointer (SPH) in temporary register
        IN      R16,LOW(61)           ; save StackPointer (SPL) in temporary register
        MOV     R30,R29               ; get PID
        CLR     R31
        LSL     R30                   ; multiply by 2
        SUBI    R30,LOW(-(rStack))    ; calculate pointer for rStack Array
        SBCI    R31,HIGH(-(rStack))
        STD     Z+0,R16               ; save current SPL
        STD     Z+1,R17               ; save current SPH
; calculate next PID        
        INC     R29                   ; goto next PID
        ANDI    R29,LOW(7)            ; wrap around to 0
; save PID
        STS     LWRD(PID),R29      
                        
; load RSTACK pointer for next task        
        MOV     R30,R29               ; get PID
        CLR     R31
        LSL     R30                   ; multiply by 2
        SUBI    R30,LOW(-(rStack))    ; calculate pointer for rStack Array
        SBCI    R31,HIGH(-(rStack))
        LDD     R16,Z+0               ; read in new SPL value
        LDD     R17,Z+1               ; read in new SPH value  
        OUT     LOW(62),R17           ; set StackPointer (SPH) 
        OUT     LOW(61),R16           ; set StackPointer (SPL) 
; load status register for next task
        MOV     R30,R29               ; get PID
        CLR     R31
        SUBI    R30,LOW(-(sReg))      ; calculate pointer for sReg Array
        SBCI    R31,HIGH(-(sReg))
        LD      R16,Z                 ; read in new SREG value
        OUT     LOW(63),R16           ; set SREG for next task 
; restore general purpose registers for next task
        POP     R31
        POP     R30
        POP     R29
        POP     R28
        POP     R27
        POP     R26
        POP     R25
        POP     R24
        POP     R23
        POP     R22
        POP     R21
        POP     R20
        POP     R19
        POP     R18
        POP     R17
        POP     R16
        POP     R15
        POP     R14
        POP     R13
        POP     R12
        POP     R11
        POP     R10
        POP     R9
        POP     R8
        POP     R7
        POP     R6
        POP     R5
        POP     R4
        POP     R3
        POP     R2
        POP     R1
        POP     R0
    RETI