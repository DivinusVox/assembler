.int 1
.int -1
foo .int -2
.byt 'a'
bar .byt 'n'
;R1 .int -6
;r1 .byte 'z'
;ADD .int 333

LDR r1 foo
ADD r1 #2
TRP 1
