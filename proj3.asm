SIZE     .int    7 ; const
cnt      .int    5
tenth    .int    4
c        .byt    '8'
         .byt    '8'
         .byt    '8'
         .byt    '8'
         .byt    '8'
         .byt    '8'
         .byt    '8'
data     .int    1
flag     .int    2
opdv     .int    3
zeroc    .byt    '0'
zeroi    .int    0


; PRINT/COMPARISION CHARS
pos    .byt    '+'
neg    .byt    '-'
at     .byt    '@'
line   .byt    '\n'

main    JMP     reset
back    TRP     0


reset   LDB     r8  zeroc
        LDR     r7  zeroi    ; counter
        LDA     r2  c
;forc    LDR     r1  SIZE
;        CMP     r1  r7
;        BRZ     r1  endc
;        MOV     r0  r2
;        ADD     r0  r7
;        STR     r8  r0
;        ADI     r7  #1
;        JMP     forc
endc    LDA     r2  c
        LDR     r7  zeroi
ford    LDR     r1 SIZE
        CMP     r1  r7
        BRZ     r1  endd
        LDB     r0  r2
        TRP     3
        ADI     r7  #1
        JMP     ford
endd    JMP     back
