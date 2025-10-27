SQL> CREATE OR REPLACE TRIGGER modifica_datos_emple
  2  AFTER UPDATE OR INSERT OR DELETE
  3  ON EMPLE
  4  FOR EACH ROW
  5  BEGIN
  6  if deleting then
  7  insert into auditaremple
  8  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' se ha borrado');
  9  elsif inserting then
 10  insert into auditaremple
 11  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:new.emp_no||:new.apellido||' se ha insertado');
 12  elsif updating ('EMP_NO') THEN
 13  insert int auditaremple
 14  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antiguo emp_no: '||:old.emp_no||' nuevo emp_no: '||:new.emp_no);
 15  elsif updating ('APELLIDO') THEN
 16  insert int auditaremple
 17  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo apellido: '||:old.apellido||' nuevo apellido: '||:new.apellido);
 18  elsif updating ('OFICIO') THEN
 19  insert int auditaremple
 20  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo oficio: '||:old.oficio||' nuevo oficio: '||:new.oficio);
 21  elsif updating ('DIR') THEN
 22  insert int auditaremple
 23  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo director: '||:old.director||' nuevo director: '||:new.director);
 24  elsif updating ('FECHA_ALT') THEN
 25  insert int auditaremple
 26  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antigua fecha_alta: '||:old.fecha_alt||' nueva fecha_alta: '||:new.fecha_alt);
 27  elsif updating ('SALARIO') THEN
 28  insert int auditaremple
 29  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo salario: '||:old.salario||' nuevo salario: '||:new.salario);
 30  elsif updating ('COMISION') THEN
 31  insert int auditaremple
 32  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antigua comision: '||:old.COMISION||' nueva comision: '||:new.comision);
 33  elsif updating ('DEPT_NO') THEN
 34  insert int auditaremple
 35  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo departamento: '||:old.dept_no||' nuevo departamento: '||:new.dept_no);
 36  
 37  end if;
 38  end;
 39  /

Warning: Trigger created with compilation errors.

SQL> show errors
Errors for TRIGGER MODIFICA_DATOS_EMPLE:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
9/1      PL/SQL: SQL Statement ignored                                                                                                                
9/8      PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
12/1     PL/SQL: SQL Statement ignored                                                                                                                
12/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
13/48    PLS-00049: bad bind variable 'OLDW.EMP_NO'                                                                                                   
15/1     PL/SQL: SQL Statement ignored                                                                                                                
15/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
18/1     PL/SQL: SQL Statement ignored                                                                                                                
18/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
19/100   PLS-00049: bad bind variable 'OLD.DIRECTOR'                                                                                                  
19/136   PLS-00049: bad bind variable 'NEW.DIRECTOR'                                                                                                  
21/1     PL/SQL: SQL Statement ignored                                                                                                                
21/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
24/1     PL/SQL: SQL Statement ignored                                                                                                                
24/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
27/1     PL/SQL: SQL Statement ignored                                                                                                                
27/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
30/1     PL/SQL: SQL Statement ignored                                                                                                                
30/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
SQL> 
SQL> CREATE OR REPLACE TRIGGER modifica_datos_emple
  2  AFTER UPDATE OR INSERT OR DELETE
  3  ON EMPLE
  4  FOR EACH ROW
  5  BEGIN
  6  if deleting then
  7  insert into auditaremple
  8  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' se ha borrado');
  9  elsif inserting then
 10  insert into auditaremple
 11  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:new.emp_no||:new.apellido||' se ha insertado');
 12  elsif updating ('EMP_NO') THEN
 13  insert int auditaremple
 14  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antiguo emp_no: '||:old.emp_no||' nuevo emp_no: '||:new.emp_no);
 15  elsif updating ('APELLIDO') THEN
 16  insert int auditaremple
 17  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antiguo apellido: '||:old.apellido||' nuevo apellido: '||:new.apellido);
 18  elsif updating ('OFICIO') THEN
 19  insert int auditaremple
 20  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo oficio: '||:old.oficio||' nuevo oficio: '||:new.oficio);
 21  elsif updating ('DIR') THEN
 22  insert int auditaremple
 23  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antiguo director: '||:old.director||' nuevo director: '||:new.director);
 24  elsif updating ('FECHA_ALT') THEN
 25  insert int auditaremple
 26  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antigua fecha_alta: '||:old.fecha_alt||' nueva fecha_alta: '||:new.fecha_alt);
 27  elsif updating ('SALARIO') THEN
 28  insert int auditaremple
 29  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:old.emp_no||:old.apellido||' antiguo salario: '||:old.salario||' nuevo salario: '||:new.salario);
 30  elsif updating ('COMISION') THEN
 31  insert int auditaremple
 32  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antigua comision: '||:old.COMISION||' nueva comision: '||:new.comision);
 33  elsif updating ('DEPT_NO') THEN
 34  insert int auditaremple
 35  values (to_char(sysdate,'dd/mm/yy hh:mm:ss ')||:oldw.emp_no||:old.apellido||' antiguo departamento: '||:old.dept_no||' nuevo departamento: '||:new.dept_no);
 36  
 37  end if;
 38  end;
 39  /

Warning: Trigger created with compilation errors.

SQL> show erros
SP2-0158: unknown SHOW option "erros"
SQL> show errors
Errors for TRIGGER MODIFICA_DATOS_EMPLE:

LINE/COL ERROR                                                                                                                                        
-------- -----------------------------------------------------------------                                                                            
9/1      PL/SQL: SQL Statement ignored                                                                                                                
9/8      PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
12/1     PL/SQL: SQL Statement ignored                                                                                                                
12/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
15/1     PL/SQL: SQL Statement ignored                                                                                                                
15/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
16/48    PLS-00049: bad bind variable 'OLDW.EMP_NO'                                                                                                   
18/1     PL/SQL: SQL Statement ignored                                                                                                                
18/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
19/99    PLS-00049: bad bind variable 'OLD.DIRECTOR'                                                                                                  
19/135   PLS-00049: bad bind variable 'NEW.DIRECTOR'                                                                                                  
21/1     PL/SQL: SQL Statement ignored                                                                                                                
21/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
24/1     PL/SQL: SQL Statement ignored                                                                                                                
24/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
27/1     PL/SQL: SQL Statement ignored                                                                                                                
27/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
30/1     PL/SQL: SQL Statement ignored                                                                                                                
30/8     PL/SQL: ORA-00925: missing INTO keyword                                                                                                      
SQL> spool off
