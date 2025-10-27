SQL> ALTER SESSION SET NLS_DATE_LANGUAGE!=french;
ALTER SESSION SET NLS_DATE_LANGUAGE!=french
                                   *
ERROR at line 1:
ORA-00927: missing equal sign 


SQL> ALTER SESSION SET NLS_DATE_LANGUAGE=french;

Session altered.

SQL> SELECT TO_CHAR(SYSDATE,'DAY ","mm" , "MONTH yyyy') FROM DUAL;

TO_CHAR(SYSDATE,'DAY","MM","MONTHYYYY')                                                                                                               
--------------------------------------------------------------------------------                                                                      
MERCREDI ,03 , MARS      2022                                                                                                                         

SQL> SELECT TO_CHAR(SYSDATE,'DAY ","mm" , "MONTH yyyy "USUARIO:"USER') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DAY ","mm" , "MONTH yyyy "USUARIO:"USER') FROM DUAL
                       *
ERROR at line 1:
ORA-01821: date format not recognized 


SQL> SELECT TO_CHAR(SYSDATE,'DAY ","mm" , "MONTH yyyy')||USER FROM DUAL;

TO_CHAR(SYSDATE,'DAY","MM","MONTHYYYY')||USER                                                                                                         
--------------------------------------------------------------------------------------------------------------                                        
MERCREDI ,03 , MARS      2022USUBIENVE                                                                                                                

SQL> SPOOL OFF
