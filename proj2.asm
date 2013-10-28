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

        # load size into R9
        # load i into R8
        # load sum into R7
        # load result into R6
PART1   # mv r3, r8
        # cmp r3, r9
        # bgt r3, END1
        # sum(r7) += arr[i]
        # result = arr[i] % 2;
        # if result is 0: print arr[i] is even\n
        # else: print arr[i] is odd\n
        # increment i (r8)
END1

