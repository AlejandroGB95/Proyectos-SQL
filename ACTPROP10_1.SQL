SQL> DECLARE
  2     CURSOR C1 IS
  3     SELECT APELLIDO FROM EMPLE WHERE DEPT_NO=20;
  4     V_APELLIDO VARCHAR2(10);
  5  BEGIN
  6     OPEN C1;
  7     FETCH C1 INTO V_APELLIDO;
  8     WHILE C1%FOUND LOOP
  9        DBMS_OUTPUT.PUT_LINE(TO_CHAR(C1%ROWCOUNT,'99.')||V_APELLIDO);
 10        FETCH C1 INTO V_APELLIDO;
 11     END LOOP;
 12     CLOSE C1;
 13  END;
 14  /
1.SANCHEZ                                                                                                                                             
2.JIMENEZ                                                                                                                                             
3.GIL                                                                                                                                                 
4.ALONSO                                                                                                                                              
5.FERNANDEZ                                                                                                                                           

PL/SQL procedure successfully completed.

SQL> SPOOL OFF
