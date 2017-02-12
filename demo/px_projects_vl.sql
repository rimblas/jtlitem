create or replace view px_projects_vl
as
select t.id
     , t.name_jtl
     , jd.lang
     , jd.tls name
     , t.alias
     , t.active_ind
     , t.created_by
     , t.created_on
     , t.updated_by
     , t.updated_on
  from px_projects t
     , json_table(t.name_jtl, '$[*]'
        columns (
             lang varchar2(10)      path '$.l'
           , tl   varchar2(60 char) path '$.tl'
       )) jd
 where jd.lang = (select nvl(apex_util.get_session_lang,'en') from dual)
/
-- SESSION_LANG, BROWSER_LANGUAGE