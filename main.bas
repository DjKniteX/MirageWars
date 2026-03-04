1 REM MIRAGE WARS - CYBERPUNK EDITION
2 REM BY NIKKI X // HTTPS://NIKKIX.ME
3 REM Of NSXplus

5 PRINT CHR$(147)
6 POKE 53280,0 : REM border black
7 POKE 53281,0 : REM background black
8 POKE 646,1   : REM text white
9 gosub 1000 : rem go to title screen

10 DIM Q(5)   : REM quantity of each source
12 DIM P(5)   : REM price of each source
13 DIM S$(5)  : REM source names

14 S$(1) = "MIRAGE SOURCE"
15 S$(2) = "ELYSIUM SOURCE"
16 S$(3) = "KONFUZE SOURCE"
17 S$(4) = "PLAYERWORLDS"
18 S$(5) = "TOTAL ECLIPSE SOURCE"

20 M = 1000       : REM starting money
30 D = 1          : REM current day
40 MAXDAYS = 0   : REM game length

50 PRINT CHR$(147)                  : REM clear screen
51 POKE 53280,0                      : REM border black
52 POKE 53281,0                      : REM background black
53 POKE 646,7                         : REM text color white

54 PRINT "-------------------------------------"
55 PRINT "     WELCOME TO MIRAGE WARS - Prologue      "
56 PRINT "-------------------------------------"
57 print
58 print "Goal: Sell enough source codes before"
59 print "The X'lithan Agents finds you!"
60 print "----------------------"
61 print 
63 POKE 646,3                         : REM cyan for input
64 INPUT "ENTER YOUR NAME (PRESS ENTER FOR SIMON): "; N$
65 IF N$ = "" THEN N$ = "SIMON"
66 PRINT

90 REM --- Ask for number of days ---
91 INPUT "HOW MANY DAYS (15 OR 30)"; D$
92 IF D$ = "15" THEN MAXDAYS = 15 : GOTO 100
93 IF D$ = "30" THEN MAXDAYS = 30 : GOTO 100
94 PRINT "PLEASE ENTER 15 OR 30" 
95 GOTO 91

96 REM continue game
100 IF D > MAXDAYS THEN GOTO 900

110 REM --- Generate Prices ---
120 FOR I = 1 TO 5
130 P(I) = INT(RND(1)*100)+50
140 NEXT I

150 REM --- Display Status ---
160 PRINT CHR$(147)
170 PRINT "=============================="
171 POKE 646,7  : REM yellow for status
172 PRINT N$;" - DAY ";D;"  MONEY:$";M
173 PRINT "------------------------------"
174 POKE 646,3  : REM cyan for prices
175 FOR I = 1 TO 5
176 PRINT S$(I);" QTY:";Q(I);" PRICE:";P(I)
177 NEXT I
178 PRINT "------------------------------"

180 POKE 646,5  : REM green for menu
190 PRINT "WHAT DO YOU WANT TO DO?"
200 PRINT "1 - BUY"
210 PRINT "2 - SELL"
220 PRINT "3 - NEXT DAY"
230 INPUT C$

231 C = INT(VAL(C$))
232 IF C = 1 THEN GOSUB 500
233 IF C = 2 THEN GOSUB 600
234 IF C = 3 THEN D = D + 1 : GOSUB 800 : GOSUB 750 : GOTO 100
235 GOTO 100

500 REM ----- BUY SECTION -----
510 POKE 646,5
515 PRINT CHR$(147)
520 PRINT "WHICH TECH DO YOU WANT TO ACQUIRE (1-5)?"
525 FOR I = 1 TO 5
526 PRINT I;" - ";S$(I)
527 NEXT I


528 INPUT X$ : X = INT(VAL(X$))
529 IF X < 1 OR X > 5 THEN PRINT "INVALID CHOICE!" : INPUT "PRESS ENTER";A$ : RETURN

530 PRINT "HOW MANY UNITS?"
540 INPUT Y$ : Y = INT(VAL(Y$))
541 IF Y < 1 THEN PRINT "INVALID AMOUNT!" : INPUT "PRESS ENTER";A$ : RETURN

550 TP = P(X)
551 TC = Y * TP
555 IF TC > M THEN POKE 646,2 : PRINT "NOT ENOUGH MONEY!" : INPUT "PRESS ENTER";A$ : RETURN

560 M = M - TC
570 Q(X) = Q(X) + Y
580 POKE 646,1
590 PRINT N$;" ACQUIRED ";Y;" UNITS OF ";S$(X)
595 INPUT "PRESS ENTER";A$
596 RETURN

600 REM ----- SELL SECTION -----
610 POKE 646,5
615 PRINT CHR$(147)
620 PRINT "WHICH TECH DO YOU WANT TO SELL (1-5)?"
625 FOR I = 1 TO 5
626 PRINT I;" - ";S$(I)
627 NEXT I

628 INPUT X$ : X = INT(VAL(X$))
629 IF X < 1 OR X > 5 THEN PRINT "INVALID CHOICE!" : INPUT "PRESS ENTER";A$ : RETURN

630 PRINT "HOW MANY UNITS?"
640 INPUT Y$ : Y = INT(VAL(Y$))
641 IF Y < 1 THEN PRINT "INVALID AMOUNT!" : INPUT "PRESS ENTER";A$ : RETURN
645 IF Y > Q(X) THEN POKE 646,2 : PRINT "YOU DON'T HAVE THAT MUCH!" : INPUT "PRESS ENTER";A$ : RETURN

650 TP = P(X)
651 TC = Y * TP
655 M = M + TC
660 Q(X) = Q(X) - Y
670 POKE 646,1
680 PRINT N$;" SOLD ";Y;" UNITS OF ";S$(X)
685 INPUT "PRESS ENTER";A$
690 RETURN

750 REM ---- LOSS CHECK ----
755 if m > 0 then RETURN
760 tq = 0
765 for i = 1 to 5
770 tq = tq + q(i)
775 next i 
780 if tq > 0 then return
785 goto 920

800 REM ----  RANDOM EVENTS ----
805 R = int(rnd(1)*10) + 1
810 if r > 2 then 880
815 poke 646,2 
820 print chr$(147)
825 print "!!! X'LITHAN Agents detected!!!"
830 print "attempting evade sequence..."
835 for t = 1 to 2000 : next t 
840 e = int(rnd(1)*2) + 1
845 IF e = 1 then 870
850 loss = int(m/4)
855 m = m - loss
860 print "You were hit!"
865 print "You lost $";LOSS
866 input "press enter";A$
867 return
870 poke 646,5
875 print "You successfully evaded the agents!"
880 poke 646, 1
885 print chr$(147)
890 print "a normal day goes by...."
895 input "press enter";a$
896 return

900 REM ----- END GAME -----
910 POKE 646,7
915 PRINT CHR$(147)
920 PRINT "=============================="
930 PRINT "GAME OVER!"
935 IF D > MAXDAYS THEN PRINT "YOU EVADED THE X'LITHAN ORG!"
936 IF M = 0 THEN PRINT "YOU WERE CRUSHED BY X'LITHAN."
940 PRINT N$;" YOU ENDED WITH $";M
950 PRINT "THANKS FOR PLAYING MIRAGE WARS"
951 print "by yours truly nsxplus"
952 print "would you like to play again? (Y/N)"
953 input ng$
954 if ng$ = "Y" goto 50
955 if ng$ = "n" goto 960
956 if ng$ = "" goto 910
960 END

1000 REM ===== TITLE SCREEN =====
1005 PRINT CHR$(147)        : REM clear screen
1010 POKE 53280,0           : REM border black
1015 POKE 53281,0           : REM background black
1020 POKE 646,2             : REM text color green

1030 PRINT
1040 PRINT "        M I R A G E   W A R S"
1050 PRINT
1060 POKE 646,7             : REM white text
1070 PRINT "        BY NSXPLUS"
1071 print
1072 print "        https://nikkix.me"
1080 PRINT
1090 POKE 646,1             : REM cyan
1100 PRINT "--------------------------------------"
1120 POKE 646,5             : REM blinking prompt color
1121 print
1125 PRINT "        PRESS SPACE TO JACK IN"

1130 REM --- WAIT FOR SPACE ---
1135 GET A$
1140 IF A$ <> " " THEN 1135   : REM loop until player presses space

1145 PRINT CHR$(147)          : REM clear screen before narrative

1150 REM --- SLOW DRAMATIC TEXT ---
1155 POKE 646,3               : REM text color for narrative

1160 PRINT "THE FUTURE IS NEAR."
1165 FOR T = 1 TO 1500 : NEXT T
1166 print

1170 PRINT "CORPORATIONS RULE THE STREETS."
1175 FOR T = 1 TO 1500 : NEXT T
1187 print

1180 PRINT "DATA IS THE ONLY CURRENCY."
1185 FOR T = 1 TO 1500 : NEXT T
1186 print

1190 POKE 646,2 : PRINT "The X'LITHAN ORGANIZATION Controls"
1191 print
1290 poke 646,3
1291 print "all digital flow"
1195 FOR T = 1 TO 1500 : NEXT T
1196 print

1200 PRINT "THEY ARE WATCHING."
1205 FOR T = 1 TO 1500 : NEXT T
1206 print

1210 PRINT "YOU ARE A SOURCE RUNNER."
1215 FOR T = 1 TO 1500 : NEXT T
1216 print

1220 PRINT "BUY LOW. SELL HIGH."
1225 FOR T = 1 TO 1500 : NEXT T
1226 print

1230 PRINT "SURVIVE 15 or 30 days"
1235 FOR T = 1 TO 1500 : NEXT T
1236 print

1240 REM --- FINAL PROMPT ---
1245 POKE 646,5
1250 PRINT
1255 INPUT "PRESS ENTER TO START";A$

1260 RETURN   : REM back to main game loop