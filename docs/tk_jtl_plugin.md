# TK_JTL_PLUGIN

- [Constants](#constants)
- [RENDER Function](#render)
- [VALIDATE Function](#validate)
- [OUTPUT_LANG_TAB Function](#output_lang_tab)
- [GET_TL_VALUE Function](#get_tl_value)
- [SET_TL Function](#set_tl)
- [ADD_TL Function](#add_tl)
- [REMOVE_TL Function](#remove_tl)



## Constants<a name="constants"></a>

Name | Code | Description
--- | --- | ---
gc_scope_prefix | `gc_scope_prefix constant VARCHAR2(31) := lower($$PLSQL_UNIT) || '.';` | Standard logger package name


 
## RENDER Function<a name="render"></a>


<p>
<p>Render the item as a hidden and display combo.<br />Original concept for using JSON columns to store language: Bruno Mailloux</p>
</p>

### Syntax
```plsql
function render(
    p_item                in apex_plugin.t_page_item
  , p_plugin              in apex_plugin.t_plugin
  , p_value               in gt_string
  , p_is_readonly         in boolean
  , p_is_printer_friendly in boolean
 )
return apex_plugin.t_page_item_render_result
```

### Parameters
Name | Description
--- | ---
`p_item` | Standard plugin parameters
 
 





 
## VALIDATE Function<a name="validate"></a>


<p>
<p>Perform validations on the submitted data:</p><ul>
<li>Ensure the data is JSON format</li>
<li>Ensure the JSON format is of the expected form</li>
</ul>

</p>

### Syntax
```plsql
function validate (
   p_item   in apex_plugin.t_page_item
 , p_plugin in apex_plugin.t_plugin
 , p_value  in varchar2
)
return apex_plugin.t_page_item_validation_result
```

### Parameters
Name | Description
--- | ---
`` | 
 
 





 
## OUTPUT_LANG_TAB Function<a name="output_lang_tab"></a>


<p>
<p>Convert a <code>tab_lang_type</code> array to JSON format of the form:</p><pre><code class="lang-json"> [
  {&quot;l&quot;:&quot;en&quot;,&quot;tl&quot;:&quot;Name&quot;},
  {&quot;l&quot;:&quot;fr&quot;,&quot;tl&quot;:&quot;Nom - Français&quot;},
  {&quot;l&quot;:&quot;es&quot;,&quot;tl&quot;:&quot;Nombre - Español&quot;}
 ]
</code></pre>

</p>

### Syntax
```plsql
function output_lang_tab(p_tab in out nocopy tab_lang_type)
  return clob
```

### Parameters
Name | Description
--- | ---
`p_tab` | tab_lang_type
*return* | clob JSON object
 
 





 
## GET_TL_VALUE Function<a name="get_tl_value"></a>


<p>
<p>Given a JSON string (p_value) return the value of the language defined by code (p_l)</p>
</p>

### Syntax
```plsql
function get_tl_value(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
)
return varchar2
```

### Parameters
Name | Description
--- | ---
`p_value` | JSON MLS structure
`p_l` | language code (ie. &#39;es&#39;, &#39;fr&#39;, ...)
*return* | New value as varchar2
 
 


### Example
```plsql
tk_jtl_plugin.get_tl_value(:P3_NAME_JTL, :SESSION_LANG) is not null
```



 
## SET_TL Function<a name="set_tl"></a>


<p>
<p>Given a JSON string (p_value) update the corresponding language code (p_l)<br />with a new translation (p_tl)</p>
</p>

### Syntax
```plsql
function set_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
  , p_tl    in varchar2
)
return varchar2
```

### Parameters
Name | Description
--- | ---
`p_value` | JSON MLS structure
`p_l` | language code (ie. &#39;es&#39;, &#39;fr&#39;, ...)
`p_tl` | New translated value
*return* | New JSON MSL value
 
 


### Example
```plsql
update px_projects
   set name_jtl = tk_jtl_plugin.set_tl(name_jtl, 'en', 'New value')
where id = 21;
```



 
## ADD_TL Function<a name="add_tl"></a>


<p>
<p>Given a JSON string (p_value) add a new language as defined by code (p_l)<br />and translation (p_tl) at the end of the JSON MLS structure</p>
</p>

### Syntax
```plsql
function add_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
  , p_tl    in varchar2
)
return varchar2
```

### Parameters
Name | Description
--- | ---
`p_value` | JSON MLS structure
`p_l` | language code (ie. &#39;es&#39;, &#39;fr&#39;, ...)
`p_tl` | New translated value
*return* | New JSON MSL value
 
 


### Example
```plsql
update px_projects
   set name_jtl = tk_jtl_plugin.add_tl(name_jtl, 'en', 'New value')
where id = 21;
```



 
## REMOVE_TL Function<a name="remove_tl"></a>


<p>
<p>Given a JSON MLS string (p_value) remove a language as defined by code (p_l)</p>
</p>

### Syntax
```plsql
function remove_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
)
return varchar2
```

### Parameters
Name | Description
--- | ---
`p_value` | JSON MLS structure
`p_l` | language code (ie. &#39;es&#39;, &#39;fr&#39;, ...)
*return* | New JSON MSL value
 
 


### Example
```plsql
update px_projects
   set name_jtl = tk_jtl_plugin.remove_tl(name_jtl, 'en', 'New value')
where id = 21;
```



 
