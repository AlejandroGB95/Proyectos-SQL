


SQL> DECLARE
  2      CURSOR c_depar IS
  3        SELECT DEPART.DEPT_NO, DNOMBRE, COUNT(EMP_NO) NUMEMPLE FROM DEPART,EMPLE
  4        WHERE DEPART.DEPT_NO = EMPLE.DEPT_NO
  5        GROUP BY DEPART.DEPT_NO, DNOMBRE;
  6  
  7      TYPE tr_depto  IS RECORD (
  8         nombredep depart.dnombre%TYPE,
  9         numemple INTEGER);
 10      TYPE ti_depto IS TABLE OF tr_depto INDEX BY PLS_INTEGER;
 11      va_departamentos ti_depto;
 12      n PLS_INTEGER :=0;
 13  BEGIN
 14     FOR vc IN c_depar LOOP
 15         va_departamentos (vc.dept_no).nombredeP := vc.dnombre;
 16         va_departamentos (vc.dept_no).numemple := vc.NUMEMPLE;
 17     END LOOP;
 18  
 19     n:=  va_departamentos.FIRST;
 20     WHILE va_departamentos.EXISTS(n) LOOP
 21       DBMS_OUTPUT.PUT_LINE ('* Dep No. : '||n||
 22                             ' Dnombre: '||va_departamentos(n).nombredep||
 23                             ' No. Empleados: '|| va_departamentos(n).numemple);
 24       n:=va_departamentos.next(n);
 25     END LOOP;
 26  END;
 27  /
* Dep No. : 10 Dnombre: CONTABILIDAD No. Empleados: 3                                                                                                 
* Dep No. : 20 Dnombre: INVESTIGACION No. Empleados: 5                                                                                                
* Dep No. : 30 Dnombre: VENTAS No. Empleados: 6                                                                                                       

PL/SQL procedure successfully completed.

SQL> SPOOL OFF
