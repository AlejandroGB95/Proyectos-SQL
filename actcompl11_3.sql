SQL> CREATE VIEW DEPARTAM AS
SELECT DEPART.DEPT_NO, DNOMBRE, LOC, COUNT(EMP_NO) TOT_EMPLE
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO (+) = DEPART.DEPT_NO
GROUP BY DEPART.DEPT_NO, DNOMBRE, LOC;

View created.

SQL> CREATE OR REPLACE TRIGGER ges_depart
  2  INSTEAD OF DELETE OR INSERT OR UPDATE
  3  ON DEPARTAM
  4  FOR EACH ROW
  5  -- Bienve, 1 de Mayo
  6  -- Crear un trigger para poder actualizar, insertar o borrar en la vista departam.
  7  BEGIN
  8  IF DELETING THEN
  9  DELETE FROM depart WHERE dept_no = :old.dept_no;
 10  ELSIF INSERTING THEN
 11     DECLARE
 12       V_DEPART DEPART.DEPT_NO%TYPE;
 13     BEGIN
 14       SELECT DEPT_NO INTO V_DEPART FROM DEPART WHERE DEPT_NO=NEW.DEPT_NO;
 15       DBMS_OUTPUT.PUT_LINE('EL DEPARTAMENTO '||V_DEPART||' YA EXISTE');
 16     EXCEPTION
 17       WHEN NO_DATA_FOUND THEN
 18        INSERT INTO depart VALUES(:new.dept_no, :new.dnombre, :new.loc);
 19     END;
 20  ELSIF UPDATING('loc') THEN
 21  UPDATE depart SET loc = :new.loc
 22  WHERE dept_no = :old.dept_no;
 23  ELSE
 24  RAISE_APPLICATION_ERROR
 25  (-20500,'Error en la modificacion de depart');
 26  END IF;
 27  END;
 28  /

Warning: Trigger created with compilation errors.

SQL> show errors
Errors for TRIGGER GES_DEPART:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
8/6      PL/SQL: SQL Statement ignored                                                                                                                
8/61     PL/SQL: ORA-00904: "NEW"."DEPT_NO": invalid identifier                                                                                       
SQL> CREATE OR REPLACE TRIGGER ges_depart
INSTEAD OF DELETE OR INSERT OR UPDATE
ON DEPARTAM
FOR EACH ROW
  -- Bienve, 1 de Mayo
  -- Crear un trigger para poder actualizar, insertar o borrar en la vista departam.
BEGIN
 IF DELETING THEN
    DELETE FROM depart WHERE dept_no = :old.dept_no;
 ELSIF INSERTING THEN   
    INSERT INTO depart VALUES(:new.dept_no, :new.dnombre, :new.loc);
 ELSIF UPDATING('loc') THEN
    UPDATE depart SET loc = :new.loc
    WHERE dept_no = :old.dept_no;
 ELSE
    RAISE_APPLICATION_ERROR
    (-20500,'Error en la modificacion de depart');
 END IF;
END;
/

Trigger created.

SQL> select * from departam;

   DEPT_NO DNOMBRE        LOC             TOT_EMPLE                                                                                                   
---------- -------------- -------------- ----------                                                                                                   
        20 INVESTIGACION  MADRID                  5                                                                                                   
        30 VENTAS         BARCELONA               6                                                                                                   
        10 CONTABILIDAD   SEVILLA                 3                                                                                                   
        40 PRODUCCION     BILBAO                  0                                                                                                   

SQL> 
SQL> insert into departam values (10,'RRHH',MµLAGA);
insert into departam values (10,'RRHH',MµLAGA)
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> select * from departam;

   DEPT_NO DNOMBRE        LOC             TOT_EMPLE                                                                                                   
---------- -------------- -------------- ----------                                                                                                   
        20 INVESTIGACION  MADRID                  5                                                                                                   
        30 VENTAS         BARCELONA               6                                                                                                   
        10 CONTABILIDAD   SEVILLA                 3                                                                                                   
        40 PRODUCCION     BILBAO                  0                                                                                                   

SQL> insert into departam values (60,'RRHH','MALAGA');
insert into departam values (50,'RRHH',MµLAGA)
            *
ERROR at line 1:
ORA-00947: not enough values 


SQL> 
SQL> delete from departam where dept_no=50;

0 rows deleted.

SQL> update departam set loc='RONDA' where dept_no = 50;

0 rows updated.

SQL> update departam set loc='MALAGA' where dept_no = 50;

0 rows updated.

SQL> update departam set loc='MALAGA' where dept_no = 10;

1 row updated.

SQL> select * from departam;

   DEPT_NO DNOMBRE        LOC             TOT_EMPLE                                                                                                   
---------- -------------- -------------- ----------                                                                                                   
        20 INVESTIGACION  MADRID                  5                                                                                                   
        30 VENTAS         BARCELONA               6                                                                                                   
        10 CONTABILIDAD   MALAGA                  3                                                                                                   
        40 PRODUCCION     BILBAO                  0                                                                                                   

SQL> rollback;

Rollback complete.

SQL> delete from departam where dept_no=20;

1 row deleted.

SQL> select * from departam;

   DEPT_NO DNOMBRE        LOC             TOT_EMPLE                                                                                                   
---------- -------------- -------------- ----------                                                                                                   
        30 VENTAS         BARCELONA               6                                                                                                   
        10 CONTABILIDAD   SEVILLA                 3                                                                                                   
        40 PRODUCCION     BILBAO                  0                                                                                                   

SQL> rollback;

Rollback complete.

CREATE OR REPLACE TRIGGER ges_depart
  2  INSTEAD OF DELETE OR INSERT OR UPDATE
  3  ON DEPARTAM
  4  FOR EACH ROW
  5    -- Bienve, 1 de Mayo
  6    -- Crear un trigger para poder actualizar, insertar o borrar en la vista departam.
  7  BEGIN
  8   IF DELETING THEN
  9      DELETE FROM depart WHERE dept_no = :old.dept_no;
 10   ELSIF INSERTING THEN
 11      INSERT INTO depart VALUES(:new.dept_no, :new.dnombre, :new.loc);
 12   ELSIF UPDATING('loc') THEN
 13      UPDATE depart SET loc = :new.loc
 14      WHERE dept_no = :old.dept_no;
 15   ELSE
 16      RAISE_APPLICATION_ERROR
 17      (-20500,'Error en la modificacion de depart');
 18   END IF;
 19  END;
 20  /

Trigger created.

SQL> select * from departam
  2  ;

   DEPT_NO DNOMBRE        LOC             TOT_EMPLE
---------- -------------- -------------- ----------
        20 INVESTIGACION  MADRID                  5
        30 VENTAS         BARCELONA               6
        50 MARKETING      MALAGA                  0
        10 CONTABILIDAD   SEVILLA                 3
        40 PRODUCCION     BILBAO                  0

SQL> insert into departam (dept_no,dnombre,loc) values (60,'RRHH','MALAGA');
insert into departam values (60,'RRHH','MALAGA')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL>




SQL> spool off
