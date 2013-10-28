SIZE    .int    10
ARR     .int    10
        .int    2
        .int    3
        .int    4
        .int    15
        .int    -6
        .int    7
        .int    8
        .int    9
        .int    10
i       .int    0
sum     .int    0
temp    .int    0
result  .int    0
space   .byt    ' '
line    .byt    '\n'
is      .byt    'i'
        .byt    's'
even    .byt    'e'
        .byt    'v'
        .byt    'n'
odd     .byt    'o'
        .byt    'd'
Sum     .byt    'S'
        .byt    'u'
        .byt    'm'
DAGS    .byt    'D'
        .byt    'A'
        .byt    'G'
        .byt    'S'
neg     .byt    '-'
equ     .byt    '='
Isize   .int    4
MOD     .int    2


; BEGIN PART 1
        LDR     r9  SIZE ; init loop variables
        LDR     r8  i
        LDR     r7  sum
        LDR     r6  result
        LDA     r5  ARR ; array base
        LDR     r4  Isize ; int bytesize
        LDR     r3  MOD
START1  MOV     r0  r8 ; copy i to test against
        CMP     r0  r9 ; compare i to SIZE
        BLT     r0  PART1 ; if i still < SIZE
        JMP     END1 ; break out if not
PART1   MOV     r1  r8 ; calc offset
        MUL     r1  r4
        ADD     r1  r5
        LDR     r0  r1
        ADD     r7  r0 ; add to sum variable
        ; MODULUS CALCULATION
        MOV     r1  r0 ; take a copy for calculation
        DIV     r0  r3
        MUL     r0  r3
        SUB     r0  r1
IF1     BRZ     r0  EPRINT ; if % == 0, jump
        MOV     r0  r1     ; else, odd
        TRP     1
        LDB     r0  space
        TRP     3
        LDA     r2  is
        LDB     r0  r2
        TRP     3
        ADI     r2  #1
        LDB     r0  r2
        TRP     3
        LDB     r0  space
        TRP     3
        LDA     r2  odd
        LDB     r0  r2
        TRP     3
        ADI     r2  #1
        LDB     r0  r2
        TRP     3
        TRP     3
        LDB     r0  line
        TRP     3
        JMP     FI1
EPRINT  MOV     r0  r1      ; even
        TRP     1
        LDB     r0  space
        TRP     3
        LDA     r2  is
        LDB     r0  r2
        TRP     3
        ADI     r2  #1
        LDB     r0  r2
        TRP     3
        LDB     r0  space
        TRP     3
        LDA     r2  even
        LDB     r0  r2
        TRP     3
        ADI     r2  #1
        LDB     r0  r2
        TRP     3
        ADI     r2  #-1
        LDB     r0  r2
        TRP     3
        ADI     r2  #2
        LDB     r0  r2
        TRP     3
        LDB     r0  line
        TRP     3
FI1     ADI     r8  #1 ; i++
        JMP     START1
END1    LDA     r8  Sum ; out of loop, now for char pointer
        LDB     r0  r8
        TRP     3
        ADI     r8  #1
        LDB     r0  r8
        TRP     3
        ADI     r8  #1
        LDB     r0  r8
        TRP     3
        LDB     r0  space
        TRP     3
        LDA     r8  is
        LDB     r0  r8
        TRP     3
        ADI     r8  #1
        LDB     r0  r8
        TRP     3
        LDB     r0  space
        TRP     3        
        MOV     r0  r7 ; print sum
        TRP     1
        LDB     r0  line
        TRP     3
        TRP     3
; END PART ONE

    ; Clean registers
        SUB     r0  r0
        SUB     r1  r1
        SUB     r2  r2
        SUB     r3  r3
        SUB     r4  r4
        SUB     r5  r5
        SUB     r6  r6
        SUB     r7  r7
        SUB     r8  r8
        SUB     r9  r9

; BEGIN PART TWO
    ; Init registers
        LDA     r9  DAGS ; print each letter
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        LDB     r0  line
        TRP     3
        LDA     r9  DAGS ; print int value
        LDR     r0  r9
        MOV     r4  r0  ; save for subtraction later
        TRP     1
        LDB     r0  line
        TRP     3
        ; Swap elements 0 & 2
        LDB     r1  r9
        ADI     r9  #2
        LDB     r2  r9
        STB     r1  r9
        ADI     r9  #-2
        STB     r2  r9
        ; Grab fresh copy from memory
        LDA     r9  DAGS ; print each letter
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        ADI     r9  #1
        LDB     r0  r9
        TRP     3
        LDB     r0  line
        TRP     3
        ;Subtract DAGS from GADS
        LDA     r9  DAGS
        LDR     r0  r9
        SUB     r0  r4
        TRP     1
        LDB     r0  line
        TRP     3

; END PART TWO

        TRP     0 ; TERMINATE

