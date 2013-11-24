zero     .int    0
line    .byt    '\n'

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
main    LDA     r1  num
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
        TRP     2
        TRP     1
        ; fact(r0)
        MOV     r5  sp      ; Calculate record size
        ADI     r5  #-12    ; 1 int, pfp, return add
        CMP     r5  st      ; Check for overflow
        BLT     r5  odie

end     LDB     r0  line
        TRP     3
        TRP     0
; END main

; START int fact(int)
;fact    

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
