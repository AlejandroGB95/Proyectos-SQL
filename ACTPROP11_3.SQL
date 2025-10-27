SQL> 
SQL> DECLARE
  2    CURSOR c_depart IS
  3        SELECT DNOMBRE,COUNT (EMP_NO) NUMEMPLE
  4        FROM DEPART, EMPLE
  5        WHERE DEPART.DEPT_NO = EMPLE.DEPT_NO
  6        GROUP BY DEPART.DEPT_NO, DNOMBRE;
  7  
  8    TYPE TR_DEPTO IS RECORD (
  9       NOMBREDEPT DEPART.DNOMBRE%TYPE,
 10       NUMEMPLE INTEGER
 11       );
 12     TYPE TV_DEPTO IS TABLE OF TR_DEPTO;
 13     VA_DEPARTAMENTOS TV_DEPTO := TV_DEPTO ();
 14     n INTEGER := 0;
 15  BEGIN
 16  
 17     FOR VC IN C_DEPART LOOP
 18        N:= C_DEPART%ROWCOUNT;
 19        VA_DEPARTAMENTOS.EXTEND;
 20        VA_DEPARTAMENTOS(N) := VC;
 21     END LOOP;
 22  
 23     FOR I IN 1..N LOOP
 24      DBMS_OUTPUT.PUT_LINE('* Dnombre: '||VA_DEPARTAMENTOS(I).NOMBREDEPT||' N§ Empleados: '||va_departamentos(i).numemple);
 25     END LOOP;
 26  END;
 27  /
* Dnombre: VENTAS N§ Empleados: 6                                               
* Dnombre: CONTABILIDAD N§ Empleados: 3                                         
* Dnombre: INVESTIGACION N§ Empleados: 5                                        

PL/SQL procedure successfully completed.

SQL> SPOOL OFF
