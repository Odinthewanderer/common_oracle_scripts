select 'CREATE OR REPLACE SYNONYM '||OWNER||'.'||SYNONYM_NAME||' FOR '||TABLE_OWNER||'.'||TABLE_NAME||'@'||SUBSTR(db_link, 1 ,INSTR(db_link, '.', 1, 1)-1)||';' 
from dba_synonyms where db_link IS NOT null and owner <> 'PUBLIC';

select 'CREATE OR REPLACE PUBLIC SYNONYM '||SYNONYM_NAME||' FOR '||TABLE_OWNER||'.'||TABLE_NAME||'@'||SUBSTR(db_link, 1 ,INSTR(db_link, '.', 1, 1)-1)||';' 
from dba_synonyms where db_link IS NOT null and owner = 'PUBLIC';