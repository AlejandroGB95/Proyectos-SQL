SQL> desc depart;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPT_NO                                   NOT NULL NUMBER(2)
 DNOMBRE                                            VARCHAR2(14)
 LOC                                                VARCHAR2(14)

SQL> desc emple;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO                                    NOT NULL NUMBER(4)
 APELLIDO                                           VARCHAR2(10)
 OFICIO                                             VARCHAR2(10)
 DIR                                                NUMBER(4)
 FECHA_ALT                                          DATE
 SALARIO                                            NUMBER(7)
 COMISION                                           NUMBER(7)
 DEPT_NO                                   NOT NULL NUMBER(2)

SQL> select apellido, oficio, loc from emple, depart where emple.dept_no = emple.dept_no and oficio = 'ANALISTA';

APELLIDO   OFICIO     LOC                                                       
---------- ---------- --------------                                            
GIL        ANALISTA   SEVILLA                                                   
GIL        ANALISTA   MADRID                                                    
GIL        ANALISTA   BARCELONA                                                 
GIL        ANALISTA   BILBAO                                                    
FERNANDEZ  ANALISTA   SEVILLA                                                   
FERNANDEZ  ANALISTA   MADRID                                                    
FERNANDEZ  ANALISTA   BARCELONA                                                 
FERNANDEZ  ANALISTA   BILBAO                                                    

8 rows selected.

SQL> spool off;
