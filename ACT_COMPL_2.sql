SQL> DESC LIBRERIA
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 TEMA                                                                                NOT NULL CHAR(15)
 ESTANTE                                                                                      CHAR(1)
 EJEMPLARES                                                                                   NUMBER(2)

SQL> SELECT TEMA FROM LIBRERIA WHERE TEMA LIKE '%E%' AND EJEMPLARES > (SELECT AVG (EJEMPLARES) FROM LIBRERIA);

TEMA                                                                                                                                                  
---------------                                                                                                                                       
MEDICINA                                                                                                                                              
LABORES                                                                                                                                               

SQL> SPOOL OFF
