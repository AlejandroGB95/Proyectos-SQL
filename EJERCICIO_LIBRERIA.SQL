SQL> DESC LIBRERIA
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TEMA                                      NOT NULL CHAR(15)
 ESTANTE                                            CHAR(1)
 EJEMPLARES                                         NUMBER(2)

SQL> SELECT * FROM LIBRERIA
  2  ;

TEMA            E EJEMPLARES                                                    
--------------- - ----------                                                    
INFORMATICA     A         15                                                    
ECONOMIA        A         10                                                    
DEPORTES        B          8                                                    
FILOSOFIA       C          7                                                    
DIBUJO          C         10                                                    
MEDICINA        C         16                                                    
BIOLOGIA        A         11                                                    
GEOLOGIA        D          7                                                    
SOCIEDAD        D          9                                                    
LABORES         B         20                                                    
JARDINERIA      E          6                                                    

11 rows selected.

SQL> CREATE OR REPLACE FUNCTION TEMA_EJEMPLARES (TEMA_ELEGIDO CHAR)
  RETURN NUMBER
AS
   --Bienve, 6/04/2022
   --Funci¢n para saber el numero de ejemplares de un tema dado por par metros
   v_tema libreria.tema%type;
   v_ejemplar libreria.ejemplares%type;
BEGIN
   select tema into v_tema from libreria where tema = tema_elegido;
   select ejemplares into v_ejemplar from libreria where tema = v_tema;
   return v_ejemplar;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20000,'ERROR, no hay datos');
   WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20000,'ERROR EN LA APLICACIàN');
END TEMA_EJEMPLARES;
/

Function created.

SQL> 
SQL> BEGIN
  2  DBMS_OUTPUT.PUT_LINE(TEMA_EJEMPLARES('DIBUJO'));
  3  END;
  4  /

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> 
SQL> BEGIN
DBMS_OUTPUT.PUT_LINE(TEMA_EJEMPLARES('DIBUJO'));
END;
/
10                                                                              

PL/SQL procedure successfully completed.

SQL> BEGIN
DBMS_OUTPUT.PUT_LINE(TEMA_EJEMPLARES('MATES'));
END;
/
BEGIN
*
ERROR at line 1:
ORA-20000: ERROR, no hay datos 
ORA-06512: at "DATOS.TEMA_EJEMPLARES", line 14 
ORA-06512: at line 2 


SQL> BEGIN
DBMS_OUTPUT.PUT_LINE(TEMA_EJEMPLARES);
END;
/
DBMS_OUTPUT.PUT_LINE(TEMA_EJEMPLARES);
                     *
ERROR at line 2:
ORA-06550: line 2, column 22: 
PLS-00306: wrong number or types of arguments in call to 'TEMA_EJEMPLARES' 
ORA-06550: line 2, column 1: 
PL/SQL: Statement ignored 


SQL> SPOOL OFF
