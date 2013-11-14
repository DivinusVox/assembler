SIZE     .int    7 ; const
cnt      .int    0
tenth    .int    0
c        .byt    '0'
         .byt    '0'
         .byt    '0'
         .byt    '0'
         .byt    '0'
         .byt    '0'
         .byt    '0'
data     .int    0
flag     .int    0
opdv     .int    0
zeroc    .byt    '0'
zeroi    .int    0

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


; PRINT/COMPARISION CHARS
pos    .byt    '+'
neg    .byt    '-'
at     .byt    '@'
line   .byt    '\n'

main    MOV     r5  sp  ; Calculate record size
        ADI     r5  #-8
        CMP     r5  st  ; Check for overflow
        BLT     r5  odie
        ADI     sp  #-8 ; Leave space for return addy
        STR     fp  sp  ; save pfp
        MOV     fp  sp  ; set new fp
        MOV     r5  pc  ; Calculate return addy
        ADI     r5  #48 ; Increment to line after jmp
        ADI     sp  #4  ; back to save return addy
        STR     r5  sp
        ADI     sp  #-4
        JMP     flush
        LDB     r0  at
        TRP     3
        LDB     r0  line
        TRP     3
back    TRP     0

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

flush   LDR     r1  zeroi
        STR     r1  data
        LDA     r5  c
        TRP     4
        STB     r0  r5
        LDB     r4  line
whilef  LDB     r1  r5
        CMP     r1  r4
        BRZ     r1  endf
        TRP     4
        STB     r0  r5
        JMP     whilef
endf    MOV     sp  fp  ; RETURN
        MOV     sp  r1  ; Test for underflow
        CMP     r1  sb
        BLT     r1  udie    ; underflow

        ADI     sp  #-4
        LDR     r0  sp
        ADI     sp  #-4
        LDR     r1  sp
        ADI     sp  #8

reset   LDB     r8  zeroc
        LDR     r7  zeroi    ; counter
        LDA     r2  c
forr    LDR     r1  SIZE
        CMP     r1  r7
        BRZ     r1  endc
        MOV     r0  r2
        ADD     r0  r7
        STR     r8  r0
        ADI     r7  #1
        JMP     forc
endr    LDA     r2  c       ; test sequence for verification
        LDR     r7  zeroi
ford    LDR     r1 SIZE
        CMP     r1  r7
        BRZ     r1  endd
        LDB     r0  r2
        TRP     3
        ADI     r7  #1
        JMP     ford
endd    JMP     back


