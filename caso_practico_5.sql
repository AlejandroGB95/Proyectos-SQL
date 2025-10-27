SQL> select chr(75), chr(65) from dual;

C C                                                                             
- -                                                                             
K A                                                                             

SQL> select concat ('El apellido es: ',apellido) from emple;

CONCAT('ELAPELLIDOES:',APE                                                      
--------------------------                                                      
El apellido es: SANCHEZ                                                         
El apellido es: ARROYO                                                          
El apellido es: SALA                                                            
El apellido es: JIMENEZ                                                         
El apellido es: MARTIN                                                          
El apellido es: NEGRO                                                           
El apellido es: CEREZO                                                          
El apellido es: GIL                                                             
El apellido es: REY                                                             
El apellido es: TOVAR                                                           
El apellido es: ALONSO                                                          

CONCAT('ELAPELLIDOES:',APE                                                      
--------------------------                                                      
El apellido es: JIMENO                                                          
El apellido es: FERNANDEZ                                                       
El apellido es: MU¥OZ                                                           

14 rows selected.

SQL> select lower ('oRAcle Y sqL') "minuscula",upper ('oRAcle Y sqL') "MAYUSCULA", initcap ('oRAcle Y sql')"Tipo Titulo"
  2  from dual;

minuscula    MAYUSCULA    Tipo Titulo                                           
------------ ------------ ------------                                          
oracle y sql ORACLE Y SQL Oracle Y Sql                                          

SQL> select lpad(nombre_alumno,30,'.')"IZQUIERDA", RPAD(NOMBRE_ALUMNO,30,'.') "DERECHA" FROM NOTAS_ALUMNOS;

IZQUIERDA                                                                       
--------------------------------------------------------------------------------
DERECHA                                                                         
--------------------------------------------------------------------------------
......Alcalde Garc¡a, M. Luisa                                                  
Alcalde Garc¡a, M. Luisa......                                                  
                                                                                
...........Benito Mart¡n, Luis                                                  
Benito Mart¡n, Luis...........                                                  
                                                                                
........Casas Mart¡nez, Manuel                                                  
Casas Mart¡nez, Manuel........                                                  
                                                                                

IZQUIERDA                                                                       
--------------------------------------------------------------------------------
DERECHA                                                                         
--------------------------------------------------------------------------------
.......Corregidor S nchez, Ana                                                  
Corregidor S nchez, Ana.......                                                  
                                                                                
...........D¡az S nchez, Maria                                                  
D¡az S nchez, Maria...........                                                  
                                                                                

SQL> SELECT LTRIM('     HOLA')||RTRIM('    ADIOS   ')||'*' FROM DUAL;

LTRIM('HOLA')|                                                                  
--------------                                                                  
HOLA    ADIOS*                                                                  

SQL> SELECT * FROM MISTEXTOS;
SELECT * FROM MISTEXTOS
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> DROP TABLE NOMBRES cascade constraints;
DROP TABLE NOMBRES cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> CREATE TABLE NOMBRES
  2  (
  3    NOMBRE VARCHAR2(15),
  4    EDAD NUMBER(2)
  5  ) ;

Table created.

SQL> 
SQL> INSERT INTO NOMBRES VALUES('PEDRO', 17);

1 row created.

SQL> INSERT INTO NOMBRES VALUES('JUAN', 17);

1 row created.

SQL> INSERT INTO NOMBRES VALUES('MAR?A', 16);

1 row created.

SQL> INSERT INTO NOMBRES VALUES('CLARA', 14);

1 row created.

SQL> INSERT INTO NOMBRES VALUES(NULL, 15);

1 row created.

SQL> INSERT INTO NOMBRES VALUES(NULL, 18);

1 row created.

SQL> INSERT INTO NOMBRES VALUES('JES?S', NULL);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> DROP TABLE MISTEXTOS cascade constraints;
DROP TABLE MISTEXTOS cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> CREATE TABLE MISTEXTOS (
  2   TITULO  VARCHAR2(32),
  3   AUTOR   VARCHAR2(22),
  4   EDITORIAL VARCHAR2(15),
  5   PAGINA  NUMBER(3)
  6   ) ;

Table created.

SQL> 
SQL> INSERT INTO MISTEXTOS VALUES ('METODOLOG?A DE LA PROGRAMACI?N.', 'ALCALDE GARC?A', 'MCGRAWHILL',140);

1 row created.

SQL> INSERT INTO MISTEXTOS VALUES ('"INFORM?TICA B?SICA."', 'GARC?A GARCER?N', 'PARANINFO',130);

1 row created.

SQL> INSERT INTO MISTEXTOS VALUES ('SISTEMAS OPERATIVOS', 'GARC?A STRUCH', 'OBSBORNE',300);

1 row created.

SQL> INSERT INTO MISTEXTOS VALUES ('SISTEMAS DIGITALES.', 'RU?Z LOPEZ','PRENTICE HALL',190);

1 row created.

SQL> INSERT INTO MISTEXTOS VALUES ('"MANUAL DE C."', 'RU?Z LOPEZ', 'MCGRAWHILL',340);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> DROP TABLE LIBROS cascade constraints;
DROP TABLE LIBROS cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> CREATE TABLE LIBROS (
  2   TITULO  VARCHAR2(32),
  3   AUTOR   VARCHAR2(22),
  4   EDITORIAL VARCHAR2(15),
  5   PAGINA  NUMBER(3)
  6   ) ;

Table created.

SQL> 
SQL> INSERT INTO LIBROS VALUES ('LA COLMENA', 'CELA, CAMILO JOS?', 'PLANETA',240);

1 row created.

SQL> INSERT INTO LIBROS VALUES ('LA HISTORIA DE MI HIJO', 'GORDIMER, NADINE', 'TIEM.MODERNOS',327);

1 row created.

SQL> INSERT INTO LIBROS VALUES ('LA MIRADA DEL OTRO', 'G.DELGADO, FERNANDO', 'PLANETA',298);

1 row created.

SQL> INSERT INTO LIBROS VALUES ('?LTIMAS TARDES CON TERESA','MARSE, JUAN', 'C?RCULO',350);

1 row created.

SQL> INSERT INTO LIBROS VALUES ('LA NOVELA DE P. ANSUREZ',
  2  'TORRENTE B., GONZALO', 'PLANETA',162);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> DROP TABLE NACIMIENTOS cascade constraints;
DROP TABLE NACIMIENTOS cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

Session altered.

SQL> 
SQL> CREATE TABLE NACIMIENTOS (
  2   NOMBRE CHAR(15),
  3   APELLIDO CHAR(15),
  4   FECHANAC DATE,
  5   EDAD NUMBER
  6   ) ;

Table created.

SQL> 
SQL> 
SQL> INSERT INTO NACIMIENTOS VALUES ('PEDRO', 'S?NCHEZ','12/05/1982', 17);

1 row created.

SQL> INSERT INTO NACIMIENTOS VALUES ('JUAN', 'JIM?NEZ','23/08/1982', 17);

1 row created.

SQL> INSERT INTO NACIMIENTOS VALUES ('MAR?A', 'L?PEZ','02/02/1983', 16);

1 row created.

SQL> INSERT INTO NACIMIENTOS VALUES ('CLARA', 'LASECA','20/05/1985', 14);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM MISTEXTOS
  2  ;

TITULO                           AUTOR                  EDITORIAL               
-------------------------------- ---------------------- ---------------         
    PAGINA                                                                      
----------                                                                      
METODOLOG?A DE LA PROGRAMACI?N.  ALCALDE GARC?A         MCGRAWHILL              
       140                                                                      
                                                                                
"INFORM?TICA B?SICA."            GARC?A GARCER?N        PARANINFO               
       130                                                                      
                                                                                
SISTEMAS OPERATIVOS              GARC?A STRUCH          OBSBORNE                
       300                                                                      
                                                                                

TITULO                           AUTOR                  EDITORIAL               
-------------------------------- ---------------------- ---------------         
    PAGINA                                                                      
----------                                                                      
SISTEMAS DIGITALES.              RU?Z LOPEZ             PRENTICE HALL           
       190                                                                      
                                                                                
"MANUAL DE C."                   RU?Z LOPEZ             MCGRAWHILL              
       340                                                                      
                                                                                

SQL> SET LINESIZE 150
SQL> ;
  1  SELECT * FROM MISTEXTOS
  2* 
SQL> SELECT * FROM MISTEXTOS
  2  ;

TITULO                           AUTOR                  EDITORIAL           PAGINA                                                                    
-------------------------------- ---------------------- --------------- ----------                                                                    
METODOLOG?A DE LA PROGRAMACI?N.  ALCALDE GARC?A         MCGRAWHILL             140                                                                    
"INFORM?TICA B?SICA."            GARC?A GARCER?N        PARANINFO              130                                                                    
SISTEMAS OPERATIVOS              GARC?A STRUCH          OBSBORNE               300                                                                    
SISTEMAS DIGITALES.              RU?Z LOPEZ             PRENTICE HALL          190                                                                    
"MANUAL DE C."                   RU?Z LOPEZ             MCGRAWHILL             340                                                                    

SQL> SELECT RTRIM (TITULO, '."')FROM MISTEXTOS;

RTRIM(TITULO,'."')                                                                                                                                    
--------------------------------                                                                                                                      
METODOLOG?A DE LA PROGRAMACI?N                                                                                                                        
"INFORM?TICA B?SICA                                                                                                                                   
SISTEMAS OPERATIVOS                                                                                                                                   
SISTEMAS DIGITALES                                                                                                                                    
"MANUAL DE C                                                                                                                                          

SQL> SELECT LTRIM (TITULO, '"') FROM MISTEXTOS;

LTRIM(TITULO,'"')                                                                                                                                     
--------------------------------                                                                                                                      
METODOLOG?A DE LA PROGRAMACI?N.                                                                                                                       
INFORM?TICA B?SICA."                                                                                                                                  
SISTEMAS OPERATIVOS                                                                                                                                   
SISTEMAS DIGITALES.                                                                                                                                   
MANUAL DE C."                                                                                                                                         

SQL> SELECT REPLACE ('BLANCO Y NEGRO', 'O','AS') FROM DUAL;

REPLACE('BLANCOY                                                                                                                                      
----------------                                                                                                                                      
BLANCAS Y NEGRAS                                                                                                                                      

SQL> SELECT REPLACE ('BLANCO Y NEGRO', 'O') FROM DUAL;

REPLACE('BLA                                                                                                                                          
------------                                                                                                                                          
BLANC Y NEGR                                                                                                                                          

SQL> SELECT SUBSTR ('ABCDEF'3'2)"S1", SUBSTR ('ABCDEF',-3,2)"S2", SUBSTR ('ABCDEF',4)"S3" FROM DUAL;
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> SELECT SUBSTR ('ABCDEFG',3,2)"S1", SUBSTR ('ABCDEFG',-3,2)"S2", SUBSTR ('ABCDEFG',4)"S3" FROM DUAL;

S1 S2 S3                                                                                                                                              
-- -- ----                                                                                                                                            
CD EF DEFG                                                                                                                                            

SQL> SELECT APELLIDO,SUBSTR(APELLIDO,1,1) FROM EMPLE WHERE DEPT_NO=10;

APELLIDO   SUBS                                                                                                                                       
---------- ----                                                                                                                                       
CEREZO     C                                                                                                                                          
REY        R                                                                                                                                          
MU¥OZ      M                                                                                                                                          

SQL> SELECT TRANSLATE ('LOS PILARES DE LA TIERRA','AEIOU','aeiou')FROM DUAL;

TRANSLATE('LOSPILARESDEL                                                                                                                              
------------------------                                                                                                                              
LoS PiLaReS De La TieRRa                                                                                                                              

SQL> SELECT TRANSLATE ('LOS PILARES DE LA TIERRA','LAEIOU','l')FROM DUAL;

TRANSLATE('LOSP                                                                                                                                       
---------------                                                                                                                                       
lS PlRS D l TRR                                                                                                                                       

SQL> SPOOL OFF
