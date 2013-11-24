zero     .int   0
line     .byt   '\n'
comma    .byt   ','

over     .byt   'O'
         .byt   'v'
         .byt   'e'
         .byt   'r'
         .byt   'f'
         .byt   'l'
         .byt   'o'
         .byt   'w'

under    .byt   'U'
         .byt   'n'
         .byt   'd'
         .byt   'e'
         .byt   'r'
         .byt   'f'
         .byt   'l'
         .byt   'o'
         .byt   'w'

num     .byt    'E'
        .byt    'n'
        .byt    't'
        .byt    'e'
        .byt    'r'
        .byt    ' '
        .byt    'a'
        .byt    'n'
        .byt    ' '
        .byt    'i'
        .byt    'n'
        .byt    't'
        .byt    ':'
        .byt    ' '

xisy    .byt    'F'
        .byt    'a'
        .byt    'c'
        .byt    't'
        .byt    'o'
        .byt    'r'
        .byt    'i'
        .byt    'a'
        .byt    'l'
        .byt    ' '
        .byt    'o'
        .byt    'f'
        .byt    ' '
        .byt    'i'
        .byt    's'
        .byt    ' '

array   .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0
        .int    0   ; end of array[30]

; START main
        LDA     r7  array
main    LDA     r1  num ; print 'Enter an int: '
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        TRP     2      ; getint()
        ; Test for 0 to break out
        LDR     r1  zero
        CMP     r1  r0
        BRZ     r1  end
        STR     r0  r7 ; save value into array
        ADI     r7  #4
        MOV     r9  r0
        ; fact(r0)
        MOV     r5  sp      ; Calculate record size
        ADI     r5  #-12    ; 1 int, pfp, return add
        CMP     r5  st      ; Check for overflow
        BLT     r5  odie
        MOV     r6  fp      ; temp for PFP
        MOV     fp  sp      ; set FP to next
        ADI     sp  #-8     ; Leave space for return addy
        STR     r6  sp      ; save pfp
        ADI     sp  #-4
        STR     r0  sp      ; arg 1 = getint()
        MOV     r5  pc      ; Calculate return addy
        ADI     r5  #60     ; Increment to line after jmp
        ADI     sp  #8      ; back to save return addy
        STR     r5  sp
        ADI     sp  #-8
        JMP     fact
        ADI     sp  #-4     ; fetch returned value
        LDR     r8  sp
        STR     r8  r7      ; save into array
        ADI     r7  #4      ; increment array pointer
        ADI     sp  #4      ; put the pointer back
        LDA     r1  xisy    ; print 'Factorial of X is Y'
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        MOV     r0  r9
        TRP     1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        ADI     r1  #1
        LDB     r0  r1
        TRP     3
        MOV     r0  r8
        TRP     1
        LDB     r0  line
        TRP     3
        JMP     main        ; LOOP while input != 0


end     LDA     r1  array   ; start of array
        MOV     r2  r7      ; end of array
        ADI     r2  #-4
aloop   LDR     r0  r1      ; fetch left array value
        TRP     1
        ADI     r1  #4      ; next left element
        MOV     r0  r2
        CMP     r0  r1      ; test for left passes right
        BLT     r0  done
        LDB     r0  comma
        TRP     3
        LDR     r0  r2      ; fetch right array value
        TRP     1
        ADI     r2  #-4     ; next right element
        MOV     r0  r2
        CMP     r0  r1      ; test for left passes right
        BLT     r0  done
        LDB     r0  comma
        TRP     3
        JMP     aloop


done    LDB     r0  line
        TRP     3
        TRP     0
; END main

; START int fact(int)
fact    MOV     r5  sp      ; test for overflow
        ADI     r5  #-4     ; 1 int
        CMP     r5  st
        BLT     r5  odie
        LDR     r0  sp      ; fetch n
        ;TRP     1           ; debugging print

        ; test for n == 0
        MOV     r2  r0
        LDR     r1  zero
        CMP     r2  r1
        BRZ     r2  base
        ; else, n * fact(n - 1)
        ADI     sp  #-4     ; make room for n
        STR     r0  sp      ; store n
        ; recurse
        MOV     r5  sp      ; Calculate record size
        ADI     r5  #-12    ; 1 int, pfp, return add
        CMP     r5  st      ; Check for overflow
        BLT     r5  odie
        MOV     r6  fp      ; temp for PFP
        MOV     fp  sp      ; set FP to next
        ADI     sp  #-8     ; Leave space for return addy
        STR     r6  sp      ; save pfp

        ADI     r0  #-1     ; calculate arg
        ADI     sp  #-4
        STR     r0  sp      ; arg 1 = getint()
        MOV     r5  pc      ; Calculate return addy
        ADI     r5  #60     ; Increment to line after jmp
        ADI     sp  #8      ; back to save return addy
        STR     r5  sp
        ADI     sp  #-8
        JMP     fact
        ; ANDDD we're back. Do the maths.
        LDR     r1  sp      ; fetch local var n
        ADI     sp  #-4     ; fetch return
        LDR     r0  sp
        ADI     sp  #8      ; move stack to proper location
        MUL     r1  r0      ; n * returned val
        JMP     return

        ; set return value as 1
base    LDR     r1  zero
        ADI     r1  #1

        ; return sequence
return  MOV     sp  fp  ; RETURN
        MOV     r4  sp  ; Test for underflow
        CMP     r4  sb
        BGT     r4  udie    ; underflow
        ADI     sp  #-4
        LDR     r3  sp  ; return address
        ADI     sp  #-4
        LDR     r4  sp  ; retrieve pfp
        ADI     sp  #4  ; return value
        STR     r1  sp
        ADI     sp  #4  ; top of next frame
        MOV     fp  r4  ; set FP to previous
        JMR     r3

; END fact

; START odie (overflow die)

odie    LDA     r1  over
        LDB     r0  r1
        TRP     3       ; O
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; v
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; e
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; r
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; f
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; l
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; o
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; w
        LDB     r0  line
        TRP     3
        TRP     0

; END OF odie (overflow die)

; START udie (underflow die)

udie    LDA     r1  under
        LDB     r0  r1
        TRP     3       ; U
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; n
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; d
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; e
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; r
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; f
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; l
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; o
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; w
        ADI     r1  #1
        LDB     r0  line
        TRP     3
        TRP     0

; END OF udie (underflow die)
