SQL> SELECT * FROM LIBRERIA;

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

SQL> SELECT TEMA FROM LIBRERIA WHERE EJEMPLARES NOT BETWEEN 15 AND 20;

TEMA                                                                            
---------------                                                                 
ECONOMIA                                                                        
DEPORTES                                                                        
FILOSOFIA                                                                       
DIBUJO                                                                          
BIOLOGIA                                                                        
GEOLOGIA                                                                        
SOCIEDAD                                                                        
JARDINERIA                                                                      

8 rows selected.

SQL> SPOOL OFF
