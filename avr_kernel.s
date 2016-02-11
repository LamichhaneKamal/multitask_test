	.file	"avr_kernel.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	swap_endiannes
	.type	swap_endiannes, @function
swap_endiannes:
.LFB0:
	.file 1 "avr_kernel.c"
	.loc 1 20 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 22 0
	eor r25,r24
	eor r24,r25
.LVL1:
	eor r25,r24
	ret
	.cfi_endproc
.LFE0:
	.size	swap_endiannes, .-swap_endiannes
.global	avr_kernel_init
	.type	avr_kernel_init, @function
avr_kernel_init:
.LFB1:
	.loc 1 25 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL2:
.LBB10:
.LBB11:
	.loc 1 21 0
	ldi r24,lo8(gs(task_0))
	ldi r25,hi8(gs(task_0))
	eor r25,r24
	eor r24,r25
	eor r25,r24
.LBE11:
.LBE10:
	.loc 1 26 0
	sts stack+508+1,r25
	sts stack+508,r24
.LVL3:
.LBB12:
.LBB13:
	.loc 1 21 0
	ldi r24,lo8(gs(task_1))
	ldi r25,hi8(gs(task_1))
	eor r25,r24
	eor r24,r25
	eor r25,r24
.LBE13:
.LBE12:
	.loc 1 27 0
	sts stack+1020+1,r25
	sts stack+1020,r24
.LVL4:
.LBB14:
.LBB15:
	.loc 1 21 0
	ldi r24,lo8(gs(task_2))
	ldi r25,hi8(gs(task_2))
	eor r25,r24
	eor r24,r25
	eor r25,r24
.LBE15:
.LBE14:
	.loc 1 28 0
	sts stack+1532+1,r25
	sts stack+1532,r24
.LVL5:
.LBB16:
.LBB17:
	.loc 1 21 0
	ldi r24,lo8(gs(task_3))
	ldi r25,hi8(gs(task_3))
	eor r25,r24
	eor r24,r25
	eor r25,r24
.LBE17:
.LBE16:
	.loc 1 29 0
	sts stack+2044+1,r25
	sts stack+2044,r24
	.loc 1 30 0
	sts current_task+1,__zero_reg__
	sts current_task,__zero_reg__
	.loc 1 31 0
	lds r30,current_task
	lds r31,current_task+1
	lsl r30
	rol r31
	subi r30,lo8(-(sp))
	sbci r31,hi8(-(sp))
	ld r24,Z
	ldd r25,Z+1
	out __SP_L__+1,r25
	out __SP_L__,r24
	ret
	.cfi_endproc
.LFE1:
	.size	avr_kernel_init, .-avr_kernel_init
.global	dispatcher
	.type	dispatcher, @function
dispatcher:
.LFB3:
	.loc 1 40 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 41 0
	lds r30,current_task
	lds r31,current_task+1
	in r24,__SP_L__
	in r25,__SP_L__+1
	lsl r30
	rol r31
	subi r30,lo8(-(sp))
	sbci r31,hi8(-(sp))
	std Z+1,r25
	st Z,r24
	.loc 1 42 0
/* #APP */
 ;  42 "avr_kernel.c" 1
	push   r0                      
	in     r0, __SREG__            
	cli                            
	push   r0                      
	push   r1                      
	clr    __zero_reg__            
	push   r2                      
	push   r3                      
	push   r4                      
	push   r5                      
	push   r6                      
	push   r7                      
	push   r8                      
	push   r9                      
	push   r10                     
	push   r11                     
	push   r12                     
	push   r13                     
	push   r14                     
	push   r15                     
	push   r16                     
	push   r17                     
	push   r18                     
	push   r19                     
	push   r20                     
	push   r21                     
	push   r22                     
	push   r23                     
	push   r24                     
	push   r25                     
	push   r26                     
	push   r27                     
	push   r28                     
	push   r29                     
	push   r30                     
	push   r31                     
	in     r24, __SP_L__           
	in     r25, __SP_H__           
	adiw   r24, 0x1                
	st     x+, r24                 
	st     x+, r25                 
	
 ;  0 "" 2
	.loc 1 43 0
/* #NOAPP */
	lds r24,current_task
	lds r25,current_task+1
	adiw r24,1
	andi r24,3
	clr r25
	sts current_task+1,r25
	sts current_task,r24
	.loc 1 44 0
/* #APP */
 ;  44 "avr_kernel.c" 1
	ld     r28, x+                 
	ld     r29, x+                 
	sbiw   r28, 0x1                
	out    __SP_L__, r28           
	out    __SP_H__, r29           
	pop    r31                     
	pop    r30                     
	pop    r29                     
	pop    r28                     
	pop    r27                     
	pop    r26                     
	pop    r25                     
	pop    r24                     
	pop    r23                     
	pop    r22                     
	pop    r21                     
	pop    r20                     
	pop    r19                     
	pop    r18                     
	pop    r17                     
	pop    r16                     
	pop    r15                     
	pop    r14                     
	pop    r13                     
	pop    r12                     
	pop    r11                     
	pop    r10                     
	pop    r9                      
	pop    r8                      
	pop    r7                      
	pop    r6                      
	pop    r5                      
	pop    r4                      
	pop    r3                      
	pop    r2                      
	pop    r1                      
	pop    r0                      
	out    __SREG__, r0       
	pop    r0                      
	
 ;  0 "" 2
	.loc 1 45 0
/* #NOAPP */
	lds r30,current_task
	lds r31,current_task+1
	lsl r30
	rol r31
	subi r30,lo8(-(sp))
	sbci r31,hi8(-(sp))
	ld r24,Z
	ldd r25,Z+1
	out __SP_L__+1,r25
	out __SP_L__,r24
	ret
	.cfi_endproc
.LFE3:
	.size	dispatcher, .-dispatcher
.global	yield
	.type	yield, @function
yield:
.LFB2:
	.loc 1 35 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 36 0
	jmp dispatcher
.LVL6:
	.cfi_endproc
.LFE2:
	.size	yield, .-yield
.global	current_task
	.section .bss
	.type	current_task, @object
	.size	current_task, 2
current_task:
	.zero	2
.global	sp
	.data
	.type	sp, @object
	.size	sp, 8
sp:
	.word	stack+506
	.word	stack+1018
	.word	stack+1530
	.word	stack+2042
	.comm	stack,2048,1
	.text
.Letext0:
	.file 2 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c0
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF12
	.byte	0x1
	.long	.LASF13
	.long	.LASF14
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF15
	.byte	0x2
	.byte	0x7c
	.long	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x5
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0x3a
	.byte	0x1
	.long	0x84
	.uleb128 0x6
	.string	"x"
	.byte	0x1
	.byte	0x13
	.long	0x3a
	.byte	0
	.uleb128 0x7
	.long	0x68
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.long	0xa4
	.uleb128 0x8
	.long	0x7a
	.long	.LLST0
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.long	.LASF7
	.byte	0x1
	.byte	0x18
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.long	0x11e
	.uleb128 0xa
	.long	0x68
	.long	.LBB10
	.long	.LBE10
	.byte	0x1
	.byte	0x1a
	.long	0xd6
	.uleb128 0xb
	.long	0x7a
	.byte	0
	.uleb128 0xa
	.long	0x68
	.long	.LBB12
	.long	.LBE12
	.byte	0x1
	.byte	0x1b
	.long	0xef
	.uleb128 0xb
	.long	0x7a
	.byte	0
	.uleb128 0xa
	.long	0x68
	.long	.LBB14
	.long	.LBE14
	.byte	0x1
	.byte	0x1c
	.long	0x108
	.uleb128 0xb
	.long	0x7a
	.byte	0
	.uleb128 0xc
	.long	0x68
	.long	.LBB16
	.long	.LBE16
	.byte	0x1
	.byte	0x1d
	.uleb128 0xb
	.long	0x7a
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x27
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF8
	.byte	0x1
	.byte	0x22
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.long	0x157
	.uleb128 0xe
	.long	.LVL6
	.byte	0x1
	.long	0x11e
	.byte	0
	.uleb128 0xf
	.long	0x3a
	.long	0x168
	.uleb128 0x10
	.long	0x168
	.word	0x3ff
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x11
	.long	.LASF10
	.byte	0x1
	.byte	0x8
	.long	0x181
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	stack
	.uleb128 0x12
	.long	0x157
	.uleb128 0xf
	.long	0x3a
	.long	0x196
	.uleb128 0x13
	.long	0x168
	.byte	0x3
	.byte	0
	.uleb128 0x14
	.string	"sp"
	.byte	0x1
	.byte	0x9
	.long	0x1a7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sp
	.uleb128 0x12
	.long	0x186
	.uleb128 0x11
	.long	.LASF11
	.byte	0x1
	.byte	0xa
	.long	0x1be
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	current_task
	.uleb128 0x12
	.long	0x33
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL1-.Ltext0
	.long	.LFE0-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"stack"
.LASF13:
	.string	"avr_kernel.c"
.LASF1:
	.string	"unsigned char"
.LASF16:
	.string	"swap_endiannes"
.LASF4:
	.string	"long unsigned int"
.LASF12:
	.string	"GNU C 4.8.2 -mmcu=atmega2560 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF11:
	.string	"current_task"
.LASF8:
	.string	"yield"
.LASF2:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF9:
	.string	"sizetype"
.LASF5:
	.string	"long long int"
.LASF15:
	.string	"uint16_t"
.LASF3:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF17:
	.string	"dispatcher"
.LASF14:
	.string	"/home/kamal/test-multitasking"
.LASF7:
	.string	"avr_kernel_init"
	.ident	"GCC: (GNU) 4.8.2"
.global __do_copy_data
.global __do_clear_bss
