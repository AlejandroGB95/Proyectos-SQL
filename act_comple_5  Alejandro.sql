SQL> select * from depart where exists (select * from emple where emple.dept_no = depart.dept_no);

   DEPT_NO DNOMBRE        LOC                                                                                                                         
---------- -------------- --------------                                                                                                              
        20 INVESTIGACION  MADRID                                                                                                                      
        30 VENTAS         BARCELONA                                                                                                                   
        10 CONTABILIDAD   SEVILLA                                                                                                                     

SQL> spool off
