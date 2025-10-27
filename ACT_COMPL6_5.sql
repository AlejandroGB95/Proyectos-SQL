SQL> delete from profesores where dni in
  2  (select dni from profesores minus select dni from personal);

0 rows deleted.

SQL> spool off
