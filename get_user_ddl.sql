set serveroutput on;
declare c clob;
  begin
  for t in( select username from dba_users where default_tablespace not in ('SYSTEM','SYSAUX') and account_status <> 'LOCKED' order by 1)
  loop
   select dbms_metadata.get_ddl('USER', t.username) into c from dual;
   dbms_output.put_line(c);
   dbms_output.put(';');
  end loop;
end;
/