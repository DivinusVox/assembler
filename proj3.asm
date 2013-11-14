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
nums     .byt    '0'
         .byt    '1'
         .byt    '2'
         .byt    '3'
         .byt    '4'
         .byt    '5'
         .byt    '6'
         .byt    '7'
         .byt    '8'
         .byt    '9'
zero     .int    0

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

nan      .byt   ' '
         .byt   'i'
         .byt   's'
         .byt   ' '
         .byt   'n'
         .byt   'o'
         .byt   't'
         .byt   ' '
         .byt   'a'
         .byt   ' '
         .byt   'n'
         .byt   'u'
         .byt   'm'
         .byt   'b'
         .byt   'e'
         .byt   'r'
         .byt   '\n'

big      .byt   'N'
         .byt   'u'
         .byt   'm'
         .byt   'b'
         .byt   'e'
         .byt   'r'
         .byt   ' '
         .byt   't'
         .byt   'o'
         .byt   'o'
         .byt   ' '
         .byt   'B'
         .byt   'i'
         .byt   'g'
         .byt   '\n'

opis     .byt   'O'
         .byt   'p'
         .byt   'e'
         .byt   'r'
         .byt   'a'
         .byt   'n'
         .byt   'd'
         .byt   ' '
         .byt   'i'
         .byt   's'
         .byt   ' '



; PRINT/COMPARISION CHARS
pos    .byt    '+'
neg    .byt    '-'
at     .byt    '@'
line   .byt    '\n'

main    LDB     r0  at
        MOV     r5  sp  ; Calculate record size
        ADI     r5  #-8
        CMP     r5  st  ; Check for overflow
        BLT     r5  odie
        MOV     r6  fp  ; temp for PFP
        MOV     fp  sp  ; set FP to next
        ADI     sp  #-8 ; Leave space for return addy
        STR     r6  sp  ; save pfp
        MOV     r5  pc  ; Calculate return addy
        ADI     r5  #60 ; Increment to line after jmp
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

opd     MOV     r5  sp  ; Need to calculate space req's
        ADI     r5  #-4  ; 1 int
        CMP     r5  st  ; Check for overflow
        BLT     r5  odie
        TRP     99
        LDR     r0  zero
        ADI     sp  #-4
        STR     r0  sp  ; Initialize local t
        ; Fetch j
        ADI     sp  #4
        LDB     r0  sp  ; Load for eval
        ADI     sp  #-4 ; go back to local int
if1a    MOV     r1  r0  ; Disposable for testing
        LDA     r3  nums
        LDR     r2  r3 ; fetch '0'
        CMP     r1  r2
        BRZ     r1  case1a ; j == '0'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '1'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1b ; j == '1'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '2'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1c ; j == '2'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '3'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1d ; j == '3'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '4'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1e ; j == '4'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '5'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1f ; j == '5'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '6'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1g ; j == '6'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '7'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1h ; j == '7'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '8'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1i ; j == '8'
        ADI     r3  #1
        LDR     r2  r3  ; fetch '9'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1j ; j == '9'
else1a  LDA     r1  nan
        TRP     3       ; print num
        LDB     r0  r1  ; print " is not a number\n"
        TRP     3       ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'i'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 's'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'n'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'o'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 't'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'a'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'n'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'u'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'm'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'b'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'e'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; 'r'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3       ; '\n'
        LDR     r0  zero
        ADI     r0  #1
        STR     r0  flag  ; flag = 1
        JMP     ret1
; Time for cases! Ugh
case1a  TRP     3
case1b  TRP     3
case1c  TRP     3
case1d  TRP     3
case1e  TRP     3
case1f  TRP     3
case1g  TRP     3
case1h  TRP     3
case1i  TRP     3
case1j  TRP     3

if1b    LDR     r1  flag  ; if !flag
        LDR     r0  zero
        CMP     r0  r1
        BLT     ret1      ; flag is True
        LDR     r2  sp    ; fetch t from stack
        ADI     sp  #5
        LDR     r3  sp    ; fetch k from stack
        ADI     sp  #4
        LDR     r4  sp    ; fetch s from stack
if1c    LDB     r0  plus  ; if s == '+'
        CMP     r0  r4
        BRZ     r0  kmul
kneg    LDR     r0  #-1
        MUL     r3  r0    ; -k
kmul    MUL     r2  r3
        LDR     r0  opdy
        ADD     r0  r2    ; opdy += t
        STR     r0  opdy

ret1    JMP     back; go back!


flush   LDR     r1  zero  ; No overflow test needed.
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
        MOV     r1  sp  ; Test for underflow
        CMP     r1  sb
        BGT     r1  udie  ; underflow
        ;TRP     99
        ADI     sp  #-4
        LDR     r0  sp  ; retrieve return addy
        ADI     sp  #-4
        LDR     r1  sp  ; retrieve pfp
        ADI     sp  #8
        MOV     fp  r1  ; set FP to previous
        JMR     r0      ; go back


reset   LDB     r8  nums
        LDR     r7  zero    ; counter
        LDA     r2  c
forr    LDR     r1  SIZE
        CMP     r1  r7
        BRZ     r1  endr
        MOV     r0  r2
        ADD     r0  r7
        STR     r8  r0
        ADI     r7  #1
        JMP     forr
endr    LDA     r2  c       ; test sequence for verification
        LDR     r7  zero
ford    LDR     r1 SIZE
        CMP     r1  r7
        BRZ     r1  endd
        LDB     r0  r2
        TRP     3
        ADI     r7  #1
        JMP     ford
endd    JMP     back


