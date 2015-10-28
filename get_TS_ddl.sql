/* 
CREATE TABLESPACE APPL_DATA 
DATAFILE '+L7DATA' 
SIZE 120M AUTOEXTEND ON NEXT 10M MAXSIZE 500M
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

FORMAT OUT TO THIS.
*/

set serveroutput on;
declare c clob;
  begin
  for t in( select tablespace_name from dba_tablespaces order by 1)
  loop
   select dbms_metadata.get_ddl('TABLESPACE', t.tablespace_name) into c from dual;
   dbms_output.put_line(c);
   dbms_output.put(';');
  end loop;
end;
/