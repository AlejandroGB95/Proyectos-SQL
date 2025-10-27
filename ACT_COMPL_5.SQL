SQL> DESC LIBROS
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 TITULO                                                                                       VARCHAR2(32)
 AUTOR                                                                                        VARCHAR2(22)
 EDITORIAL                                                                                    VARCHAR2(15)
 PAGINA                                                                                       NUMBER(3)

SQL> SELECT AUTOR FROM LIBROS;

AUTOR                                                                                                                                                 
----------------------                                                                                                                                
CELA, CAMILO JOS?                                                                                                                                     
GORDIMER, NADINE                                                                                                                                      
G.DELGADO, FERNANDO                                                                                                                                   
MARSE, JUAN                                                                                                                                           
TORRENTE B., GONZALO                                                                                                                                  

SQL> select autor , substr(autor,1,instr(autor,',')-1) "APELLIDO" from libros;

AUTOR                  APELLIDO                                                                                                                       
---------------------- ----------------------------------------------------------------------------------------                                       
CELA, CAMILO JOS?      CELA                                                                                                                           
GORDIMER, NADINE       GORDIMER                                                                                                                       
G.DELGADO, FERNANDO    G.DELGADO                                                                                                                      
MARSE, JUAN            MARSE                                                                                                                          
TORRENTE B., GONZALO   TORRENTE B.                                                                                                                    


