******************************************************************
      * Author: FRANK GLASER
      * Date: 02/02/2021
      * Purpose: THIS PROGRAM ACCEPTS USER INPUT AND CALCULATES EITHER
      *          PERMUTATIONS OR COMBINATIONS OF INPUT.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMBINATIONS-PERMUTATIONS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 CHOICE-MATTER PIC X(3).
           01 CHOICES PIC 9(5).
           01 CHOSEN PIC 9(5).
           01 CHOICES-CHOSEN PIC 9(5)V9(3).
           01 INDX PIC 9(5).
           01 PERMUTATION PIC 9(35).
           01 PERMUTATION-FORMATTED PIC Z(35).
           01 CHOSEN-FACTORIAL PIC 9(35).
           01 COMBINATION PIC 9(35).
           01 COMBINATION-FORMATTED PIC Z(35).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "DOES CHOICE ORDER MATTER?".
           ACCEPT CHOICE-MATTER.
           DISPLAY "ENTER TOTAL ITEMS:".
           ACCEPT CHOICES.
           DISPLAY "ENTER TOTAL ITEMS PICKED:"
           ACCEPT CHOSEN.
           COMPUTE CHOICES-CHOSEN = CHOICES - CHOSEN.
           SET INDX TO CHOSEN.
           SUBTRACT 1 FROM INDX.
           SET PERMUTATION TO CHOICES.
           SUBTRACT 1 FROM CHOICES.
           PERFORM CHOICES-CHOSEN-PROCEDURE UNTIL INDX = 0.
           SET INDX TO CHOSEN.
           SUBTRACT 1 FROM INDX.
           SET CHOSEN-FACTORIAL TO CHOSEN.
           PERFORM CHOSEN-PROCEDURE UNTIL INDX = 0.
           IF CHOICE-MATTER = "YES" OR CHOICE-MATTER = "yes" THEN
               MOVE PERMUTATION TO PERMUTATION-FORMATTED
               DISPLAY PERMUTATION-FORMATTED
           ELSE IF CHOICE-MATTER = "NO" OR CHOICE-MATTER = "no" THEN
               SET COMBINATION TO PERMUTATION
               DIVIDE CHOSEN-FACTORIAL INTO COMBINATION
               MOVE COMBINATION TO COMBINATION-FORMATTED
               DISPLAY COMBINATION-FORMATTED
           ELSE
               DISPLAY "INVALID ENTRY"
               PERFORM MAIN-PROCEDURE
           END-IF.
           STOP RUN.
       CHOICES-CHOSEN-PROCEDURE.
           MULTIPLY CHOICES BY PERMUTATION.
           SUBTRACT 1 FROM INDX.
           SUBTRACT 1 FROM CHOICES.
       CHOSEN-PROCEDURE.
           MULTIPLY INDX BY CHOSEN-FACTORIAL.
           SUBTRACT 1 FROM INDX.
       END PROGRAM COMBINATIONS-PERMUTATIONS.