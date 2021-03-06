# Converting to the JSON Translation

If you have existing data and you're converting to the JTL stucture you'll want to implement some of the steps below.

Let's imagine our `px_projects` table before the JTL column.

```sql
create table px_projects (
    id            number        generated by default on null as identity (start with 1) primary key not null
  , name          varchar2(150) not null
  , alias         varchar2(32)
  , active_ind    varchar2(1)   not null
  , created_by    varchar2(60) default
                    coalesce(
                        sys_context('APEX$SESSION','app_user')
                      , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                      , sys_context('userenv','session_user')
                    )
                    not null
  , created_on    date         default sysdate not null
  , updated_by    varchar2(60)
  , updated_on    date
  , constraint px_projects_ck_active
      check (active_ind in ('Y', 'N'))
)
enable primary key using index
/
```

First you'll want to add the JTL column to the table.

```
alter table px_projects add name_jtl varchar2(500) constraint px_projects_tl_ck CHECK (name_jtl is json(strict));
```

Then convert your existing data making sure you escape your data.  Let imagine you're implemnting two languages: en and es.

The column JSON structure will look like this:

```
[ {"l": "en", "tl": "Project Analysis"}
, {"l": "es", "tl": "Analisis de projecto"}]
```

Parametizing the project name, we would run an update statement like this:

```sql
update px_projects
   set name_jtl = 
   '[{"l":"en","tl":"' || apex_escape.json(name) || '"},'
  ||'{"l":"es","tl":"' || apex_escape.json(name) || '"}]'
/
```

Your best friend here is `apex_escape.json` as it will make sure that no matter what your data contains (`"`, `[`, `{`, etc..) the resulting JSON will be valid.

