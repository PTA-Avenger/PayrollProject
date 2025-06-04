
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PayrollProject.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO 'employee.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PAYROLL-FILE ASSIGN TO 'payroll.rep'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD EMPLOYEE-FILE.
       01 EMPLOYEE-RECORD.
           05 EMP-ID           PIC X(5).
           05 EMP-NAME         PIC X(20).
           05 EMP-HOURS        PIC 9(5).
           05 EMP-RATE         PIC 9(5).

       FD PAYROLL-FILE.
       01 PAYROLL-RECORD       PIC X(100).

       WORKING-STORAGE SECTION.

       01 EOF-FLAG             PIC X VALUE 'N'.
           88 END-OF-FILE      VALUE 'Y'.
           88 NOT-END-OF-FILE  VALUE 'N'.

       01 CALCULATIONS.
           05 GROSS-PAY        PIC 9(7)V99 VALUE 0.
           05 TAX              PIC 9(7)V99 VALUE 0.
           05 NET-PAY          PIC 9(7)V99 VALUE 0.

       01 TEMP-FIELDS.
           05 HRS-WORKED       PIC 9(5) VALUE 0.
           05 RATE-PER-HOUR    PIC 9(5) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT EMPLOYEE-FILE
                OUTPUT PAYROLL-FILE

           PERFORM UNTIL END-OF-FILE
               READ EMPLOYEE-FILE
                   AT END
                       SET END-OF-FILE TO TRUE
                   NOT AT END
                       PERFORM PROCESS-EMPLOYEE
               END-READ
           END-PERFORM

           CLOSE EMPLOYEE-FILE
                 PAYROLL-FILE

           STOP RUN.

       PROCESS-EMPLOYEE.
           MOVE FUNCTION NUMVAL(EMP-HOURS) TO HRS-WORKED
           MOVE FUNCTION NUMVAL(EMP-RATE) TO RATE-PER-HOUR

           COMPUTE GROSS-PAY = HRS-WORKED * RATE-PER-HOUR

           IF GROSS-PAY > 100000.00
               COMPUTE TAX = GROSS-PAY * 0.20
           ELSE
               COMPUTE TAX = GROSS-PAY * 0.10
           END-IF

           COMPUTE NET-PAY = GROSS-PAY - TAX

           STRING
               EMP-ID DELIMITED BY SIZE
               SPACE
               EMP-NAME DELIMITED BY SIZE
               SPACE
               "Hrs:" SPACE EMP-HOURS
               SPACE "Rate:" SPACE EMP-RATE
               SPACE "Gross:" SPACE GROSS-PAY
               SPACE "Tax:" SPACE TAX
               SPACE "Net:" SPACE NET-PAY
               INTO PAYROLL-RECORD

           WRITE PAYROLL-RECORD.
