                                                                                                                                  

 

SQL> SELECT LOWER(RTRIM(LTRIM(TITULO,'"'),'."')) FROM MISTEXTOS;

LOWER(RTRIM(LTRIM(TITULO,'"')                                                                                                                    
--------------------------------                                                                                                                      
metodolog?a de la programaci?n                                                                                                                        
inform?tica b?sica                                                                                                                                    
sistemas operativos                                                                                                                                   
sistemas digitales                                                                                                                                    
manual de c                                                                                                                                           


SQL> SELECT LOWER(REPLACE(REPLACE(TITULO,'.',''),'"','')) FROM MISTEXTOS;

LOWER(REPLACE(REPLACE(TITULO,                                                                                                                     
--------------------------------                                                                                                                      
metodolog?a de la programaci?n                                                                                                                        
inform?tica b?sica                                                                                                                                    
sistemas operativos                                                                                                                                   
sistemas digitales                                                                                                                                    
manual de c                                                                                                                                           

SQL> SPOOL OFF
