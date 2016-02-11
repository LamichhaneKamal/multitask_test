#define SAVE_CONTEXT                                 \
asm volatile ( \
"push   r0                      \n\t"   /* Save r0 content on the stack */ \
"in     r0, __SREG__            \n\t"   /* Put SREG content in r0 */  \
"cli                            \n\t"   /* Disable interruptions */ \
"push   r0                      \n\t"   /* Save r0 content (initial SREG value) on the stack*/ \
"push   r1                      \n\t"   /* Save r1 content on the stack */\
"clr    __zero_reg__            \n\t"   /* Put 0 in r1*/\
"push   r2                      \n\t"  /* Save r2 content on the stack */ \
"push   r3                      \n\t"   \
"push   r4                      \n\t"   \
"push   r5                      \n\t"   \
"push   r6                      \n\t"   \
"push   r7                      \n\t"   \
"push   r8                      \n\t"   \
"push   r9                      \n\t"   \
"push   r10                     \n\t"   \
"push   r11                     \n\t"   \
"push   r12                     \n\t"   \
"push   r13                     \n\t"   \
"push   r14                     \n\t"   \
"push   r15                     \n\t"   \
"push   r16                     \n\t"   \
"push   r17                     \n\t"   \
"push   r18                     \n\t"   \
"push   r19                     \n\t"   \
"push   r20                     \n\t"   \
"push   r21                     \n\t"   \
"push   r22                     \n\t"   \
"push   r23                     \n\t"   \
"push   r24                     \n\t"   \
"push   r25                     \n\t"   \
"push   r26                     \n\t"   \
"push   r27                     \n\t"   \
"push   r28                     \n\t"   \
"push   r29                     \n\t"   \
"push   r30                     \n\t"   \
"push   r31                     \n\t" /* Save r31 content on the stack */  \
"in     r24, __SP_L__           \n\t" /* Put SPL content in r24 */  \
"in     r25, __SP_H__           \n\t" /* Put SPH content in r25 */  \
"adiw   r24, 0x1                \n\t" /* Add 1 to r24 (Saved SPL */  \
"st     x+, r24                 \n\t" /* Store r24 content at X */  \
"st     x+, r25                 \n\t" /* Store r25 content at X+1 */  \
);



#define RESTORE_CONTEXT \
asm volatile ( \
"ld     r28, x+                 \n\t"  /* Load *X in r28 and X=X+1 */\
"ld     r29, x+                 \n\t"  /* Load *X in r29 */\
"sbiw   r28, 0x1                \n\t"  /* Remove 1 to r28 */ \
"out    __SP_L__, r28           \n\t"  /* Put r28 content in SPL */  \
"out    __SP_H__, r29           \n\t"  /* Put r29 content in SPH */  \
"pop    r31                     \n\t"  /* Put top of the stack in r31 */ \
"pop    r30                     \n\t"   \
"pop    r29                     \n\t"   \
"pop    r28                     \n\t"   \
"pop    r27                     \n\t"   \
"pop    r26                     \n\t"   \
"pop    r25                     \n\t"   \
"pop    r24                     \n\t"   \
"pop    r23                     \n\t"   \
"pop    r22                     \n\t"   \
"pop    r21                     \n\t"   \
"pop    r20                     \n\t"   \
"pop    r19                     \n\t"   \
"pop    r18                     \n\t"   \
"pop    r17                     \n\t"   \
"pop    r16                     \n\t"   \
"pop    r15                     \n\t"   \
"pop    r14                     \n\t"   \
"pop    r13                     \n\t"   \
"pop    r12                     \n\t"   \
"pop    r11                     \n\t"   \
"pop    r10                     \n\t"   \
"pop    r9                      \n\t"   \
"pop    r8                      \n\t"   \
"pop    r7                      \n\t"   \
"pop    r6                      \n\t"   \
"pop    r5                      \n\t"   \
"pop    r4                      \n\t"   \
"pop    r3                      \n\t"   \
"pop    r2                      \n\t"   \
"pop    r1                      \n\t"   \
"pop    r0                      \n\t"  /* Restore r0 from the stack*/ \
"out    __SREG__, r0       \n\t"  /* Restore SREG from r0 */ \
"pop    r0                      \n\t"  /* Restore the real r0 */ \
);

//After r31 content line
//"lds    r26, context            \n\t" /* Put *context in r26 (low byte of X) */ \
//"lds    r27, context + 1        \n\t" /* Put *(context+1) in r27 (hight byte of X) */  \
//first two lines of asm volatile 
//"lds    r26, context            \n\t"  /* Load *context in r26 (XL)*/\
//"lds    r27, context + 1        \n\t"  /* Load *(context+1) in r27 (XH)*/ \