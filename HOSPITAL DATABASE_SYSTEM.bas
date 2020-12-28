' TO MAKE A HOSPITAL DATABASE
MENUBAR:
DECLARE SUB ADDREC()
DECLARE SUB LOOK()
DECLARE SUB SEARCH()
DECLARE SUB DELETE()
DECLARE SUB EXITP()
WIDTH 80, 25
COLOR 10, 1
CLS
COLOR 10, 8
LOCATE 3, 10
PRINT STRING$(60, "X")
LOCATE 23, 10
PRINT STRING$(60, "X")
FOR FRAME = 3 TO 23
    LOCATE FRAME, 10
    PRINT "X"
    LOCATE FRAME, 70
    PRINT "X"
NEXT
LOCATE 7, 11
PRINT STRING$(23, "X")
LOCATE 7, 48
PRINT STRING$(23, "X")
LOCATE 7, 34
COLOR 1, 8
PRINT "  ";
COLOR 11, 4
PRINT " MENU BAR ";
COLOR 1, 8
PRINT "  "
LOCATE 25, 16
COLOR 11, 8
PRINT " Designed & developed by Aditya Karki (copyright)"
topic$ = " HOSPITAL DATABASE MANAGEMENT "
FOR top = 1 TO LEN(topic$)
    r$ = MID$(topic$, top, 1)
    IF r$ = " " THEN ref = top + 1
    IF ref = top OR ref + 1 = top THEN
        LOCATE 4, 27 + top
        COLOR 11, 1
        PRINT r$
    ELSE
        LOCATE 4, 27 + top
        COLOR 11, 8
        PRINT r$
    END IF
NEXT
COLOR 10, 6
LOCATE 9, 25
COLOR 10, 8
PRINT " <> Choose an option <> "
j = 20
FOR i = 15 TO 9 STEP -1
    IF i = 15 OR i = 9 THEN
        COLOR 1, 4
        LOCATE 11, j
        PRINT SPACE$(5)
        LOCATE 17, j
        PRINT SPACE$(5)
        j = j + 5
    ELSE
        COLOR 17, i
        LOCATE 11, j
        PRINT SPACE$(5)
        LOCATE 17, j
        PRINT SPACE$(5)
        j = j + 5
    END IF
NEXT
COLOR 10, 4
LOCATE 12, 20
PRINT " 1) Add Records " + SPACE$(19)
LOCATE 13, 20
PRINT " 2) View All Records " + SPACE$(14)
LOCATE 14, 20
PRINT " 3) Search Records " + SPACE$(16)
LOCATE 15, 20
PRINT " 4) Delete Records " + SPACE$(16)
LOCATE 16, 20
PRINT " 5) Exit The Program " + SPACE$(14)
COLOR 10, 1
LOCATE 21, 44
PRINT STRING$(6, "=")
COLOR 10, 8
LOCATE 20, 16
INPUT " OPTION 1 / 2 / 3 / 4 / 5  "; N
SELECT CASE N
    CASE 1
        CALL ADDREC
    CASE 2
        CALL LOOK
    CASE 3
        CALL SEARCH
    CASE 4
        CALL DELETE
    CASE 5
        CALL EXITP
    CASE ELSE
        COLOR 2, 4
        CLS
        COLOR 11, 8
        k = 21: j = 20: r = 40
        FOR i = 1 TO 9
            LOCATE i, j
            PRINT "\"
            LOCATE i, r
            PRINT "/"
            LOCATE k, j
            PRINT "/"
            LOCATE k, r
            PRINT "\"
            k = k - 1: j = j + 1: r = r - 1
        NEXT
        LOCATE 11, 22: PRINT "  WRONG  CHOOSE  "
        COLOR 10, 8
        LOCATE 11, 45
        PRINT " CHOOSE NEXT NUMBER ONCE MORE ! "
        LOCATE 24, 37
        LINE INPUT " <<< Press any key to continue >>> "; ASD$
        GOTO MENUBAR
END SELECT
SUB ADDREC
    OPEN "Hospital.dat" FOR APPEND AS #1
    COLOR 10, 4
    CLS
    COLOR 11, 8
    LOCATE 3, 30
    PRINT " HOSPITAL's PROFILE "
    LOCATE 4, 1
    PRINT STRING$(80, "-")
    LOCATE 22, 1
    PRINT STRING$(80, "-")
    COLOR 10, 8
    LOCATE 8, 15
    PRINT "|"
    LOCATE 8, 17
    PRINT " S.N "
    LOCATE 8, 23
    PRINT "|"
    LOCATE 8, 25
    PRINT "HOSPITAL's_NAME"
    LOCATE 8, 40
    PRINT "|"
    LOCATE 8, 42
    PRINT "CODE"
    LOCATE 8, 49
    PRINT "|"
    LOCATE 8, 51
    PRINT "NO OF BEDS"
    LOCATE 8, 64
    PRINT "|"
    LOCATE 8, 66
    PRINT "ADDRESS"
    LOCATE 8, 79
    PRINT "|"
    COLOR 10, 4
    LOCATE 7, 15
    PRINT STRING$(65, "_")
    LOCATE 9, 15
    PRINT STRING$(65, "_")
    COLOR 10, 8
    UP:
    LOCATE 23, 25
    PRINT STRING$(35, " ")
    K = K + 1
    LOCATE 9 + K, 15
    PRINT "|"
    LOCATE 9 + K, 23
    PRINT "|"
    LOCATE 9 + K, 40
    PRINT "|"
    LOCATE 9 + K, 49
    PRINT "|"
    LOCATE 9 + K, 64
    PRINT "|"
    LOCATE 9 + K, 79
    PRINT "|"
    LOCATE 9 + K, 17
    PRINT K; ")"
    LOCATE 9 + K, 25
    INPUT N$
    LOCATE 9 + K, 42
    INPUT H$
    LOCATE 9 + K, 51
    INPUT B
    LOCATE 9 + K, 66
    INPUT AD$
    WRITE #1, N$, H$, B, AD$
    LOCATE 23, 25
    INPUT " DO YOU HAVE ANY OTHER RECORDS"; CH$
    IF UCASE$(LEFT$(CH$, 1)) = "Y" THEN GOTO UP
    COLOR 10, 4
    LOCATE 10 + K, 15
    PRINT STRING$(65, "_")
    CLOSE #1
END SUB
SUB LOOK
    OPEN "A", #1, "Hospital.dat"
    CLOSE #1
    OPEN "Hospital.dat" FOR INPUT AS #1
    COLOR 10, 4
    CLS
    COLOR 11, 8
    LOCATE 3, 30
    PRINT " HOSPITAL's PROFILE "
    LOCATE 4, 1
    PRINT STRING$(80, "-")
    LOCATE 22, 1
    PRINT STRING$(80, "-")
    COLOR 10, 8
    LOCATE 8, 10
    PRINT "|"
    LOCATE 8, 12
    PRINT " S.N "
    LOCATE 8, 18
    PRINT "|"
    LOCATE 8, 20
    PRINT "HOSPITAL's_NAME"
    LOCATE 8, 35
    PRINT "|"
    LOCATE 8, 37
    PRINT "CODE"
    LOCATE 8, 44
    PRINT "|"
    LOCATE 8, 46
    PRINT "NO OF BEDS"
    LOCATE 8, 59
    PRINT "|"
    LOCATE 8, 61
    PRINT "ADDRESS"
    LOCATE 8, 74
    PRINT "|"
    COLOR 10, 4
    LOCATE 7, 10
    PRINT STRING$(65, "_")
    LOCATE 9, 10
    PRINT STRING$(65, "_")
    COLOR 10, 8
    WHILE NOT EOF(1)
        INPUT #1, N$, H$, B, AD$
        LOCATE 23, 25
        PRINT STRING$(33, " ")
        K = K + 1
        LOCATE 9 + K, 10
        PRINT "|"
        LOCATE 9 + K, 18
        PRINT "|"
        LOCATE 9 + K, 35
        PRINT "|"
        LOCATE 9 + K, 44
        PRINT "|"
        LOCATE 9 + K, 59
        PRINT "|"
        LOCATE 9 + K, 74
        PRINT "|"
        LOCATE 9 + K, 12
        PRINT K; ")"
        LOCATE 9 + K, 20
        PRINT N$
        LOCATE 9 + K, 37
        PRINT H$
        LOCATE 9 + K, 46
        PRINT B
        LOCATE 9 + K, 61
        PRINT AD$
    WEND
    COLOR 11
    LOCATE 23, 37
    PRINT " STATUS "
    COLOR 10, 4
    LOCATE K + 10, 10
    PRINT STRING$(65, "_")
    CLOSE #1
END SUB
SUB SEARCH
    OPEN "A", #1, "Hospital.dat"
    CLOSE #1
    OPEN "I", #1, "Hospital.dat"
    COLOR 10, 4
    CLS
    COLOR 11, 8
    LOCATE 3, 33
    PRINT "<><> SEARCH BAR <><>"
    LOCATE 23, 37
    PRINT " STATUS "
    LOCATE 4, 1
    PRINT STRING$(80, "-")
    LOCATE 22, 1
    PRINT STRING$(80, "-")
    LOCATE 6, 5
    LINE INPUT " << ENTER ADDRESS OF HOSPITAL YOU WANNA SEARCH >> "; F$
    COLOR 10, 8
    LOCATE 8, 10
    PRINT "|"
    LOCATE 8, 12
    PRINT " S.N "
    LOCATE 8, 18
    PRINT "|"
    LOCATE 8, 20
    PRINT "HOSPITAL's_NAME"
    LOCATE 8, 35
    PRINT "|"
    LOCATE 8, 37
    PRINT "CODE"
    LOCATE 8, 44
    PRINT "|"
    LOCATE 8, 46
    PRINT "NO OF BEDS"
    LOCATE 8, 59
    PRINT "|"
    LOCATE 8, 61
    PRINT "ADDRESS"
    LOCATE 8, 74
    PRINT "|"
    COLOR 10, 4
    LOCATE 7, 10
    PRINT STRING$(65, "_")
    LOCATE 9, 10
    PRINT STRING$(65, "_")
    COLOR 10, 8
    WHILE NOT EOF(1)
        INPUT #1, N$, H$, B, AD$
        IF LCASE$(F$) = LCASE$(AD$) THEN
            K = K + 1
            IF K = 1 THEN
                LOCATE 9 + K, 20
                PRINT "<< YOUR RECORD FOUND >>"
                K = K + 1: m = 1
            END IF
            LOCATE 9 + K, 10
            PRINT "|"
            LOCATE 9 + K, 18
            PRINT "|"
            LOCATE 9 + K, 35
            PRINT "|"
            LOCATE 9 + K, 44
            PRINT "|"
            LOCATE 9 + K, 59
            PRINT "|"
            LOCATE 9 + K, 74
            PRINT "|"
            LOCATE 9 + K, 12
            PRINT K - m; ")"
            LOCATE 9 + K, 20
            PRINT N$
            LOCATE 9 + K, 37
            PRINT H$
            LOCATE 9 + K, 46
            PRINT B
            LOCATE 9 + K, 61
            PRINT AD$
        END IF
    WEND
    IF K = 0 THEN
        LOCATE 10, 20
        PRINT " NO ANY RECORDS WITH ADDRESS AS '"; UCASE$(F$); "' FOUND "
        COLOR 10, 4
        LOCATE 11, 10
        PRINT STRING$(65, "_")
    ELSE
        COLOR 10, 4
        LOCATE K + 10, 10
        PRINT STRING$(65, "_")
    END IF
    CLOSE #1
END SUB
SUB DELETE
    OPEN "A", #1, "Hospital.dat"
    CLOSE #1
    OPEN "I", #1, "Hospital.dat"
    OPEN "O", #5, "Reference.dat"
    COLOR 10, 4
    CLS
    COLOR 11, 8
    LOCATE 3, 33
    PRINT "<><> DELETE TAB <><>"
    LOCATE 23, 37
    PRINT " STATUS "
    LOCATE 4, 1
    PRINT STRING$(80, "-")
    LOCATE 22, 1
    PRINT STRING$(80, "-")
    LOCATE 6, 3
    INPUT " ENTER THE NO. of beds OF THE HOSPITAL YOU WANT TO DELETE  "; D
    COLOR 10, 4
    WHILE NOT EOF(1)
        INPUT #1, N$, H$, B, AD$
        K = K + 1
        IF B <> D THEN
            WRITE #5, N$, H$, B, AD$
            LOCATE K + 10, 25
            PRINT "---- / -------- / ------- / ------"
        ELSE
            C = 1
            LOCATE K + 10, 25
            PRINT " <<<<<<<<< RECORD FOUND >>>>>>>>> ":
        END IF
    WEND
    COLOR 11, 8
    IF C = 1 THEN
        LOCATE 20, 25
        PRINT "<<< RECORD(s)  successfully DELETED >>>"
    ELSE
        LOCATE 20, 25
        PRINT " <<< OOPS !! no records FOUND >>> "
    END IF
    CLOSE #1, 5
    KILL "Hospital.dat"
    NAME "Reference.dat" AS "Hospital.dat"
END SUB
SUB EXITP
    COLOR 1, 1
    CLS
    COLOR 10, 8
    LOCATE 2, 1
    PRINT STRING$(23, "C")
    LOCATE 2, 23 + LEN("It was a pre-village being with you")
    PRINT STRING$(23, "C")
    LOCATE 20, 1
    PRINT STRING$(34, "C")
    LOCATE 20, 47
    PRINT STRING$(34, "C")
    LOCATE 4, 24
    COLOR 2, 8
    PRINT "It was a pre-village being with you"
    SLEEP 1
    COLOR 1, 11
    u = 40
    FOR m = 1 TO 10000000
    NEXT
    FOR i = 5 TO 10
        LOCATE i, u
        PRINT " "
        u = u - 2
        FOR m = 1 TO 10000000
        NEXT
    NEXT
    u = u + 4
    FOR i = 11 TO 15
        LOCATE i, u
        PRINT " "
        u = u + 2
        FOR m = 1 TO 10000000
        NEXT
    NEXT
    FOR k = 14 TO 10 STEP -1
        LOCATE k, u
        PRINT " "
        u = u + 2
        FOR m = 1 TO 10000000
        NEXT
    NEXT
    u = u - 4
    FOR k = 9 TO 5 STEP -1
        LOCATE k, u
        PRINT " "
        u = u - 2
        FOR m = 1 TO 10000000
        NEXT
    NEXT
    LOCATE 10, 31
    COLOR 11, 8
    PRINT "  Thanks for visit"
    LOCATE 18, 25
    COLOR 3, 8
    PRINT " Goodbye and have a good day! "
    COLOR 10, 8
    LOCATE 20, 36
    PRINT " THE END "
END SUB


