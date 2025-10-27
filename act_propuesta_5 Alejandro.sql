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

SQL> select apellido, oficio from emple where oficio = (select oficio from emple where apellido='JIMENEZ');

APELLIDO   OFICIO                                                               
---------- ----------                                                           
JIMENEZ    DIRECTOR                                                             
NEGRO      DIRECTOR                                                             
CEREZO     DIRECTOR                                                             

SQL> select apellido, oficio, salario from emple where dept_no = (select dept_no from emple where apellido='FERNANDEZ')
  2  and salario = (select salario from emple where apellido='FERNANDEZ');

APELLIDO   OFICIO        SALARIO                                                
---------- ---------- ----------                                                
GIL        ANALISTA         3000                                                
FERNANDEZ  ANALISTA         3000                                                

SQL> SPOOL OFF;
