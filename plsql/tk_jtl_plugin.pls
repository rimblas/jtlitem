create or replace package tk_jtl_plugin
is

--------------------------------------------------------------------------------
--*
--* 
--*
--------------------------------------------------------------------------------
-- TYPES
/**
 * @type gt_string large 32k type
 * @subtype lang_code holds a language code ('en','fr','es',...)
 */
subtype gt_string is varchar2(32767);

subtype lang_code is varchar2(250);

type rec_lang_type is record(
    code       lang_code
  , tl         nvarchar2(32767)
);

type tab_lang_type is table of rec_lang_type;


duplicate_language exception;
pragma exception_init(duplicate_language,-20000);


--------------------------------------------------------------------------------
/**
 * Render the plugin
 * 
 *
 * @example
 * 
 * @issue
 *
 * @author Jorge Rimblas
 * @created October 12, 2016
 * @return
 */
procedure render (
    p_item     in apex_plugin.t_item
  , p_plugin   in apex_plugin.t_plugin
  , p_param    in apex_plugin.t_item_render_param
  , p_result   in out nocopy apex_plugin.t_item_render_result 
);

procedure metadata (
  p_item   in            apex_plugin.t_item,
  p_plugin in            apex_plugin.t_plugin,
  p_param  in            apex_plugin.t_item_meta_data_param,
  p_result in out nocopy apex_plugin.t_item_meta_data_result
);

procedure validate (
    p_item   in            apex_plugin.t_item
  , p_plugin in            apex_plugin.t_plugin
  , p_param  in            apex_plugin.t_item_validation_param
  , p_result in out nocopy apex_plugin.t_item_validation_result
);


--------------------------------------------------------------------------------
function get_tl_value(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
)
return varchar2;

function set_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
  , p_tl    in varchar2
)
return varchar2;

----------------------------------------
function add_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
  , p_tl    in varchar2
)
return varchar2;

function remove_tl(
    p_value in varchar2
  , p_l     in lang_code default apex_application.g_flow_language
)
return varchar2;


end tk_jtl_plugin;
/
