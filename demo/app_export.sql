
-- Run in SQLcl
set termout off
define APP_ID = 103

spool f&APP_ID..sql
apex export &APP_ID.
spool off
exit