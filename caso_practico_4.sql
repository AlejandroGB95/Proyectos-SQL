SQL> desc notas_alumnos;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 NOMBRE_ALUMNO                                                                       NOT NULL VARCHAR2(25)
 NOTA1                                                                                        NUMBER(2)
 NOTA2                                                                                        NUMBER(2)
 NOTA3                                                                                        NUMBER(2)

SQL> select nombre_alumno, greatest(nota1,nota2,nota3)"mayor", least(nota1,nota2,nota3)"menor" from notas_alumnos;

NOMBRE_ALUMNO                  mayor      menor                                                                                                       
------------------------- ---------- ----------                                                                                                       
Alcalde Garc¡a, M. Luisa           5          5                                                                                                       
Benito Mart¡n, Luis                8          6                                                                                                       
Casas Mart¡nez, Manuel             7          5                                                                                                       
Corregidor S nchez, Ana            9          6                                                                                                       
D¡az S nchez, Maria                                                                                                                                   

SQL> select greatest ('BENITO','JORGE','ANDRES','ISABEL') from dual;

GREAT                                                                                                                                                 
-----                                                                                                                                                 
JORGE                                                                                                                                                 

SQL> spool off
