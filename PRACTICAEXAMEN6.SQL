SQL> SELECT * FROM GRUPOS;

CODGRUPO        CURSO      L NIVEL                                                                                                                    
--------------- ---------- - --------------------                                                                                                     
1ESOB           1          B ESO                                                                                                                      
1ESOC           1          C ESO                                                                                                                      
1ESOA           1          A ESO                                                                                                                      
1ESOD           1          D ESO                                                                                                                      
2ESOA           2          1 ESO                                                                                                                      
1BSA            1          A BACH                                                                                                                     
1BCA            1          A BACH                                                                                                                     
1DAW            1          A CS                                                                                                                       
1GAA            1          A GM                                                                                                                       
2DAW            1          A CS                                                                                                                       

10 rows selected.

SQL> UPDATE FROM GRUPOS SET
  2  NIVEL = RTRIM(NIVEL,20,'*');
UPDATE FROM GRUPOS SET
       *
ERROR at line 1:
ORA-00903: invalid table name 


SQL> UPDATE GRUPOS SET
  2  NIVEL = RTRIM(NIVEL,20,'*');
NIVEL = RTRIM(NIVEL,20,'*')
        *
ERROR at line 2:
ORA-00939: too many arguments for function 


SQL> UPDATE GRUPOS SET
  2  NIVEL = RPAD(NIVEL,20,'*');

10 rows updated.

SQL> SELECT * FROM GRUPOS;

CODGRUPO        CURSO      L NIVEL                                                                                                                    
--------------- ---------- - --------------------                                                                                                     
1ESOB           1          B ESO*****************                                                                                                     
1ESOC           1          C ESO*****************                                                                                                     
1ESOA           1          A ESO*****************                                                                                                     
1ESOD           1          D ESO*****************                                                                                                     
2ESOA           2          1 ESO*****************                                                                                                     
1BSA            1          A BACH****************                                                                                                     
1BCA            1          A BACH****************                                                                                                     
1DAW            1          A CS******************                                                                                                     
1GAA            1          A GM******************                                                                                                     
2DAW            1          A CS******************                                                                                                     

10 rows selected.

SQL> SPOOL PRACTICAEXAMEN7.SQL
