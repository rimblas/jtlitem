# APEX JTL Item Plugin

[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://github.com/Dani3lSun/apex-github-badges) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://github.com/Dani3lSun/apex-github-badges)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://github.com/Dani3lSun/apex-github-badges)

An Oracle APEX Item plugin for storing multi-language translations (MLS) in a JSON column. Now with IG support!

This plugin allows you to store multiple language translations on a **single table column**. Optionally, the user can popup a dialog and edit all the available translations.

## Demo
[Run Demo](https://apex.oracle.com/pls/apex/f?p=97705)

## Preview
![Alt text](/preview.gif?raw=true "Preview")

## How to use?

Add a column with a `_JTL` suffix to your table (or any other suffix you like). For example, a `NAME` column would become `NAME_JTL`:

```sql
create table px_projects (
    id            number        generated by default on null as identity (start with 1) primary key not null
  , name_jtl      varchar2(500) not null constraint px_projects_tl_ck CHECK (name_jtl is json(strict))
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

Use a size that is `{Required Size} x {# of Languages} + offset`. The offset is around 18 per language.

When you create the APEX item, select a size for the item that matches your desired size per translated entry.

#### Plugin Component Attributes
* "Enabled Language List": The Enabled Language List must be a JavaScript array with the supported application languages. The sort order matters and the first language should be the Application's Primary Language. It is ~recommended~ required that when new languages are enabled for the applicating that the JSON columns be updated to include the new language.
* "Messages": Use this setting to specify what messages should be displayed to users in different parts of the plugin. For example, buttons and dialog.

#### Plugin Item Attributes
* "Subtype": Defined the type of field; "Text" or "Textarea"
* "Session Language": use it to override the currently selected APEX language.  You should normally leave it empty.
* "Edit Languages": Controls whether the user will see the translation button "globe". It accepts a PL/SQL Function Returning Boolean.

### Other Settings
Optionally, use the `APEX.PAGE_ITEM_IS_REQUIRED` message to translate your "#LABEL# must have some value." to your correct language.  The plugin `validate` function will fetch this value (via `wwv_flow_lang.system_message`) when the "Required" attribute is set.

### Accessing your Data

The stored JSON format structure for a translation column is of this form:

```js
[ {"l": "us", "tl": "Project Analysis"}
, {"l": "fr", "tl": "Analyse de projet"}
, {"l": "es", "tl": "Analisis de projecto"}]
```

Where `l` is the language code, and `tl` is the translation.

In general, the only time you care about the stored format is when you need to seed data in your tables. Otherwise, the plugin handles the JSON structure for you.

Thanks to the new JSON funtionality on 12c we can extract our JSON data with a `JSON_TABLE` command. if you're on 11g [see here](#running-in-11g-without-json-columns).

```sql
create or replace view px_projects_vl
as
select t.id
     , t.name_jtl
     , jd.lang
     , jd.tl name
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
```

### Programmatic access to your data

The provided package `tk_jtl_plugin` contains several useful [functions and procedures](docs/tk_jtl_plugin.md).

For example, use `tk_jtl_plugin.get_tl_value` on a validation to verify a name is unique within a language.

```sql
select 1
from px_projects_vl
where id <> nvl(:P25_ID, -1)
  and name = tk_jtl_plugin.get_tl_value(:P25_NAME_JTL)
```

Also, the plugin `render` and `validate` functions are part of the `tk_jtl_plugin` package. You'll want to **remove the code** from the Plugin Source and change the render and validate functions to `tk_jtl_plugin.render` and `tk_jtl_plugin.validate` respectively.  [Moving the code to the database](https://rimblas.com/blog/2020/05/move-your-apex-plugin-plsql-code-to-the-database/) will greatly increase the load speed of all your plugins.

## Why JSON?
If you ever had to create a multi-language app, you know that a typical approach is to store the translated values on a translation table. Therefore, every translated entity (table) will require a child table with translations. This design pattern is cumbersome to work with and comes with significan application overhead.
The JSON Translation concept, or JTL for short, has several benefits for APEX applications:
* It allows the developer to continue working with a single table using the Built-In "Automatic Row Fetch" and "Automatic Row Processing" processes.
* Translated columns are treated regular APEX Items via the JTL Item plugin.
* Data can be retrieved and displayed via a translation view (`_VL`)
* The included `tk_jtl_plugin` package includes several useful [functions and procedures](docs/tk_jtl_plugin.md) for manipulating the JSON object in a programmatic way.


## Running in 11g without JSON columns

You can still run this plugin on 11g without the JSON column support.  Simply declare your column as `varchar2` or `clob`. Then use `apex_json.to_xmltype` to convert the JSON to XML and `xmltype` to extract the JSON.

```sql
select /*+ no_merge */ p.id
     , t.lang
     , t.tl
  from px_projects p
     , xmltable('/json/row' passing apex_json.to_xmltype(p.name_jtl)
        columns
             lang  varchar2(10 char) path 'l'
           , tl    varchar2(50 char) path 'tl'
      ) t
```

You will definitely incur in a performance hit, both from the context switch when you call `apex_json.to_xmltype` and from the conversion itself. However, this may be acceptable in your situation.

You'll also miss out of the JSON constraint on the column, but this is not a concern when using the plugin, only if you manually insert data into the column.


## Issues/Questions
* How do I use a select list, checkbox, radio button with translations? — These elements require an LOV, as such use your `_VL` view (as explained [here](#accessing-your-data)) on the LOV to display the correct language.
* The `_JTL` column datatype does not match required column size. Columns need to be as large as the desired size times the languages plus the JSON overhead. Use a size `{Required Size} x {# of Languages} + offset`
* How do I "install" a new language? — New languages added at a later date will require the `_JTL` columns be *updated* with the new language.
* Removing languages may require data updates also, however, this could be handled by the plugin.
* Column sizes need to be enforced via APEX Maximum Length field and in the `_VL` views as part of the `JSON_TABLE`.
* With the new Textarea you may want to store larger content. You can define your table column as `CLOB` and then extract a `VARCHAR2(4000)` with `JSON_TABLE`. However, at this time, `JSON_TABLE` cannot return CLOBs, so you will be limited to 4000 chars.  I have not tested with the extended 32k varchars, that may be a way around this.
* Plugin does not perform size validations or validate the correct JSON structure is in place. It does however check that what you store is valid JSON (in case you're not using the JSON constraint from 12c).
* There seems to be an issue in 12.1 and 12.2 when using when joining than one JSON column on a table. See this [livesql script](https://livesql.oracle.com/apex/livesql/s/dwifcd7pqq1eg64z0jkblyin6) for a test case. However, **IMPORTANT** Patch# 24460392 seems to have fixed this issue.
* You found something? Please report an [Issue](https://github.com/rimblas/jtlitem/issues).

## Change Log
### v1.2.0, May 29, 2020
* New IG Support! It is now possible to use the JTL Item with the Interactive Grid.
* Support for Floating Labels

### v1.1.0, May 21, 2020
* Behavior change: Item languages can now be edited by default (the attribute "Edit Languages" is now set to "true" by default.)
* Bug fix: Issue when the initial creation of a record used a language code other than "en"
* For APEX 5.0.4 use v1.0.0 or get it from the test app [f102_apex_504.sql](demo/f102_apex_504.sql)

### v1.0.0, February 2, 2018
* Implemented TEXTAREAS

### v0.1.0 initial release, Feb 12, 2017

## Upgrade
If you're upgrading from v1.0.0 or v1.1.0 to v1.2.0 the upgrade should be seamless. 
In v1.2.0 the plugin did switch from the deprecated render function to the new render procedure. Significant changes were required to support IG. Chielfy, the JSON is not render as a hidden item any more. Instead, for regular items the initial values is set via a `data-value` attribute and later maintain in the plugin memory but in sync with the `data-value` attribute.

If you've implemented some jQuery or JavaScript calls into the plugin, be aware that the widget name changed to the more standard name `ui.jtlItem`.

Starting with v1.1.0, the "Edit Languages" attribute defaults to true, but existing items will not be affected (this is standard APEX plugin upgrade procedure).


## Roadmap
* Display language names instead of language codes on the edit modal.
* Switch to new architecture for use in Interactive Grid. **In Progress** coming soon.

## Data Conversion
If you're converting existing data to use the JTL column, see this [Data Conversion](docs/data-conversion.md) for more details.

## Disclaimer
Although we successfully use this plugin and technique in production internally at [Insum Solutions](https://insum.ca), use at your own risk and without any warranties.

## Credits
Thanks to [Insum Solutions](https://insum.ca) for sponsoring this project.

The original concept for using JSON columns to store language is thanks to Bruno Mailloux.<br>
The jQuery widget code based in part on code from, the professor, Dan McGhan.


