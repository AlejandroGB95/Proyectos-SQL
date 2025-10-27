SQL> select * from depart where not exists (select * from emple where emple.dept_no = depart.dept_no);

   DEPT_NO DNOMBRE        LOC                                                                                                                         
---------- -------------- --------------                                                                                                              
        40 PRODUCCION     BILBAO                                                                                                                      

SQL> spool off
