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

        LDR     r9  SIZE ; init loop variables
        LDR     r8  i
        LDR     r7  sum
        LDR     r6  result
START1  MOV     r3  r8 ; copy i to test against 
        CMP     r3  r9 ; compare i to SIZE
        BLT     r3  PART1 ; if i still < SIZE
        JMP     END1 ; break out if not
PART1   ADD     r8  #1
        MOV     r0, r8
        TRP     1
        JMP     START1
        ; sum(r7) += arr[i]
        ; result = arr[i] % 2;
        ; if result is 0: print arr[i] is even\n
        ; else: print arr[i] is odd\n
        ; increment i (r8)
END1

