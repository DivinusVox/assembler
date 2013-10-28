; declare variables
a1 	.INT 	1
a2	.INT	2
a3	.INT	3
a4	.INT	4
a5	.INT	5
a6	.INT	6
b1	.INT 	300
b2	.INT	150
b3	.INT	50
b4	.INT	20
b5	.INT	10
b6	.INT	5
c1	.INT	500
c2	.INT	2
c3	.INT	5
c4	.INT	10
; Name declaration
n1 		.BYT	'C'
n2 		.BYT	'o'
n3 		.BYT	'l'
n4 		.BYT	'e'
n5 		.BYT	','
n6 		.BYT	' '
n7	 	.BYT	'K'
n8	 	.BYT	'a'
n9	 	.BYT	'c'
n10 	.BYT	'e'
n11 	.BYT	'y'
; Extras
line	.BYT	'\n'
blank	.BYT	' '

; Driver
;print name
LDB	r0	n1
TRP	3
LDB	r0	n2
TRP	3
LDB	r0	n3
TRP	3
LDB	r0	n4
TRP	3
LDB	r0	n5
TRP	3
LDB	r0	n6
TRP	3
LDB	r0	n7
TRP	3
LDB	r0	n8
TRP	3
LDB	r0	n9
TRP	3
LDB	r0	n10
TRP	3
LDB	r0	n11
TRP	3
LDB	r0	line
TRP	3
;print blank line
TRP	3

;add all elements of b
;	print each step, place 2 spaces between each print.
LDR	r2	b1
LDR	r3	b2
ADD	r2	r3
MOV r0	r2
TRP	1	; print value
LDB	r0	blank
TRP	3	; space
TRP	3	; space

LDR	r3	b3
ADD	r2	r3
MOV r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

LDR	r3	b4
ADD	r2	r3
MOV r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

LDR	r3	b5
ADD	r2	r3
MOV r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

LDR	r3	b6
ADD	r2	r3
MOV r0	r2
TRP	1
;Save this value for later
MOV	r5	r2

LDB	r0	line	;end the line
TRP	3
;print blank line
TRP 3

;Multiply all elements of a
;	print each step, place 2 spaces between each print.
LDR	r2	a1
LDR	r3	a2
MUL	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

LDR	r3	a3
MUL	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

LDR	r3	a4
MUL	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

LDR	r3	a5
MUL	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

LDR	r3	a6
MUL	r2	r3
MOV	r0	r2
TRP	1
; Save value for later
MOV	r6	r2

LDB	r0	line	;end the line
TRP	3
;print blank line
TRP 3

;Divide the final result from sum(b) by each element in b - non cumulative.
;	print each result, place 2 spaces between each print.
MOV r2	r5
LDR	r3	b1
DIV	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

MOV r2	r5
LDR	r3	b2
DIV	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

MOV r2	r5
LDR	r3	b3
DIV	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

MOV r2	r5
LDR	r3	b4
DIV	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

MOV r2	r5
LDR	r3	b5
DIV	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP 3
TRP 3

MOV r2	r5
LDR	r3	b6
DIV	r2	r3
MOV	r0	r2
TRP	1

LDB	r0	line	;end the line
TRP	3
;print blank line
TRP 3

;Subtract from the final result of mul(a) each element of c - non cumulative.
;	print each result, place 2 spaces between each print.
MOV r2	r6
LDR	r3	c1
SUB	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

MOV r2	r6
LDR	r3	c2
SUB	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

MOV r2	r6
LDR	r3	c3
SUB	r2	r3
MOV	r0	r2
TRP	1
LDB	r0	blank
TRP	3
TRP	3

MOV r2	r6
LDR	r3	c4
SUB	r2	r3
MOV	r0	r2
TRP	1
LDB r0  line
TRP 3

TRP 0
