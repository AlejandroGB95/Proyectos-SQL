SQL> SELECT SYSDATE FROM DUAL;

SYSDATE                                                                                                                                               
----------                                                                                                                                            
01/02/2022                                                                                                                                            

SQL> select fecha_alt,add_months(fecha_alt,12) from emple where dept_no=10;

FECHA_ALT  ADD_MONTHS                                                                                                                                 
---------- ----------                                                                                                                                 
09/06/1991 09/06/1992                                                                                                                                 
17/11/1991 17/11/1992                                                                                                                                 
23/01/1992 23/01/1993                                                                                                                                 

SQL> select fecha_alt,last_day(fecha_alt) from emple where dept_no=10;

FECHA_ALT  LAST_DAY(F                                                                                                                                 
---------- ----------                                                                                                                                 
09/06/1991 30/06/1991                                                                                                                                 
17/11/1991 30/11/1991                                                                                                                                 
23/01/1992 31/01/1992                                                                                                                                 

SQL> select trunc(months_between(sysdate,'18/11/1964')/12) "Edad actual" from dual;

Edad actual                                                                                                                                           
-----------                                                                                                                                           
         57                                                                                                                                           

SQL> select nex_day(sysdate, 'Jueves')"Sig. Jueves" from dual;
select nex_day(sysdate, 'Jueves')"Sig. Jueves" from dual
       *
ERROR at line 1:
ORA-00904: "NEX_DAY": invalid identifier 


SQL> select next_day(sysdate, 'Jueves')"Sig. Jueves" from dual;

Sig. Jueve                                                                                                                                            
----------                                                                                                                                            
03/02/2022                                                                                                                                            

SQL> spool off;
