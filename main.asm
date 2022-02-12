SCAN    RD      STDIN

        COMP    SPACE
        JEQ     SCAN
        COMP    ENTER
        JEQ     PRINT
        
        COMP    PLUS
        JEQ     CPLUS
        COMP    MINUS
        JEQ     CMINUS
        COMP    MUL
        JEQ     CMUL
        COMP    DIV 
        JEQ     CDIV
        J       NUM     

NUM     LDS     #3
        LDX     NINDEX
        SUB     ZERO
        STA     NUMBER,X

        ADDR    S,X
        STX     NINDEX
        J       SCAN

CPLUS   LDS     #3
        LDX     NINDEX
        LDL     ASCII

        SUBR    S,X

        LDT     NUMBER,X
        SUBR    S,X
        LDB     NUMBER,X
        ADDR    T,B
        SUBR    L,B
        
        STB     NUMBER,X

        ADDR    S,X

        STX     NINDEX 

        J       SCAN

CMINUS  LDS     #3
        LDX     NINDEX
        LDL     ASCII

        SUBR    S,X
        LDT     NUMBER,X
        SUBR    S,X
        LDB     NUMBER,X
        SUBR    T,B
        ADDR    L,B

        STB     NUMBER,X
        ADDR    S,X
        STX     NINDEX

        J       SCAN    

CMUL    LDS     #3
        LDX     NINDEX
        LDL     ASCII


        SUBR    S,X
        LDT     NUMBER,X
        SUBR    L,T

        SUBR    S,X
        LDB     NUMBER,X
        SUBR    L,B

        MULR    T,B
        ADDR    L,B 

        STB     NUMBER,X
        ADDR    S,X
        STX     NINDEX

        J       SCAN

CDIV    LDS     #3
        LDX     NINDEX
        LDL     ASCII

        SUBR    S,X
        LDT     NUMBER,X
        SUBR    L,T

        SUBR    S,X
        LDB     NUMBER,X
        SUBR    L,B

        DIVR    T,B
        ADDR    L,B

        STB     NUMBER,X
        ADDR    S,X
        STX     NINDEX
        JEQ     SCAN


PRINT   LDL     ASCII
        TD      STDOUT
        JEQ     PRINT
        LDX     ZERO
        LDA     NUMBER,X
        WD      STDOUT
        J       STOP

STOP    J       STOP

CINDEX  RESW    1
CHARAC  RESW    10
NINDEX  RESW    1
NUMBER  RESW    10

ASCII   WORD    48
ENTER   WORD    10
SPACE   WORD    32
ZERO    WORD    0
PLUS    WORD    43
MINUS   WORD    45
MUL     WORD    42
DIV     WORD    47

STDIN   BYTE    0
STDOUT  BYTE    1