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


; PRINT/COMPARISION CHARS
pos    .byt    '+'
neg    .byt    '-'
at     .byt    '@'
line   .byt    '\n'

main    LDR     r5  zeroi
        ADI     r5  #1
        ADI     sp  #-4
        STR     r5  sp
        JMP     flush
        TRP     3
        LDB     r0  line
        TRP     3
back    TRP     0

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
endf    JMP     back

reset   LDB     r8  zeroc
        LDR     r7  zeroi    ; counter
        LDA     r2  c
forc    LDR     r1  SIZE
        CMP     r1  r7
        BRZ     r1  endc
        MOV     r0  r2
        ADD     r0  r7
        STR     r8  r0
        ADI     r7  #1
        JMP     forc
endc    LDA     r2  c       ; test sequence for verification
        LDR     r7  zeroi
ford    LDR     r1 SIZE
        CMP     r1  r7
        BRZ     r1  endd
        LDB     r0  r2
        TRP     3
        ADI     r7  #1
        JMP     ford
endd    JMP     back


