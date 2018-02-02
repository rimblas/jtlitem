create or replace view px_jtl_with_blob_vl
as
with n_tl as (
  select /*+ no_merge */ p.id
       , t.lang
       , t.tl
    from px_jtl_with_blob p
       , xmltable('/json/row' passing apex_json.to_xmltype(p.name_jtl)
          columns
               lang  varchar2(10 char) path 'l'
             , tl    varchar2(50 char) path 'tl'
        ) t
),
d_tl as (
  select /*+ no_merge */ p.id
       , t.lang
       , t.tl
    from px_jtl_with_blob p
       , json_table(p.description_jtl, '$[*]'
          columns (
                   lang varchar2(10) path '$.l'
                 , tl   varchar2(4000) path '$.tl'
                  )
        ) t
)
select p.id
     , p.name_jtl
     , p.description_jtl
     , n_tl.lang
     , n_tl.tl   name
     , d_tl.tl   description
     , p.alias
     , p.active_ind
     , p.created_by
     , p.created_on
     , p.updated_by
     , p.updated_on
  from px_jtl_with_blob p
     , n_tl
     , d_tl
 where p.id = n_tl.id
   and p.id = d_tl.id
   and n_tl.lang = d_tl.lang
   and n_tl.lang = (select nvl(apex_util.get_session_lang,'en') from dual)
/
