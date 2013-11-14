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

; START main

main    LDB     r0  at
        ; reset(1, 0, 0, 0) // Reset globals
        MOV     r5  sp   ; Calculate record size
        ADI     r5  #-24 ; 4 ints, pfp, return add
        CMP     r5  st   ; Check for overflow
        BLT     r5  odie
        MOV     r6  fp   ; temp for PFP
        MOV     fp  sp   ; set FP to next
        ADI     sp  #-8  ; Leave space for return addy
        STR     r6  sp   ; save pfp
        LDR     r0  zero
        ADI     r0  #1
        ADI     sp  #-4
        STR     r0  sp   ; arg 1 = 1
        LDR     r0  zero
        ADI     sp  #-4
        STR     r0  sp   ; arg 2 = 0
        ADI     sp  #-4
        STR     r0  sp   ; arg 3 = 0
        ADI     sp  #-4
        STR     r0  sp   ; arg 4 = 0
        MOV     r5  pc   ; Calculate return addy
        ADI     r5  #60  ; Increment to line after jmp
        ADI     sp  #20  ; back to save return addy
        STR     r5  sp
        ADI     sp  #-20
        JMP     reset
        ; getdata()
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
        JMP     getdata
        ; while (c[0] != '@')
mwh1    LDA     r9  c
        LDB     r1  r9
        LDB     r0  at
        CMP     r0  r1
        BRZ     r0  mewh1
    mif1    LDB     r0  pos  ; if (c[0] == '+') || c[0] == '-')
            CMP     r0  r1
            BRZ     r0  mif1T
            LDB     r0  neg
            CMP     r0  r1
            BRZ     r0  mif1T    ; else
                MOV     r8  r9
                ADI     r8  #1
                STB     r1  r8   ; c[1] = c[0]
                LDB     r0  pos
                STB     r0  r9   ; c[0] = '+'
                LDR     r0  cnt
                ADI     r0  #1   ; cnt++
                STR     r0  cnt
    meif1   MOV     r1  r1   ; waste cycle
    mwh2    LDR     r1  data ; while (data)
            LDR     r0  zero
            CMP     r0  r1
            BRZ     r0  mewh2
        mif2    LDA     r9  c
                LDR     r8  cnt
                ADI     r8  #-1
                MOV     r7  r9
                ADD     r7  r8
                LDB     r0  r7
                LDB     r1  line
                CMP     r0  r1
                BRZ     r0  mif2T  ; if (c[cnt-1] == '\n')
                ; else getdata()
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
                    JMP     getdata
        meif2   MOV     r1  r1  ; endif 2
        JMP     mwh2
mewh2   MOV     r1 r1  ; endwhile
        ; reset(1, 0, 0, 0) // Reset globals
        MOV     r5  sp   ; Calculate record size
        ADI     r5  #-24 ; 4 ints, pfp, return add
        CMP     r5  st   ; Check for overflow
        BLT     r5  odie
        MOV     r6  fp   ; temp for PFP
        MOV     fp  sp   ; set FP to next
        ADI     sp  #-8  ; Leave space for return addy
        STR     r6  sp   ; save pfp
        LDR     r0  zero
        ADI     r0  #1
        ADI     sp  #-4
        STR     r0  sp   ; arg 1 = 1
        LDR     r0  zero
        ADI     sp  #-4
        STR     r0  sp   ; arg 2 = 0
        ADI     sp  #-4
        STR     r0  sp   ; arg 3 = 0
        ADI     sp  #-4
        STR     r0  sp   ; arg 4 = 0
        MOV     r5  pc   ; Calculate return addy
        ADI     r5  #60  ; Increment to line after jmp
        ADI     sp  #20  ; back to save return addy
        STR     r5  sp
        ADI     sp  #-20
        JMP     reset

        ; getdata()
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
        JMP     getdata

        JMP    mwh1
mewh1   JMP    retmain  ; endwhile

; getdata()
mif1T   MOV     r5  sp  ; Calculate record size
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
        JMP     getdata
        JMP     meif1

mif2T   LDA     r1  data
        LDR     r0  zero
        STR     r0  r1   ; data = 0
        ADI     r0  #1
        LDA     r1  tenth
        STR     r0  r1   ; tenth = 1
        ADI     r0  #-3
        LDR     r1  cnt
        ADD     r1  r0
        STR     r1  cnt  ; cnt -= 2
mwh3    LDR     r1  zero ; while (!flag && cnt != 0)
        LDR     r0  flag
        CMP     r0  r1
        BNZ     r0  mewh3
        LDR     r0  cnt
        CMP     r0  r1
        BRZ     r0  mewh3

        ; opd(c[0], tenth, c[cnt])
        MOV     r5  sp
        ADI     r5  #-14   ; 2 char, 1 int, pfp, return add
        CMP     r5  st     ; check for overflow
        BLT     r5  odie
        MOV     r6  fp     ; temp for PFP
        MOV     fp  sp     ; set FP to next
        ADI     sp  #-8    ; Leave space for return addy
        STR     r6  sp     ; save pfp
        ; Fetch args
        LDA     r9  c
        LDB     r0  r9
        ADI     sp  #-1
        STB     r0  sp     ; arg 1 = c[0]
        LDR     r0  tenth
        ADI     sp  #-4
        STR     r0  sp     ; arg 2 = tenth
        LDR     r8  cnt
        ADD     r8  r9
        LDB     r0  r8
        ADI     sp  #-1
        STB     r0  sp     ; arg 3 = c[cnt]
        MOV     r5  pc     ; Calculate return addy
        ADI     r5  #60      ; Increment to line after jmp
        ADI     sp  #10    ; back to save return addy
        STR     r5  sp
        ADI     sp  #-10
        JMP     opd

        LDR     r0  cnt
        ADI     r0  #-1
        STR     r0  cnt   ; cnt--
        LDR     r1  zero
        ADI     r1  #10
        LDR     r0  tenth ; tenth *= 10
        MUL     r0  r1
        STR     r0  tenth
        JMP     mwh3
mewh3   LDR     r1  zero ; endwhile
        LDR     r0  flag
        CMP     r0  r1   ; if (!flag)
        BNZ     r0  meif3
        LDA     r1  opis ; printf("Operand is %d\n", opdv)
        LDB     r0  r1
        TRP     3        ; 'O'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'p'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'e'
        ADI     r1  #1
        LDB    r0  r1
        TRP     3        ; 'r'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'a'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'n'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'd'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'i'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 's'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; ' '
        LDR     r0  opdv
        TRP     1        ; '%d'
        LDB     r0  line
        TRP     3        ; '\n'

meif3   JMP     meif2

retmain TRP     0

; END OF main

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

; START opd

opd     MOV     r5  sp  ; Need to calculate space req's
        ADI     r5  #-4  ; 1 int
        CMP     r5  st  ; Check for overflow
        BLT     r5  odie
        LDR     r0  zero
        ADI     sp  #-4
        STR     r0  sp  ; Initialize local t
        ; Fetch j
        ADI     sp  #4
        LDB     r0  sp  ; Load for eval
        ADI     sp  #-4 ; go back to local int
        LDR     r6  sp  ; copy of t for later assignment
        LDR     r7  zero ; zero out register for adi later
if1a    MOV     r1  r0  ; Disposable for testing
        LDA     r3  nums
        LDB     r2  r3 ; fetch '0'
        CMP     r1  r2
        BRZ     r1  case1a ; j == '0'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '1'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1b ; j == '1'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '2'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1c ; j == '2'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '3'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1d ; j == '3'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '4'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1e ; j == '4'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '5'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1f ; j == '5'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '6'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1g ; j == '6'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '7'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1h ; j == '7'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '8'
        MOV     r1  r0
        CMP     r1  r2
        BRZ     r1  case1i ; j == '8'
        ADI     r3  #1
        LDB     r2  r3  ; fetch '9'
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
case1a  MOV     r6  r7  ; t = 0
        JMP     if1b
case1b  ADI     r7  #1
        MOV     r6  r7  ; t = 1
        JMP     if1b
case1c  ADI     r7  #2
        MOV     r6  r7  ; t = 2
        JMP     if1b
case1d  ADI     r7  #3
        MOV     r6  r7  ; t = 3
        JMP     if1b
case1e  ADI     r7  #4
        MOV     r6  r7  ; t = 4
        JMP     if1b
case1f  ADI     r7  #5
        MOV     r6  r7  ; t = 5
        JMP     if1b
case1g  ADI     r7  #6
        MOV     r6  r7  ; t = 6
        JMP     if1b
case1h  ADI     r7  #7
        MOV     r6  r7  ; t = 7
        JMP     if1b
case1i  ADI     r7  #8
        MOV     r6  r7  ; t = 8
        JMP     if1b
case1j  ADI     r7  #9
        MOV     r6  r7  ; t = 9

if1b    STR     r6  sp
        LDR     r1  flag  ; if !flag
        LDR     r0  zero
        CMP     r0  r1
        BLT     r0  ret1  ; flag is True
        MOV     r2  r6    ; fetch t
        ADI     sp  #5
        LDR     r3  sp    ; fetch k from stack
        ADI     sp  #4
        LDB     r4  sp    ; fetch s from stack
if1c    LDB     r0  pos  ; if s == '+'
        CMP     r0  r4
        BRZ     r0  kmul
kneg    LDR     r0  zero
        ADI     r0  #-1
        MUL     r3  r0    ; -k
kmul    MUL     r2  r3
        LDR     r0  opdv
        ADD     r0  r2    ; opdv += t
        STR     r0  opdv

ret1    MOV     sp  fp  ; RETURN
        MOV     r1  sp  ; Test for underflow
        CMP     r1  sb
        BGT     r1  udie  ; underflow
        ADI     sp  #-4
        LDR     r0  sp  ; retrieve return addy
        ADI     sp  #-4
        LDR     r1  sp  ; retrieve pfp
        ADI     sp  #8
        MOV     fp  r1  ; set FP to previous
        JMR     r0      ; go back

; END OF opd

; START flush

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
        ADI     sp  #-4
        LDR     r0  sp  ; retrieve return addy
        ADI     sp  #-4
        LDR     r1  sp  ; retrieve pfp
        ADI     sp  #8
        MOV     fp  r1  ; set FP to previous
        JMR     r0      ; go back

; END OF flush

; START getdata

getdata LDR     r6  SIZE ; no overflow needed
        LDR     r5  cnt
if2     MOV     r0  r5   ; disposable cnt
        CMP     r0  r6
        BLT     r0  true2

else2   LDA     r1  big
        LDB     r0  r1
        TRP     3        ; 'N'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'u'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'm'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'b'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'e'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'r'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 't'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'o'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'o'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; ' '
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'B'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'i'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; 'g'
        ADI     r1  #1
        LDB     r0  r1
        TRP     3        ; '\n'
; flush buffer
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
; Back
        JMP     ret2

true2   LDA     r1  c
        TRP     4
        ADD     r1  r5  ; c[cnt]
        STB     r0  r1  ;  ^ = getchar()
        ADI     r5  #1
        STR     r5  cnt

ret2    MOV     sp  fp  ; RETURN
        MOV     r1  sp  ; Test for underflow
        CMP     r1  sb
        BGT     r1  udie  ; underflow
        ADI     sp  #-4
        LDR     r0  sp  ; retrieve return addy
        ADI     sp  #-4
        LDR     r1  sp  ; retrieve pfp
        ADI     sp  #8
        MOV     fp  r1  ; set FP to previous
        JMR     r0      ; go back

; END OF getdata

; START reset

reset   MOV     r5  sp      ; test for overflow
        ADI     r5  #-4      ; 1 int
        CMP     r5  st
        BLT     r5  odie
        LDR     r0  zero    ; k = 0
        ADI     sp  #-4
        STR     r0  sp      ; save k
        LDB     r8  zero
        LDR     r7  sp    ; counter
        LDA     r2  c
forr    LDR     r1  SIZE
        CMP     r1  r7
        BRZ     r1  endr  ; for k < SIZE (7)
        MOV     r0  r2
        ADD     r0  r7
        STR     r8  r0
        ADI     r7  #1
        JMP     forr
endr    ADI     sp  #16  ;data = w
        LDR     r0  sp
        STR     r0  data
        ADI     sp  #-4  ;opdv = x
        LDR     r0  sp
        STR     r0  opdv
        ADI     sp  #-4  ;cnt = y
        LDR     r0  sp
        STR     r0  cnt
        ADI     sp  #-4  ;flag = z
        LDR     r0  sp
        STR     r0  flag

        ; return sequence
        MOV     sp  fp  ; RETURN
        MOV     r1  sp  ; Test for underflow
        CMP     r1  sb
        BGT     r1  udie  ; underflow
        ADI     sp  #-4
        LDR     r0  sp  ; retrieve return addy
        ADI     sp  #-4
        LDR     r1  sp  ; retrieve pfp
        ADI     sp  #8
        MOV     fp  r1  ; set FP to previous
        JMR     r0      ; go back

; END OF reset
