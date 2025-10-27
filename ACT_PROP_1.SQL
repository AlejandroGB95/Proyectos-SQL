SQL> select abs(146)from dual;

  ABS(146)                                                                      
----------                                                                      
       146                                                                      

SQL> select ceil(2) from dual;

   CEIL(2)                                                                      
----------                                                                      
         2                                                                      

SQL> select ceil(-2.3) from dual;

CEIL(-2.3)                                                                      
----------                                                                      
        -2                                                                      

SQL> select floor(-2) from dual;

 FLOOR(-2)                                                                      
----------                                                                      
        -2                                                                      

SQL> select floor(2) from dual;

  FLOOR(2)                                                                      
----------                                                                      
         2                                                                      

SQL> select mod (22,23) from dual;

MOD(22,23)                                                                      
----------                                                                      
        22                                                                      

SQL> select power (10,0) from dual;

POWER(10,0)                                                                     
-----------                                                                     
          1                                                                     

SQL> select abs(-30) from dual;

  ABS(-30)                                                                      
----------                                                                      
        30                                                                      

SQL> select ceil (1.3) from dual;

 CEIL(1.3)                                                                      
----------                                                                      
         2                                                                      

SQL> select ceil (-2) from dual;

  CEIL(-2)                                                                      
----------                                                                      
        -2                                                                      

SQL> select floor(-2.3), floor(1.3), mod (10,3), power (3,2) from dual;

FLOOR(-2.3) FLOOR(1.3)  MOD(10,3) POWER(3,2)                                    
----------- ---------- ---------- ----------                                    
         -3          1          1          9                                    

SQL> select power(3,-1), round (-33.67,2), round (-33.27,1), trunc (67.232), trunc (67.232,2), trunc (67.58,1) from dual;

POWER(3,-1) ROUND(-33.67,2) ROUND(-33.27,1) TRUNC(67.232) TRUNC(67.232,2)       
----------- --------------- --------------- ------------- ---------------       
TRUNC(67.58,1)                                                                  
--------------                                                                  
 ,333333333          -33,67           -33,3            67           67,23       
          67,5                                                                  
                                                                                

SQL> set linesize 150;
SQL> select power(3,-1), round (-33.67,2), round (-33.27,1), trunc (67.232), trunc (67.232,2), trunc (67.58,1) from dual;

POWER(3,-1) ROUND(-33.67,2) ROUND(-33.27,1) TRUNC(67.232) TRUNC(67.232,2) TRUNC(67.58,1)                                                              
----------- --------------- --------------- ------------- --------------- --------------                                                              
 ,333333333          -33,67           -33,3            67           67,23           67,5                                                              

SQL> select round (33.67), round (-33.67,-2), round (-33.27,-1), trunc(67.232,-2), trunc (67.58,-1) from dual;

ROUND(33.67) ROUND(-33.67,-2) ROUND(-33.27,-1) TRUNC(67.232,-2) TRUNC(67.58,-1)                                                                       
------------ ---------------- ---------------- ---------------- ---------------                                                                       
          34                0              -30                0              60                                                                       

SQL> spool off
