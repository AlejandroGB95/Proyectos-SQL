SQL> select * from libreria;

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

SQL> select * from libreria where estante not between 'B' and 'D';

TEMA            E EJEMPLARES                                                    
--------------- - ----------                                                    
INFORMATICA     A         15                                                    
ECONOMIA        A         10                                                    
BIOLOGIA        A         11                                                    
JARDINERIA      E          6                                                    

SQL> spool off;
