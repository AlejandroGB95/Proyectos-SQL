SQL> Drop table ALUM0405;

Table dropped.

SQL> 
SQL> create table ALUM0405(
  2  DNI VARCHAR2(10) NOT NULL,
  3  NOMBRE VARCHAR2(15) NOT NULL,
  4  APELLIDOS VARCHAR2(20) NOT NULL,
  5  FECHA_NAC DATE,
  6  DIRECCION VARCHAR2(20),
  7  POBLACION VARCHAR2(20),
  8  PROVINCIA VARCHAR2(20),
  9  CURSO NUMBER(2)  NOT NULL,
 10  NIVEL VARCHAR2(10)  NOT NULL,
 11  CLASE CHAR(1)  NOT NULL,
 12  FALTAS1 NUMBER(2),
 13  FALTAS2 NUMBER(2),
 14  FALTAS3 NUMBER(2)
 15  );

Table created.

SQL> 
SQL> INSERT INTO ALUM0405 VALUES ('34448974N', 'CONCHA', 'ESTRUCH VIDAL',TO_DATE('10/11/1985'),
  2  'C/ MEDICO FELIX, 12','BERROCALEJO', 'CACERES',2,'DAI','A',0,0,0);

1 row created.

SQL> 
SQL> INSERT INTO ALUM0405 VALUES ('34448999N', 'DORA', 'MARTIN BRE¥A',TO_DATE('10/11/1994'),
  2  'C/ MEDICO FELIX, 10','BERROCALEJO', 'CACERES',1,'ESO','C',0,0,0);

1 row created.

SQL> 
SQL>  COMMIT;

Commit complete.

SQL> 
SQL> select * from alum0405;

DNI        NOMBRE          APELLIDOS            FECHA_NA DIRECCION            POBLACION            PROVINCIA                 CURSO NIVEL      C    FALTAS1    FALTAS2    FALTAS3                                                                                                                                                                                                                                                                                                                                                                                                                                        
---------- --------------- -------------------- -------- -------------------- -------------------- -------------------- ---------- ---------- - ---------- ---------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                        
34448974N  CONCHA          ESTRUCH VIDAL        10/11/85 C/ MEDICO FELIX, 12  BERROCALEJO          CACERES                       2 DAI        A          0          0          0                                                                                                                                                                                                                                                                                                                                                                                                                                        
34448999N  DORA            MARTIN BRE¥A         10/11/94 C/ MEDICO FELIX, 10  BERROCALEJO          CACERES                       1 ESO        C          0          0          0                                                                                                                                                                                                                                                                                                                                                                                                                                        

SQL> select dni, nombre, apellidos, curso, nivel, clase from alum0405;

DNI        NOMBRE          APELLIDOS                 CURSO NIVEL      C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
---------- --------------- -------------------- ---------- ---------- -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448974N  CONCHA          ESTRUCH VIDAL                 2 DAI        A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448999N  DORA            MARTIN BRE¥A                  1 ESO        C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

SQL> select * from alum0405 where poblacion = 'GUADALAJARA';

no rows selected

SQL> select nombre, apellidos from alum0405 where poblacion = 'GUADALAJARA';

no rows selected

SQL> select dni, nombre, apellidos, curso, nivel, clase from alum0405 order by apellidos asc, nombre asc;

DNI        NOMBRE          APELLIDOS                 CURSO NIVEL      C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
---------- --------------- -------------------- ---------- ---------- -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448974N  CONCHA          ESTRUCH VIDAL                 2 DAI        A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448999N  DORA            MARTIN BRE¥A                  1 ESO        C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

SQL> select dni, nombre, apellidos, curso, nivel, clase from alum0405 order by apellidos desc, nombre desc;

DNI        NOMBRE          APELLIDOS                 CURSO NIVEL      C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
---------- --------------- -------------------- ---------- ---------- -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448999N  DORA            MARTIN BRE¥A                  1 ESO        C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
34448974N  CONCHA          ESTRUCH VIDAL                 2 DAI        A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

SQL> spool off;
