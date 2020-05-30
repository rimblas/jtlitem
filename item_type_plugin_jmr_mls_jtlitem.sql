prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1822210963915592
,p_default_application_id=>107
,p_default_owner=>'JMR'
);
end;
/
prompt --application/shared_components/plugins/item_type/jmr_mls_jtlitem
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1032002593386927165)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'JMR.MLS.JTLITEM'
,p_display_name=>'JTL Item'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_image_prefix=>'&G_APEX_NITRO_IMAGES.'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/jtl_item#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#css/jtl_item#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'subtype gt_string is varchar2(32767);',
'',
'subtype scope_name_t is varchar2(60);',
'',
'',
'-- CONSTANTS',
'/**',
' * @constant gc_scope_prefix Standard logger package name',
' */',
'gc_scope_prefix constant VARCHAR2(31) := lower($$PLSQL_UNIT) || ''.'';',
'',
'',
'',
'procedure log(p_msg in varchar2, p_scope  in varchar2)',
'is',
'begin',
'',
'  $IF $$OOS_LOGGER $THEN',
'  logger.log(p_msg, p_scope);',
'  $ELSE',
'  apex_debug.message(p_scope || '':'' || substr(p_msg,1,3000));',
'  $END',
'',
'end log;',
'',
'',
'procedure log_error(p_msg in varchar2, p_scope  in varchar2)',
'is',
'begin',
'',
'  $IF $$LOGGER $THEN',
'  logger.log_error(p_msg, p_scope);',
'  $ELSE',
'  apex_debug.message(p_scope || '': '' || p_msg);',
'  $END',
'',
'end log_error;',
'',
'',
'',
'/**',
' * given a JTL JSON structure find the display value for the language',
' *',
' *',
' * @example',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created May 21, 2020',
' * @param x_result_status',
' * @return',
' */',
'procedure set_display_value(',
'      p_jtl_value     in  gt_string',
'    , p_for_language  in  gt_string',
'    , x_display_value out gt_string',
'    , x_language      out gt_string',
'  )',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''set_display_value'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''set_display_value'';',
'  $END',
'',
'  l_language          gt_string;',
'  l_display_value     gt_string;',
'',
'  l_idx               number;',
'  l_count             number;',
'  l_found             boolean := false;',
'',
'begin',
'  log(''BEGIN'', l_scope);',
'',
'  -- get the value for the language',
'  apex_json.parse(p_jtl_value);',
'  log(''parsing:'' || p_jtl_value, l_scope);',
'  l_count := apex_json.get_count(p_path => ''.'');',
'  log(''language count:'' || l_count, l_scope);',
'',
'  l_idx := 1;',
'  l_found := false;',
'  while not l_found and l_idx <= nvl(l_count,0) loop',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => l_idx);',
'    log(''language:'' || l_language, l_scope);',
'',
'    if l_language = p_for_language then',
'      l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => l_idx);',
'      log(''Translation:'' || l_display_value, l_scope);',
'      l_found := true;',
'    end if;',
'    l_idx := l_idx + 1;',
'    ',
'  end loop;',
'',
'  -- If we didn''t find a language match, default to the first entry',
'  if not l_found then',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => 1);',
'    l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => 1);',
'    apex_debug.message(''Didn''''t find a language match, using the 1st language: %s'', l_language);',
'  end if;',
'',
'  x_language := l_language;',
'  x_display_value := l_display_value;',
'',
'  log(''END'', l_scope);',
'',
'  exception',
'    when OTHERS then',
'      log_error(''Unhandled Exception'', l_scope);',
'      raise;',
'end set_display_value;',
'',
'',
'',
'',
'------------------------------------------------------------------------------',
'/**',
' * Render the item as a hidden and display combo.',
' * Original concept for using JSON columns to store language: Bruno Mailloux',
' *',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created September 19, 2016',
' * @param p_item Standard plugin parameters',
' * @return',
' */',
'procedure render  (',
'    p_item     in apex_plugin.t_item',
'  , p_plugin   in apex_plugin.t_plugin',
'  , p_param    in apex_plugin.t_item_render_param',
'  , p_result   in out nocopy apex_plugin.t_item_render_result ',
')',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''render'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''render'';',
'  $END',
'',
'  c_name           constant varchar2(30) := apex_plugin.get_input_name_for_item;',
'',
'  l_default_language        gt_string;',
'  l_language                gt_string;',
'  l_edit_languages          boolean := false;',
'  l_languages_list          gt_string;',
'  l_dialog_title            gt_string := p_item.plain_label;',
'  l_messages                gt_string := p_plugin.attribute_02; -- for MLS messages',
'',
'  l_name              varchar2(255);',
'  l_display_value     gt_string;',
'  l_item_type         gt_string;',
'',
'  l_onload_code       gt_string;',
'  l_ig_mode           boolean;',
'',
'  l_crlf              char(2) := chr(13)||chr(10);',
'',
'begin',
'  log(''START'', l_scope);',
'',
'  apex_debug.message(''p_item.attribute_01 (Default language): %s'', p_item.attribute_01);',
'  apex_debug.message(''p_item.attribute_02 (Edit languages): %s'', p_item.attribute_02);',
'  apex_debug.message(''p_item.attribute_03 (Item Type): %s'', p_item.attribute_03);',
'',
'  l_default_language := coalesce(apex_plugin_util.replace_substitutions(p_item.attribute_01)',
'                               , apex_util.get_session_lang);',
'  l_edit_languages := apex_plugin_util.get_plsql_func_result_boolean(p_item.attribute_02);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attribute_01); -- Enabled Language List',
'  l_item_type := coalesce(p_item.attribute_03, ''TEXT'');',
'  l_ig_mode := (p_item.component_type_id = apex_component.c_comp_type_ig_column);',
'',
'  log(''l_languages_list:'' || l_languages_list, l_scope);',
'  log(''l_default_language:'' || l_default_language, l_scope);',
'  apex_plugin_util.debug_item(p_plugin, p_item);',
'',
'',
'  if p_param.value is null then',
'    l_language := l_default_language;',
'    l_display_value := null;',
'  else',
'    set_display_value(',
'        p_jtl_value     => p_param.value',
'      , p_for_language  => l_default_language',
'      , x_display_value => l_display_value',
'      , x_language      => l_language',
'    );',
'  end if;',
'',
'',
'  -- If a page item saves state, we have to call the get_input_name_for_page_item',
'  -- to render the internal hidden p_arg_names field. It will also return the',
'  -- HTML field name which we have to use when we render the HTML input field.',
'  l_name := apex_plugin.get_input_name_for_page_item(p_is_multi_value=>false);',
'',
'  apex_plugin_util.print_hidden_if_readonly (',
'       p_item_name           => p_item.name',
'     , p_value               => p_param.value',
'     , p_is_readonly         => p_param.is_readonly',
'     , p_is_printer_friendly => p_param.is_printer_friendly',
'  );',
'',
'  if p_param.is_readonly or p_param.is_printer_friendly then ',
'    log(''.. display only'', l_scope); ',
'',
'    apex_plugin_util.print_display_only(',
'        p_item_name        => p_item.name',
'      , p_display_value    => l_display_value',
'      , p_show_line_breaks => false',
'      , p_escape           => p_item.escape_output',
'      , p_attributes       => p_item.element_attributes',
'    );',
'',
'    -- Tell APEX that this field is NOT navigable',
'    p_result.is_navigable := false;',
'  else',
'',
'    -- now render the visible element',
'    if l_item_type = ''TEXT'' then',
'      sys.htp.prn(',
'          ''<input type="text"''',
'               || apex_plugin_util.get_element_attributes(p_item, c_name, ''jtlitem apex-item-text text_field'')',
'               || ''size="'' || p_item.element_width||''" ''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || p_item.element_attributes',
'               || ''value="'');',
'      apex_plugin_util.print_escaped_value(l_display_value);',
'      sys.htp.prn(''"'');',
'      sys.htp.prn('' data-value="'');',
'      apex_plugin_util.print_escaped_value(p_param.value);',
'      sys.htp.prn(''"/>'');',
'    else',
'      -- Textareas don''t use a value attribute, instead they contain their value ',
'      -- in between the tags. Therefore, make sure not to add any spaces or other',
'      -- characters that are not part of the value.',
'      sys.htp.prn(',
'          ''<textarea ''',
'               || apex_plugin_util.get_element_attributes(p_item, c_name, ''jtlitem apex-item-textarea textarea'')',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''cols="'' || p_item.element_width||''" ''',
'               || ''rows="'' || p_item.element_height||''" ''',
'               || p_item.element_attributes);',
'      sys.htp.prn('' data-value="'');',
'      apex_plugin_util.print_escaped_value(p_param.value);',
'      sys.htp.prn(''"/>'');',
'      sys.htp.prn(apex_plugin_util.escape(p_value => l_display_value, p_escape => p_item.escape_output));',
'      sys.htp.prn(''</textarea>'');',
'    end if;',
'',
'    if l_edit_languages then',
'      sys.htp.p(''<button type="button" class="jtlitem-modal-open a-Button">'' || l_crlf',
'             || ''  <span class="t-Icon fa fa-globe"></span>'' || l_crlf',
'             || ''</button>'' || l_crlf',
'             );',
'    end if;',
'',
'    apex_javascript.add_onload_code (',
'      p_code => ''$("#''|| p_item.name || ''").jtlItem({'' || l_crlf',
'                      || apex_javascript.add_attribute(''itemName'', p_item.name, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang'', l_language, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang_codes'', l_languages_list, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''messages'', l_messages, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''itemType'', l_item_type, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''dialogTitle'', l_dialog_title, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''igMode'', l_ig_mode, false, false) || l_crlf',
'             || ''});''',
'            );',
'  end if; -- display_only section',
'',
'',
'',
'  exception',
'    when OTHERS then',
'      apex_debug.error(''Unhandled Exception'');',
'      raise;',
'end render;',
'',
'',
'',
'procedure metadata (',
'  p_item   in            apex_plugin.t_item,',
'  p_plugin in            apex_plugin.t_plugin,',
'  p_param  in            apex_plugin.t_item_meta_data_param,',
'  p_result in out nocopy apex_plugin.t_item_meta_data_result )',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''metadata'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''render'';',
'  $END',
'begin',
'  log(''START'', l_scope);',
'',
'  -- apex_debug.message(''p_item.value %s'', p_param.value);',
'  p_result.escape_output := false;',
'end metadata;',
'',
'',
'',
'/**',
' * Perform validations on the submitted data:',
' *  - Ensure the data is JSON format',
' *  - Ensure the JSON format is of the expected form',
' *',
' *',
' * @example',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created October 7, 2016',
' * @param',
' * @return',
' */',
'procedure validate (',
'    p_item   in            apex_plugin.t_item',
'  , p_plugin in            apex_plugin.t_plugin',
'  , p_param  in            apex_plugin.t_item_validation_param',
'  , p_result in out nocopy apex_plugin.t_item_validation_result',
')',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''validate'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''validate'';',
'  $END',
'',
'  l_default_language  gt_string;',
'  l_languages_list    gt_string;',
'  l_language          gt_string;',
'  l_display_value     gt_string;',
'  l_error_suffix      gt_string;',
'',
'  l_idx               number;',
'  l_count             number;',
'  l_found_empty       boolean := false;',
'',
'begin',
'',
'  apex_debug.message(''BEGIN'');',
'',
'  l_default_language := coalesce(apex_plugin_util.replace_substitutions(p_item.attribute_01)',
'                               , apex_util.get_session_lang);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attribute_01); -- Enabled Language List',
'',
'  apex_json.parse(p_param.value);',
'  apex_debug.message(''parsing: %s'', p_param.value);',
'  l_count := apex_json.get_count(p_path => ''.'');',
'  apex_debug.message(''lagunages count: %s'', l_count);',
'',
'  -- The item is required, check the "tl" attributes to see if the value is present',
'  if p_item.is_required then',
'    apex_debug.message(''p_item.is_required = true'', l_count);',
'    l_idx := 1;',
'    l_found_empty := false;',
'    -- loop through all the languages or until we find an empty one.',
'    while not l_found_empty and l_idx <= nvl(l_count,0) loop',
'      -- get the current language',
'      l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => l_idx);',
'      -- get the translation value for the language',
'      l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => l_idx);',
'',
'      apex_debug.message(''language: %s'', l_language);',
'',
'      if l_display_value is null then',
'        -- this one is null, so we will return a required value error',
'        l_found_empty := true;',
'        if l_language = l_default_language then',
'          apex_debug.message(''The current language is null'');',
'          l_error_suffix := '''';',
'        else',
'          -- Hmmm, the language that is null is NOT the one displayed to the user',
'          -- add the language code as a prefix to the error.',
'          apex_debug.message(''A different language is null'');',
'          l_error_suffix := ''['' || l_language || ''] '';',
'        end if;',
'      end if;',
'      l_idx := l_idx + 1;',
'      ',
'    end loop;',
'',
'  end if;',
'',
'  if l_found_empty then',
'    -- Define APEX.PAGE_ITEM_IS_REQUIRED in your language.',
'    p_result.message := wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED'');',
'    -- if p_result.message = ''APEX.PAGE_ITEM_IS_REQUIRED'' then',
'    --   -- message not defined yet',
'    --   p_result.message := apex_lang.message(''#LABEL# must have some value.'');',
'    -- end if;',
'    -- add the language suffix, if the error doesn''t apply to the language being displayed.',
'    p_result.message := l_error_suffix || p_result.message;',
'  else',
'    p_result.message := '''';',
'  end if;',
'',
'exception',
'  when apex_json.e_parse_error then',
'    -- Somehow we don''t have valid JSON in our item.',
'    -- This is more critical for 11g where we don''t have "is json" constraints',
'    p_result.message := ''The JSON structure for #LABEL# is invalid.'';',
'',
'end validate;',
''))
,p_api_version=>2
,p_render_function=>'render'
,p_meta_data_function=>'metadata'
,p_validation_function=>'validate'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Plugin for storing multi-language translations (MLS) in a JSON column.',
'',
'For better plugin render performance switch from the inline code to the package code.  Change the render, metadata, and validate procedures to tk_jtl_plugin.render, tk_jtl_plugin.metadata and tk_jtl_plugin.validate. Then REMOVE the inline code or you'
||' will not get the performance improvement.'))
,p_version_identifier=>'1.2.0'
,p_about_url=>'https://github.com/rimblas/jtlitem'
,p_files_version=>117
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1032002786078928883)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Enabled Language List'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_default_value=>'return ''["en","fr","es"]'';'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Enabled Language List must be a JavaScript array with the supported application languages. The sort order matters and the first language should be the Application''s Primary Language.<br> ',
'It is recommended that when new languages are enabled for the applicating that the JSON columns be updated to include the new language.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1032003048703929004)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Messages'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
,p_display_length=>80
,p_max_length=>4000
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this setting to specify what messages should be displayed to users in different parts of the plugin. The default values are:<br />',
'<pre>',
'{',
'   "applyChanges": "Apply Changes",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1032003784821929029)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>20
,p_prompt=>'Session Language'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'This is the language code for the current session. If empty, the plugin will use "apex_util.get_session_lang". Substitution Strings are also supported, for example &BROWSER_LANGUAGE.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1032003368710929017)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>30
,p_prompt=>'Edit Languages'
,p_attribute_type=>'PLSQL FUNCTION BODY BOOLEAN'
,p_is_required=>true
,p_default_value=>'return true;'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return true or false. When true a button to edit all the languages will be present. The button will open a dialog that will allow the user to edit all the languages specified in the "Language List" parameter.<br>',
'When false and a new record is created the "Installed Languages" Application plugin attribute will be used to seed all available languages.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(908318676138686611)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>10
,p_prompt=>'Subtype'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TEXT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Will select the type of item to display: Regular Text Input or Text Area'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(908323050842688399)
,p_plugin_attribute_id=>wwv_flow_api.id(908318676138686611)
,p_display_sequence=>10
,p_display_value=>'Text'
,p_return_value=>'TEXT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(908323383006689458)
,p_plugin_attribute_id=>wwv_flow_api.id(908318676138686611)
,p_display_sequence=>20
,p_display_value=>'Textarea'
,p_return_value=>'TEXTAREA'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E7B70616464696E673A2E3472656D202E3872656D3B6F726465723A337D2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D';
wwv_flow_api.g_varchar2_table(2) := '6F64616C2D6F70656E2E612D427574746F6E7B70616464696E673A2E3872656D202E3972656D7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E612D4275';
wwv_flow_api.g_varchar2_table(3) := '74746F6E7B70616464696E673A312E3272656D7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D6974656D577261707065727B616C69676E2D6974656D733A737472657463683B7769';
wwv_flow_api.g_varchar2_table(4) := '6474683A313030257D2E6A746C6974656D2D636F6E74656E747B6D617267696E3A3020313070787D2E6A746C6974656D2D636F6E74656E74207461626C657B6D617267696E3A3130707820307D2E6A746C6974656D2D636F6E74656E74207461626C6520';
wwv_flow_api.g_varchar2_table(5) := '74722E73656C65637465647B6F75746C696E653A31707820646173686564206F72616E67657D2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B6261636B67726F756E642D636F6C6F723A23663766376261';
wwv_flow_api.g_varchar2_table(6) := '7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E7B646973706C61793A696E6C696E652D626C6F636B7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E65727B70616464696E673A35707820313070783B';
wwv_flow_api.g_varchar2_table(7) := '706F736974696F6E3A72656C61746976653B666C6F61743A72696768747D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10591671801675564)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'css/jtl_item.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E207B0A202070616464696E673A202E3472656D202E3872656D3B0A20206F726465723A20333B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652062757474';
wwv_flow_api.g_varchar2_table(2) := '6F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E612D427574746F6E207B0A2020202070616464696E673A202E3872656D202E3972656D3B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A';
wwv_flow_api.g_varchar2_table(3) := '746C6974656D2D6D6F64616C2D6F70656E2E612D427574746F6E207B0A2020202070616464696E673A20312E3272656D3B0A7D0A0A0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D';
wwv_flow_api.g_varchar2_table(4) := '6974656D57726170706572207B0A20202020616C69676E2D6974656D733A20737472657463683B0A2020202077696474683A20313030253B0A7D0A0A2E6A746C6974656D2D636F6E74656E74207B0A20206D617267696E3A203020313070783B0A7D0A2E';
wwv_flow_api.g_varchar2_table(5) := '6A746C6974656D2D636F6E74656E74207461626C65207B0A20206D617267696E3A203130707820303B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C6563746564207B0A20206F75746C696E653A203170782064617368';
wwv_flow_api.g_varchar2_table(6) := '6564206F72616E67653B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B0A20206261636B67726F756E642D636F6C6F723A20236637663762613B0A7D0A2E6A746C6974656D2D627574746F6E2D63';
wwv_flow_api.g_varchar2_table(7) := '6F6E7461696E6572202E75692D69636F6E207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B0A202070616464696E673A2035707820313070783B0A2020706F';
wwv_flow_api.g_varchar2_table(8) := '736974696F6E3A2072656C61746976653B0A2020666C6F61743A2072696768743B0A7D0A0A0A2F2A2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6373732E6D6170202A2F0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10591946329675578)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'css/jtl_item.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141413B454143452C6F4241416F423B45414370422C514141513B414143563B41414341';
wwv_flow_api.g_varchar2_table(2) := '3B494143492C6F4241416F423B41414378423B414143413B494143492C654141653B4141436E423B3B3B414147413B494143492C6F4241416F423B49414370422C574141573B414143663B3B414145413B454143452C634141633B41414368423B414143';
wwv_flow_api.g_varchar2_table(3) := '413B454143452C634141633B41414368423B414143413B454143452C3042414130423B41414335423B414143413B454143452C7942414179423B41414333423B414143413B454143452C7142414171423B41414376423B414143413B454143452C694241';
wwv_flow_api.g_varchar2_table(4) := '4169423B4541436A422C6B4241416B423B4541436C422C594141593B41414364222C2266696C65223A226A746C5F6974656D2E637373222C22736F7572636573436F6E74656E74223A5B22627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E';
wwv_flow_api.g_varchar2_table(5) := '207B5C6E202070616464696E673A202E3472656D202E3872656D3B5C6E20206F726465723A20333B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E';
wwv_flow_api.g_varchar2_table(6) := '2E612D427574746F6E207B5C6E2020202070616464696E673A202E3872656D202E3972656D3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E';
wwv_flow_api.g_varchar2_table(7) := '612D427574746F6E207B5C6E2020202070616464696E673A20312E3272656D3B5C6E7D5C6E5C6E5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D6974656D57726170706572207B';
wwv_flow_api.g_varchar2_table(8) := '5C6E20202020616C69676E2D6974656D733A20737472657463683B5C6E2020202077696474683A20313030253B5C6E7D5C6E5C6E2E6A746C6974656D2D636F6E74656E74207B5C6E20206D617267696E3A203020313070783B5C6E7D5C6E2E6A746C6974';
wwv_flow_api.g_varchar2_table(9) := '656D2D636F6E74656E74207461626C65207B5C6E20206D617267696E3A203130707820303B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C6563746564207B5C6E20206F75746C696E653A20317078206461736865';
wwv_flow_api.g_varchar2_table(10) := '64206F72616E67653B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B5C6E20206261636B67726F756E642D636F6C6F723A20236637663762613B5C6E7D5C6E2E6A746C6974656D2D62757474';
wwv_flow_api.g_varchar2_table(11) := '6F6E2D636F6E7461696E6572202E75692D69636F6E207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B5C6E202070616464696E673A20357078203130';
wwv_flow_api.g_varchar2_table(12) := '70783B5C6E2020706F736974696F6E3A2072656C61746976653B5C6E2020666C6F61743A2072696768743B5C6E7D5C6E5C6E225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10592291357675584)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'css/jtl_item.css.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076312E31202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052696D';
wwv_flow_api.g_varchar2_table(2) := '626C617320C2A920323031372D323032300A2A2F0A0A242E77696467657428202275692E6A746C4974656D222C207B0A200A20202F2F2044656661756C74206F7074696F6E732E0A20206F7074696F6E733A207B0A20202020206C616E673A2022656E22';
wwv_flow_api.g_varchar2_table(3) := '2C0A20202020206C616E675F636F6465733A205B5D2C20202F2F205B22656E222C226672222C226573225D0A20202020206D657373616765733A206E756C6C2C0A20202020206974656D4E616D653A2027272C0A20202020206669656C6453697A653A20';
wwv_flow_api.g_varchar2_table(4) := '33302C0A20202020206669656C64526F77733A20352C0A20202020206669656C644D61784C656E6774683A2038302C0A20202020206469616C6F675469746C653A206E756C6C0A20207D2C0A0A20202F2F204C6F6767696E6720666F722022726567756C';
wwv_flow_api.g_varchar2_table(5) := '617222207465787420656C656D656E74730A20206C6F673A2066756E6374696F6E2829207B0A202020207661722061726773203D2041727261792E70726F746F747970652E6A6F696E2E63616C6C2820617267756D656E74732C20272C202720293B0A20';
wwv_flow_api.g_varchar2_table(6) := '202020617065782E64656275672E6D65737361676528342C20226A746C6974656D3A222C2061726773293B0A20207D2C0A20202F2F20456E68616E636564206C6F670A20202F2F20616363657074732032206F626A6563747320666F72206C6F6767696E';
wwv_flow_api.g_varchar2_table(7) := '670A2020656C6F673A2066756E6374696F6E2870312C703229207B0A20202020617065782E64656275672E6D65737361676528342C20226A746C6974656D3A222C2070312C207032293B0A20207D2C0A0A20205F746F70417065783A20617065782E7574';
wwv_flow_api.g_varchar2_table(8) := '696C2E676574546F704170657828292C0A0A20205F696E697447726964436F6E6669673A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869732C0A2020202020202020726567696F6E203D20617065782E726567696F6E2E';
wwv_flow_api.g_varchar2_table(9) := '66696E64436C6F73657374287569772E5F6974656D245B305D293B0A0A202020207569772E6C6F6728225F696E697447726964436F6E66696722293B0A202020207569772E656C6F6728227569772E5F6974656D24222C207569772E5F6974656D24293B';
wwv_flow_api.g_varchar2_table(10) := '0A202020207569772E656C6F672822726567696F6E222C20726567696F6E293B0A0A20202020696620287569772E5F76616C7565732E69674D6F646529207B0A2020202020202F2F207569772E5F656C656D656E74732E2467726964203D20726567696F';
wwv_flow_api.g_varchar2_table(11) := '6E2E77696467657428292E696E74657261637469766547726964282267657443757272656E745669657722293B0A2020202020207569772E5F656C656D656E74732E246967203D20726567696F6E2E77696467657428292E696E74657261637469766547';
wwv_flow_api.g_varchar2_table(12) := '72696428293B0A2020202020207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E746572616374697665477269642822676574566965777322292E677269643B0A2020202020207569772E656C6F6728';
wwv_flow_api.g_varchar2_table(13) := '225F656C656D656E74732E24677269643A222C207569772E5F656C656D656E74732E2467726964293B0A0A202020202020726567696F6E2E77696467657428292E6F6E2822696E7465726163746976656772696473617665222C2066756E6374696F6E28';
wwv_flow_api.g_varchar2_table(14) := '29207B0A20202020202020202F2F20576F756C64206C696B6520746F2063616C6C20636C65617253656C656374696F6E282920696E73746561642C206275742063616E277420666967757265206F757420686F772E0A20202020202020202F2F20547572';
wwv_flow_api.g_varchar2_table(15) := '6E2065646974206F666620746F20666F7263652061206672657368206C6F6164206F66206461746120616761696E2E0A20202020202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F7665';
wwv_flow_api.g_varchar2_table(16) := '20746F206C6561726E206F6620612062657474657220617070726F6163680A20202020202020207569772E5F656C656D656E74732E24677269642E736574456469744D6F64652866616C7365293B0A2020202020207D293B0A0A202020207D0A20202020';
wwv_flow_api.g_varchar2_table(17) := '656C7365207B0A2020202020207569772E6C6F6728226E6F7420616E20494722293B0A202020207D0A0A20207D2C0A0A0A20205F7265736574466F6375733A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869733B0A0A20';
wwv_flow_api.g_varchar2_table(18) := '2020207569772E6C6F6728225F7265736574466F63757322293B0A0A20202020696620287569772E5F76616C7565732E69674D6F646529207B20202F2F2061726520776520696E73696465206120677269643F0A2020202020202F2F2066696E64206F75';
wwv_flow_api.g_varchar2_table(19) := '7220636F6C756D6E20696E2074686520677269640A2020202020207569772E656C6F6728227569772E5F656C656D656E74732E2467726964222C207569772E5F656C656D656E74732E2467726964293B0A2020202020207569772E656C6F672822756977';
wwv_flow_api.g_varchar2_table(20) := '2E5F656C656D656E74732E246967222C207569772E5F656C656D656E74732E246967293B0A0A202020202020766172207265636F72644964203D207569772E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F7264496428756977';
wwv_flow_api.g_varchar2_table(21) := '2E5F656C656D656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B0A20202020202076617220636F6C756D6E203D207569772E5F656C656D656E74732E2469672E696E746572616374';
wwv_flow_api.g_varchar2_table(22) := '6976654772696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C756D6E29207B0A202020202020202072657475726E20636F6C756D6E2E7374617469634964203D3D3D207569772E6F';
wwv_flow_api.g_varchar2_table(23) := '7074696F6E732E6974656D4E616D653B0A2020202020207D295B305D3B0A2020202020202F2F20676F20746F206F75722063656C6C20616E6420666F6375732069742020202020200A2020202020207569772E5F656C656D656E74732E24677269642E76';
wwv_flow_api.g_varchar2_table(24) := '696577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D65293B0A2020202020207569772E5F656C656D656E74732E24677269642E666F63757328293B0A202020207D20656C7365207B0A202020202020';
wwv_flow_api.g_varchar2_table(25) := '2F2F20776520617265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D20746861742063616C6C65642075730A2020202020207569772E5F6974656D242E747269676765722827666F63757327293B0A202020207D0A20';
wwv_flow_api.g_varchar2_table(26) := '207D2C0A0A0A20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F6974656D24203D202428272327202B207569772E6F707469';
wwv_flow_api.g_varchar2_table(27) := '6F6E732E6974656D4E616D65293B0A0A20202020207569772E5F76616C756573203D207B0A20202020202020206669656C6453697A653A2033302C0A20202020202020206669656C644D61784C656E6774683A2038302C0A202020202020202064617461';
wwv_flow_api.g_varchar2_table(28) := '4A534F4E3A207B7D2C0A2020202020202020637572725F6C616E675F696E6465783A20302C0A20202020202020206C616E6775616765733A207B7D2C0A20202020202020207461674D61703A207B7D2C0A20202020202020206D657373616765733A204A';
wwv_flow_api.g_varchar2_table(29) := '534F4E2E7061727365287569772E6F7074696F6E732E6D65737361676573292C0A2020202020202020677269643A206E756C6C2C0A2020202020202020746F74616C4C616E6775616765733A20302C0A202020202020202064697361626C65643A206661';
wwv_flow_api.g_varchar2_table(30) := '6C73652C0A20202020202020206E65775265636F72643A2066616C73652C0A202020202020202069674D6F64653A207569772E6F7074696F6E732E69674D6F64650A20202020207D3B0A0A20202020207569772E5F656C656D656E7473203D207B0A2020';
wwv_flow_api.g_varchar2_table(31) := '2020202020202477696E646F773A207B7D2C0A202020202020202024646F63756D656E743A207B7D2C0A202020202020202024626F64793A207B7D2C0A2020202020202020246974656D7365743A207B7D2C0A2020202020202020246D6C73427574746F';
wwv_flow_api.g_varchar2_table(32) := '6E3A207B7D2C0A20202020202020202469673A207B7D2C0A2020202020202020246469616C6F673A207B7D2C0A2020202020202020246469616C6F67436F6E74656E743A207B7D2C0A20202020202020202473617665427574746F6E3A207B7D2C0A2020';
wwv_flow_api.g_varchar2_table(33) := '2020202020202463616E63656C427574746F6E3A207B7D2C0A202020202020202024627574746F6E436F6E7461696E65723A207B7D0A20202020207D3B0A20207D2C0A0A0A0A20205F6372656174653A2066756E6374696F6E2829207B0A202020207661';
wwv_flow_api.g_varchar2_table(34) := '7220756977203D20746869732C0A2020202020202020696E69744A534F4E203D207B7D3B0A0A202020202F2F204F7074696F6E732061726520616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E732028';
wwv_flow_api.g_varchar2_table(35) := '6F72207569772E6F7074696F6E73290A202020207569772E6C6F6728225F63726561746522293B0A202020207569772E6C6F67287569772E6F7074696F6E732E6974656D4E616D65293B0A0A202020202F2F2068656C7065722066756E6374696F6E2066';
wwv_flow_api.g_varchar2_table(36) := '6F722066696E64696E672074686520696E64657820706F736974696F6E206F66206F75722063757272656E7420646973706C61796564206C616E67756167650A2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B';
wwv_flow_api.g_varchar2_table(37) := '0A2020202020207661722069203D206E756C6C2C0A20202020202020202020696478203D202D313B0A202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B0A20202020';
wwv_flow_api.g_varchar2_table(38) := '20202020696620286A5B695D2E6C203D3D3D206C29207B0A20202020202020202020696478203D20693B0A20202020202020207D0A2020202020207D0A20202020202072657475726E206964783B0A202020207D0A0A202020207569772E5F6372656174';
wwv_flow_api.g_varchar2_table(39) := '655072697661746553746F7261676528293B0A202020207569772E5F696E6974456C656D656E747328293B0A202020207569772E5F696E697442617365456C656D656E747328293B0A0A0A20202020747279207B7569772E5F76616C7565732E6C616E67';
wwv_flow_api.g_varchar2_table(40) := '7561676573203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B7D0A20202020636174636820286529207B636F6E736F6C652E6572726F72282254686520646566696E6564206C616E67756167657320617265';
wwv_flow_api.g_varchar2_table(41) := '206E6F7420666F726D617474656420636F72726563746C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D222C207569772E6F707469';
wwv_flow_api.g_varchar2_table(42) := '6F6E732E6C616E675F636F646573293B7D0A202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B0A0A2020202069662028217569772E5F76616C75';
wwv_flow_api.g_varchar2_table(43) := '65732E69674D6F6465207C7C207569772E656C656D656E742E64617461282276616C756522292029207B0A2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265207468652076616C75652069732073';
wwv_flow_api.g_varchar2_table(44) := '65742076696120646973706C617956616C7565466F7229200A2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75650A202020202020696E69744A534F4E203D207569772E656C656D65';
wwv_flow_api.g_varchar2_table(45) := '6E742E64617461282276616C756522293B0A202020207D0A0A202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765730A202020207569772E5F696E6974446174614A534F4E28696E69744A534F4E293B0A0A2020';
wwv_flow_api.g_varchar2_table(46) := '20202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E670A202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D206C616E67756167655F696E646578287569772E5F76616C75';
wwv_flow_api.g_varchar2_table(47) := '65732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B0A202020200A202020202F2F2053796E63206F7572204A534F4E20646174612D76616C7565206174747269627574652077697468207468652061637475616C2076616C7565';
wwv_flow_api.g_varchar2_table(48) := '20696E2074686520636F7272656374206C616E67756167652C206275740A202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C75';
wwv_flow_api.g_varchar2_table(49) := '65200A202020207569772E5F6974656D240A202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A202020207569772E5F656C656D656E74732E24646F63756D656E74';
wwv_flow_api.g_varchar2_table(50) := '0A202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A0A202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A';
wwv_flow_api.g_varchar2_table(51) := '202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202F2F20496E6974204150455820706167656974656D2066756E6374696F6E730A202020207569';
wwv_flow_api.g_varchar2_table(52) := '772E5F696E6974417065784974656D28293B0A0A202020202F2F20617065782E6A51756572792877696E646F77292E6F6E28227468656D6534327265616479222C2066756E6374696F6E2829207B0A20202020617065782E6A51756572792877696E646F';
wwv_flow_api.g_varchar2_table(53) := '77292E6F6E2822696E74657261637469766567726964766965776D6F64656C637265617465222C2066756E6374696F6E286576656E742C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C7469706C652049473F0A202020';
wwv_flow_api.g_varchar2_table(54) := '2020202F2F20696E69742074686520677269642076616C7565732C20627574207761697420756E74696C2074686520677269642069732072656164790A2020202020207569772E5F696E697447726964436F6E66696728293B0A202020207D293B0A0A20';
wwv_flow_api.g_varchar2_table(55) := '207D2C0A0A0A0A20205F696E6974417065784974656D3A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869733B0A0A202020207569772E6C6F6728225F696E6974417065784974656D222C20225265676973746572696E67';
wwv_flow_api.g_varchar2_table(56) := '207769746820617065782E6974656D2E63726561746520666F722022202B207569772E6F7074696F6E732E6974656D4E616D65293B0A202020202F2F2053657420616E64206765742076616C75652076696120617065782066756E6374696F6E730A2020';
wwv_flow_api.g_varchar2_table(57) := '2020617065782E6974656D2E637265617465287569772E6F7074696F6E732E6974656D4E616D652C207B0A0A2020202020202073657456616C75653A2066756E6374696F6E287056616C75652C2070446973706C617956616C756529207B0A2020202020';
wwv_flow_api.g_varchar2_table(58) := '20202020207569772E6C6F67282022617065782E6974656D2E73657456616C7565222C207056616C75652C2070446973706C617956616C7565293B0A0A202020202020202020207569772E5F696E6974446174614A534F4E284A534F4E2E706172736528';
wwv_flow_api.g_varchar2_table(59) := '7056616C7565207C7C20227B7D2229293B0A0A202020202020202020206966202870446973706C617956616C7565207C7C20217056616C7565207C7C207056616C75652E6C656E677468203D3D3D203029207B0A20202020202020202020202020202F2F';
wwv_flow_api.g_varchar2_table(60) := '20656D707479207056616C75650A202020202020202020207D20656C7365207B0A20202020202020202020202020202F2F204E4F5420656D707479207056616C75650A2020202020202020202020202020696620282170446973706C617956616C756529';
wwv_flow_api.g_varchar2_table(61) := '207B0A2020202020202020202020202020202070446973706C617956616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A20202020202020202020202020207D0A0A20202020202020202020202020207569772E';
wwv_flow_api.g_varchar2_table(62) := '5F6974656D242E76616C2870446973706C617956616C7565293B0A202020202020202020207D0A0A202020202020207D2C0A2020202020202067657456616C75653A2066756E6374696F6E2829207B0A2020202020202020202072657475726E204A534F';
wwv_flow_api.g_varchar2_table(63) := '4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E293B0A202020202020207D2C0A20202020202020736574466F6375733A2066756E6374696F6E2829207B0A202020202020202020207569772E5F6974656D242E74726967';
wwv_flow_api.g_varchar2_table(64) := '6765722822666F63757322293B0A202020202020207D2C0A20202020202020656E61626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E656E61626C6528293B0A202020202020207D2C0A2020202020202064697361626C65';
wwv_flow_api.g_varchar2_table(65) := '3A2066756E6374696F6E2829207B0A202020202020202020207569772E64697361626C6528293B0A202020202020207D2C0A20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056616C756529207B0A202020202020';
wwv_flow_api.g_varchar2_table(66) := '20202020766172206A746C4A534F4E203D207B7D3B0A202020202020202020202F2F205468652049472063616C6C73207468697320636F646520746F207365742074686520696E697469616C20646973706C61792076616C7565730A2020202020202020';
wwv_flow_api.g_varchar2_table(67) := '20207569772E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C207056616C7565293B0A20202020202020202020696620287056616C756529207B0A202020202020202020202020747279207B202F2F206A757374207072';
wwv_flow_api.g_varchar2_table(68) := '6F7465637420757320696620746865204A534F4E20697320696E76616C69640A20202020202020202020202020206A746C4A534F4E203D204A534F4E2E7061727365287056616C7565293B0A2020202020202020202020207D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(69) := '2020636174636820286529207B0A2020202020202020202020207D0A0A0A202020202020202020207D0A202020202020202020207569772E5F696E6974446174614A534F4E286A746C4A534F4E293B0A2020202020202020202072657475726E20756977';
wwv_flow_api.g_varchar2_table(70) := '2E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A202020202020207D0A202020207D293B0A0A20207D2C0A0A0A20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869';
wwv_flow_api.g_varchar2_table(71) := '733B0A0A20202020207569772E5F656C656D656E74732E2477696E646F77203D20242877696E646F77293B0A20202020207569772E5F656C656D656E74732E24646F63756D656E74203D202428646F63756D656E74293B0A20202020207569772E5F656C';
wwv_flow_api.g_varchar2_table(72) := '656D656E74732E24626F6479203D202428646F63756D656E742E626F6479293B0A0A20207D2C0A0A0A20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20';
wwv_flow_api.g_varchar2_table(73) := '202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D202428276469762E6A746C6974656D2D636F6E74656E7427293B0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D20242827627574';
wwv_flow_api.g_varchar2_table(74) := '746F6E2E6A746C6974656D2D736176652D627574746F6E27293B0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D20242827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B0A0A2020';
wwv_flow_api.g_varchar2_table(75) := '7D2C0A0A0A20205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E6C6F672820225F696E697442617365456C656D656E747322293B0A202020';
wwv_flow_api.g_varchar2_table(76) := '20207569772E656C6F67282022656C656D656E74222C207569772E656C656D656E74293B0A0A20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D202254455854223F20';
wwv_flow_api.g_varchar2_table(77) := '7569772E5F6974656D242E61747472282273697A652229203A207569772E5F6974656D242E617474722822636F6C7322293B0A2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D202254455854415245412229207B0A20';
wwv_flow_api.g_varchar2_table(78) := '2020202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F6974656D242E617474722822726F777322293B0A20202020207D0A20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E';
wwv_flow_api.g_varchar2_table(79) := '5F6974656D242E6174747228226D61786C656E67746822293B0A0A20202020202F2F205374617274696E67207769746820415045582031382E3120746865206974656D2073657420697320746865206974656D5772617070657220636C6173730A202020';
wwv_flow_api.g_varchar2_table(80) := '20207569772E5F656C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B0A20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74732E246974656D73';
wwv_flow_api.g_varchar2_table(81) := '65742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B0A20207D2C0A0A0A20205F73796E634C616E67756167654D61703A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A20';
wwv_flow_api.g_varchar2_table(82) := '202020202020202069203D206E756C6C2C0A20202020202020202074616773203D207B7D3B0A0A20202020207569772E6C6F672820225F73796E634C616E67756167654D617022293B0A202020202074616773203D207569772E5F76616C7565732E6461';
wwv_flow_api.g_varchar2_table(83) := '74614A534F4E3B0A0A20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A736F6E2D61727261792F0A20202020207569772E5F76616C7565732E7461674D';
wwv_flow_api.g_varchar2_table(84) := '6170203D207B7D3B0A2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B0A2020202020202020207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B69';
wwv_flow_api.g_varchar2_table(85) := '5D2E746C3B0A2020202020202020202F2F20636F6E736F6C652E6C6F6728692C20225B22202B20746167735B695D2E6C202B20225D203D20222C20746167735B695D2E746C290A20202020207D0A2020202020200A20207D2C0A0A0A20202F2F20676574';
wwv_flow_api.g_varchar2_table(86) := '20746865206C616E67756167652076616C756520666F72206120676976656E206C616E677561676520636F64650A20205F676574544C3A2066756E6374696F6E286C616E67436F646529207B0A202020202076617220756977203D20746869733B0A2020';
wwv_flow_api.g_varchar2_table(87) := '20202072657475726E207569772E5F76616C7565732E7461674D61705B6C616E67436F64655D3B0A20207D2C0A0A0A0A20202F2F20657870656374732061206A746C4A534F4E20737472756374757265206F7220616E20656D707479206F626A6563740A';
wwv_flow_api.g_varchar2_table(88) := '20205F696E6974446174614A534F4E3A2066756E6374696F6E286A746C4A534F4E297B0A202020202076617220756977203D20746869732C0A2020202020202020206A736F6E44617461203D205B5D2C0A202020202020202020696E7075745F64617461';
wwv_flow_api.g_varchar2_table(89) := '203D206A746C4A534F4E207C7C207B7D3B0A0A2020202020202020207569772E6C6F6728225F696E6974446174614A534F4E22293B0A2020202020202020207569772E656C6F67287B696E7075745F646174617D293B0A0A202020202069662028617065';
wwv_flow_api.g_varchar2_table(90) := '782E6A51756572792E6973456D7074794F626A65637428696E7075745F646174612929207B0A20202020202020207569772E6C6F672822496E697469616C697A696E67207769746820656D7074792076616C756522293B0A0A20202020202020202F2F20';
wwv_flow_api.g_varchar2_table(91) := '546865207265636F726420697320656D70747920736F207765206275696C642061200A20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A0A20202020202020202F2F20';
wwv_flow_api.g_varchar2_table(92) := '205B207B226C223A20227573222C2022746C223A202250726F6A65637420416E616C79736973227D0A20202020202020202F2F20202C207B226C223A20226672222C2022746C223A2022416E616C7973652064652070726F6A6574227D0A202020202020';
wwv_flow_api.g_varchar2_table(93) := '20202F2F20202C207B226C223A20226573222C2022746C223A2022416E616C697369732064652070726F6A6563746F227D5D0A20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E286C29';
wwv_flow_api.g_varchar2_table(94) := '207B0A20202020202020202020206A736F6E446174612E70757368287B226C223A206C2C2022746C223A2022227D293B0A20202020202020207D293B0A0A20202020202020207569772E5F76616C7565732E646174614A534F4E203D206A736F6E446174';
wwv_flow_api.g_varchar2_table(95) := '613B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B0A20202020207D0A2020202020656C7365207B0A202020202020207569772E5F76616C7565732E646174614A534F4E203D20696E7075745F64617461';
wwv_flow_api.g_varchar2_table(96) := '3B0A202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A20202020207D0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A0A20207D2C0A0A0A0A20205F73796E634A534F4E646174';
wwv_flow_api.g_varchar2_table(97) := '613A2066756E6374696F6E286576656E744F626A29207B0A20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C0A2020202020766172207569772C0A2020202020202020206C616E675F696E6465783B0A0A202020';
wwv_flow_api.g_varchar2_table(98) := '202069662028747970656F66206576656E744F626A20213D2022756E646566696E65642229207B0A20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E740A2020202020202020756977203D206576656E744F626A';
wwv_flow_api.g_varchar2_table(99) := '2E646174612E7569773B0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F206469726563742063616C6C0A2020202020202020756977203D20746869733B0A20202020207D0A20202020207569772E6C6F6728225F73796E634A';
wwv_flow_api.g_varchar2_table(100) := '534F4E6461746122293B0A0A20202020206C616E675F696E646578203D207569772E5F76616C7565732E637572725F6C616E675F696E6465783B0A0A2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B0A202020202020';
wwv_flow_api.g_varchar2_table(101) := '20202F2F204F6E206E6577207265636F72642077652077616E7420746F207361766520746865206E657720656E74657265642076616C756520696E746F2074686520414C4C207468650A20202020202020202F2F207265636F72647320696E2074686520';
wwv_flow_api.g_varchar2_table(102) := '4A534F4E207374727563747572650A2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B0A202020202020202020207569772E5F7661';
wwv_flow_api.g_varchar2_table(103) := '6C7565732E646174614A534F4E5B695D2E746C203D207569772E5F6974656D242E76616C28293B0A20202020202020207D0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F207361766520746865206E6577207465787420696E';
wwv_flow_api.g_varchar2_table(104) := '746F20746865204A534F4E2073747275637475726520666F72207468652063757272656E74206C616E67756167650A20202020202020207569772E5F76616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D207569772E5F6974';
wwv_flow_api.g_varchar2_table(105) := '656D242E76616C28293B0A20202020207D0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A20207D2C0A0A0A0A20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B0A202020202076617220';
wwv_flow_api.g_varchar2_table(106) := '756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C4275';
wwv_flow_api.g_varchar2_table(107) := '74746F6E436C69636B293B0A0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E';
wwv_flow_api.g_varchar2_table(108) := '436C69636B293B0A0A20207D2C0A0A0A20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A0A';
wwv_flow_api.g_varchar2_table(109) := '20202020202F2F20696620746865206469616C6F67206F70656E732C207765277265206E6F742061206E6577207265636F726420616E79206D6F72650A20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A2020';
wwv_flow_api.g_varchar2_table(110) := '2020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A0A20207D2C0A0A0A0A20205F6861';
wwv_flow_api.g_varchar2_table(111) := '6E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569772C0A202020202020202020646973706C61795F76616C75653B0A';
wwv_flow_api.g_varchar2_table(112) := '0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E28692C656C297B0A20202020202020202F2F206C6F6F70207468726F75';
wwv_flow_api.g_varchar2_table(113) := '676820616C6C206469616C6F6720656C656D656E747320616E642073746F7265207472616E736C6174696F6E730A20202020202020202F2F206261636B20696E746F2074686520646174614A534F4E207374727563747572650A20202020202020207569';
wwv_flow_api.g_varchar2_table(114) := '772E6C6F672869202B20222822202B20656C2E646174617365742E6C616E67202B2022293A22202B20656C2E76616C7565293B0A0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E';
wwv_flow_api.g_varchar2_table(115) := '6C616E673B0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C75653B0A2020202020202020696620287569772E5F76616C7565732E637572725F6C616E675F696E646578203D3D206929207B';
wwv_flow_api.g_varchar2_table(116) := '0A2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B0A20202020202020207D0A20202020207D293B0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A0A20202020202F2F2077652772';
wwv_flow_api.g_varchar2_table(117) := '6520646F6E652022736176696E6722206261636B2066726F6D20746865206469616C6F672C20636C65617220746865206E65775265636F726420666C61670A20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A';
wwv_flow_api.g_varchar2_table(118) := '20202020207569772E5F6974656D242E76616C28646973706C61795F76616C7565293B0A20202020207569772E5F7369676E616C4368616E676528293B0A0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C';
wwv_flow_api.g_varchar2_table(119) := '6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A20207D2C0A0A0A20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B0A202020202076617220756977';
wwv_flow_api.g_varchar2_table(120) := '203D20746869733B0A0A20202020202F2F204E65656420746F2075736520617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B0A202020202061706578';
wwv_flow_api.g_varchar2_table(121) := '2E6A5175657279287569772E5F6974656D245B305D292E7472696767657228276368616E676527293B0A20207D2C0A0A0A20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A20202020207661722075';
wwv_flow_api.g_varchar2_table(122) := '6977203D206576656E744F626A2E646174612E7569773B0A0A20202020207569772E6C6F6728225F68616E646C654F70656E436C69636B22293B0A0A20202020207569772E5F73796E634A534F4E64617461286576656E744F626A293B0A202020202075';
wwv_flow_api.g_varchar2_table(123) := '69772E5F73686F774469616C6F6728293B0A20207D2C0A0A0A20205F73686F774469616C6F673A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A2020202020202020206C616E675461626C652C0A202020202020';
wwv_flow_api.g_varchar2_table(124) := '202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F696E6465782C0A2020202020202020206469616C6F6748746D6C3B0A0A20202020207569772E6C6F6728225F73686F774469616C6F6722293B0A0A20202020';
wwv_flow_api.g_varchar2_table(125) := '206C616E675461626C65203D200A2020202020202020202020273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E27202B0A20202020';
wwv_flow_api.g_varchar2_table(126) := '2020202020202027203C74723E5C6E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C48656164223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C';
wwv_flow_api.g_varchar2_table(127) := '202B20273C2F74683E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C756520';
wwv_flow_api.g_varchar2_table(128) := '2B20273C2F74683E27202B0A202020202020202020202027203C2F74723E5C6E273B0A20202020202020202020202F2F2027203C74723E5C6E273B0A0A2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E63';
wwv_flow_api.g_varchar2_table(129) := '74696F6E2820696E6465782C206C616E672029207B0A202020202020206C616E675461626C65202B3D0A2020202020202027203C747227202B2028637572725F6C616E673D3D696E6465783F202720636C6173733D2273656C656374656422273A272729';
wwv_flow_api.g_varchar2_table(130) := '202B20273E5C6E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443223E27202B20617065782E7574696C2E65736361706548544D4C4174';
wwv_flow_api.g_varchar2_table(131) := '7472286C616E6729202B20273C2F74643E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C223E273B0A20202020202020696620287569';
wwv_flow_api.g_varchar2_table(132) := '772E6F7074696F6E732E6974656D54797065203D3D3D2022544558542229207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C696E70757420747970653D22746578742220636C6173733D22746578745F';
wwv_flow_api.g_varchar2_table(133) := '6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B2027222076616C75653D2227202B20617065782E7574696C2E65736361706548544D4C4174747228756977';
wwv_flow_api.g_varchar2_table(134) := '2E5F676574544C286C616E672929202B2027222073697A653D2227202B207569772E5F76616C7565732E6669656C6453697A65202B202722206D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B';
wwv_flow_api.g_varchar2_table(135) := '2027223E3C2F74643E273B0A202020202020207D0A20202020202020656C7365207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C746578746172656120636C6173733D22746578746172656120617065';
wwv_flow_api.g_varchar2_table(136) := '782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B20272227202B0A20202020202020202020202020202720636F6C733D2227202B207569772E5F76616C7565732E666965';
wwv_flow_api.g_varchar2_table(137) := '6C6453697A65202B20272220726F77733D2227202B207569772E5F76616C7565732E6669656C64526F7773202B20272227202B200A202020202020202020202020202027206D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C';
wwv_flow_api.g_varchar2_table(138) := '644D61784C656E677468202B20272227202B200A2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F676574544C286C616E672929202B20273C2F74657874617265613E273B0A';
wwv_flow_api.g_varchar2_table(139) := '202020202020207D0A0A202020202020206C616E675461626C65202B3D0A202020202020202027203C2F74723E5C6E273B0A20202020207D293B0A20202020206C616E675461626C65202B3D0A2020202020273C2F7461626C653E5C6E273B0A0A202020';
wwv_flow_api.g_varchar2_table(140) := '2020206469616C6F6748746D6C203D0A2020202020202020202020273C64697620636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E27';
wwv_flow_api.g_varchar2_table(141) := '202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D';
wwv_flow_api.g_varchar2_table(142) := '2D63616E63656C2D627574746F6E20742D427574746F6E223E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C7565732E6D657373616765';
wwv_flow_api.g_varchar2_table(143) := '732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B0A20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D2275692D69636F6E2075692D69636F6E2D636C6F7365223E3C2F7370616E3E27202B200A20';
wwv_flow_api.g_varchar2_table(144) := '202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E';
wwv_flow_api.g_varchar2_table(145) := '2D2D686F74223E27202B200A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C794368616E676573202B20';
wwv_flow_api.g_varchar2_table(146) := '273C2F7370616E3E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E27202B200A20202020202020202020';
wwv_flow_api.g_varchar2_table(147) := '202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D636F6E74656E74223E5C6E27202B0A202020';
wwv_flow_api.g_varchar2_table(148) := '20202020202020202020206C616E675461626C65202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A2020202020202020202020273C2F6469763E3C2F6469763E5C6E273B0A0A20202020207569772E5F656C656D656E74732E2462';
wwv_flow_api.g_varchar2_table(149) := '6F64792E617070656E64286469616C6F6748746D6C293B0A0A20202020202F2F2072656164792061206469616C6F6720636F6E7461696E6572206279206372656174696E672061206469760A20202020207569772E5F656C656D656E74732E246469616C';
wwv_flow_api.g_varchar2_table(150) := '6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B0A0A20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F670A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F';
wwv_flow_api.g_varchar2_table(151) := '67287B0A202020202020202020636C6F73654F6E4573636170653A20747275652C0A2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C0A2020202020202020206175746F52657369';
wwv_flow_api.g_varchar2_table(152) := '7A653A20202020747275652C0A2020202020202020206D696E57696474683A2020202020203430302C0A2020202020202020206D696E4865696768743A20202020203235302C0A20202020202020202077696474683A202020202020202020276175746F';
wwv_flow_api.g_varchar2_table(153) := '272C0A2020202020202020206865696768743A2020202020202020276175746F272C0A2020202020202020206D6F64616C3A202020202020202020747275652C0A202020202020202020706F736974696F6E3A2020202020207B206D793A20226C656674';
wwv_flow_api.g_varchar2_table(154) := '222C2061743A20226C6566742063656E746572222C206F663A207569772E5F6974656D245B305D207D2C0A2020202020202020206F70656E3A2066756E6374696F6E2829207B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E';
wwv_flow_api.g_varchar2_table(155) := '617669676174696F6E2E626567696E467265657A655363726F6C6C28293B0A2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B0A2020202020202020202020207569772E5F696E69744469616C6F67427574';
wwv_flow_api.g_varchar2_table(156) := '746F6E7328293B0A0A2020202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565206F66207468652063757272656E74206C616E6775616765200A2020202020202020202020207569772E5F656C656D656E74732E';
wwv_flow_api.g_varchar2_table(157) := '246469616C6F67436F6E74656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C756527292E747269676765722827666F63757327293B0A2020202020202020207D2C0A202020202020202020636C6F73653A2066756E63';
wwv_flow_api.g_varchar2_table(158) := '74696F6E2829207B0A0A202020202020202020202020242874686973292E6469616C6F67282764657374726F7927293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B0A20202020202020';
wwv_flow_api.g_varchar2_table(159) := '20202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E6176696761';
wwv_flow_api.g_varchar2_table(160) := '74696F6E2E656E64467265657A655363726F6C6C28293B0A0A2020202020202020202020207569772E5F7265736574466F63757328293B0A2020202020202020207D0A202020202020207D290A202020202020202E6F6E28276B6579646F776E272C2066';
wwv_flow_api.g_varchar2_table(161) := '756E6374696F6E2865767429207B0A2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B0A2020202020202020202020202020207569772E5F656C656D656E74732E2464';
wwv_flow_api.g_varchar2_table(162) := '69616C6F672E6469616C6F672827636C6F736527293B0A20202020202020202020207D202020202020202020202020202020200A20202020202020202020206576742E73746F7050726F7061676174696F6E28293B0A202020202020207D293B0A0A0A20';
wwv_flow_api.g_varchar2_table(163) := '207D2C0A0A0A202064697361626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B0A2020202020';
wwv_flow_api.g_varchar2_table(164) := '2020207569772E5F6974656D240A20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B0A0A20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(165) := '2E61747472282764697361626C6564272C2764697361626C656427290A20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B0A20202020207D0A0A20202020207569772E5F7661';
wwv_flow_api.g_varchar2_table(166) := '6C7565732E64697361626C6564203D20747275653B0A20207D2C0A0A0A2020656E61626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E6469736162';
wwv_flow_api.g_varchar2_table(167) := '6C6564203D3D3D207472756529207B0A202020202020207569772E5F6974656D242E72656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A20202020202020202020';
wwv_flow_api.g_varchar2_table(168) := '2E72656D6F766541747472282764697361626C656427290A202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202020207569772E5F76616C';
wwv_flow_api.g_varchar2_table(169) := '7565732E64697361626C6564203D2066616C73653B0A20202020207D0A20207D0A7D293B0A0A2F2F2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10592650936675591)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'js/jtl_item.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076312E31202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052696D';
wwv_flow_api.g_varchar2_table(2) := '626C617320C2A920323031372D323032300A2A2F0A242E776964676574282275692E6A746C4974656D222C7B6F7074696F6E733A7B6C616E673A22656E222C6C616E675F636F6465733A5B5D2C6D657373616765733A6E756C6C2C6974656D4E616D653A';
wwv_flow_api.g_varchar2_table(3) := '22222C6669656C6453697A653A33302C6669656C64526F77733A352C6669656C644D61784C656E6774683A38302C6469616C6F675469746C653A6E756C6C7D2C6C6F673A66756E6374696F6E28297B76617220653D41727261792E70726F746F74797065';
wwv_flow_api.g_varchar2_table(4) := '2E6A6F696E2E63616C6C28617267756D656E74732C222C2022293B617065782E64656275672E6D65737361676528342C226A746C6974656D3A222C65297D2C656C6F673A66756E6374696F6E28652C74297B617065782E64656275672E6D657373616765';
wwv_flow_api.g_varchar2_table(5) := '28342C226A746C6974656D3A222C652C74297D2C5F746F70417065783A617065782E7574696C2E676574546F704170657828292C5F696E697447726964436F6E6669673A66756E6374696F6E28297B76617220653D746869732C743D617065782E726567';
wwv_flow_api.g_varchar2_table(6) := '696F6E2E66696E64436C6F7365737428652E5F6974656D245B305D293B652E6C6F6728225F696E697447726964436F6E66696722292C652E656C6F6728227569772E5F6974656D24222C652E5F6974656D24292C652E656C6F672822726567696F6E222C';
wwv_flow_api.g_varchar2_table(7) := '74292C652E5F76616C7565732E69674D6F64653F28652E5F656C656D656E74732E2469673D742E77696467657428292E696E7465726163746976654772696428292C652E5F656C656D656E74732E24677269643D742E77696467657428292E696E746572';
wwv_flow_api.g_varchar2_table(8) := '616374697665477269642822676574566965777322292E677269642C652E656C6F6728225F656C656D656E74732E24677269643A222C652E5F656C656D656E74732E2467726964292C742E77696467657428292E6F6E2822696E74657261637469766567';
wwv_flow_api.g_varchar2_table(9) := '72696473617665222C66756E6374696F6E28297B652E5F656C656D656E74732E24677269642E736574456469744D6F6465282131297D29293A652E6C6F6728226E6F7420616E20494722297D2C5F7265736574466F6375733A66756E6374696F6E28297B';
wwv_flow_api.g_varchar2_table(10) := '76617220653D746869733B696628652E6C6F6728225F7265736574466F63757322292C652E5F76616C7565732E69674D6F6465297B652E656C6F6728227569772E5F656C656D656E74732E2467726964222C652E5F656C656D656E74732E246772696429';
wwv_flow_api.g_varchar2_table(11) := '2C652E656C6F6728227569772E5F656C656D656E74732E246967222C652E5F656C656D656E74732E246967293B76617220743D652E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F7264496428652E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(12) := '677269642E76696577242E67726964282267657453656C65637465645265636F72647322295B305D292C693D652E5F656C656D656E74732E2469672E696E7465726163746976654772696428226F7074696F6E22292E636F6E6669672E636F6C756D6E73';
wwv_flow_api.g_varchar2_table(13) := '2E66696C7465722866756E6374696F6E2874297B72657475726E20742E73746174696349643D3D3D652E6F7074696F6E732E6974656D4E616D657D295B305D3B652E5F656C656D656E74732E24677269642E76696577242E677269642822676F746F4365';
wwv_flow_api.g_varchar2_table(14) := '6C6C222C742C692E6E616D65292C652E5F656C656D656E74732E24677269642E666F63757328297D656C736520652E5F6974656D242E747269676765722822666F63757322297D2C5F6372656174655072697661746553746F726167653A66756E637469';
wwv_flow_api.g_varchar2_table(15) := '6F6E28297B746869732E5F6974656D243D24282223222B746869732E6F7074696F6E732E6974656D4E616D65292C746869732E5F76616C7565733D7B6669656C6453697A653A33302C6669656C644D61784C656E6774683A38302C646174614A534F4E3A';
wwv_flow_api.g_varchar2_table(16) := '7B7D2C637572725F6C616E675F696E6465783A302C6C616E6775616765733A7B7D2C7461674D61703A7B7D2C6D657373616765733A4A534F4E2E706172736528746869732E6F7074696F6E732E6D65737361676573292C677269643A6E756C6C2C746F74';
wwv_flow_api.g_varchar2_table(17) := '616C4C616E6775616765733A302C64697361626C65643A21312C6E65775265636F72643A21312C69674D6F64653A746869732E6F7074696F6E732E69674D6F64657D2C746869732E5F656C656D656E74733D7B2477696E646F773A7B7D2C24646F63756D';
wwv_flow_api.g_varchar2_table(18) := '656E743A7B7D2C24626F64793A7B7D2C246974656D7365743A7B7D2C246D6C73427574746F6E3A7B7D2C2469673A7B7D2C246469616C6F673A7B7D2C246469616C6F67436F6E74656E743A7B7D2C2473617665427574746F6E3A7B7D2C2463616E63656C';
wwv_flow_api.g_varchar2_table(19) := '427574746F6E3A7B7D2C24627574746F6E436F6E7461696E65723A7B7D7D7D2C5F6372656174653A66756E6374696F6E28297B76617220653D746869732C743D7B7D3B652E6C6F6728225F63726561746522292C652E6C6F6728652E6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(20) := '6974656D4E616D65292C652E5F6372656174655072697661746553746F7261676528292C652E5F696E6974456C656D656E747328292C652E5F696E697442617365456C656D656E747328293B7472797B652E5F76616C7565732E6C616E6775616765733D';
wwv_flow_api.g_varchar2_table(21) := '4A534F4E2E706172736528652E6F7074696F6E732E6C616E675F636F646573297D63617463682874297B636F6E736F6C652E6572726F72282254686520646566696E6564206C616E67756167657320617265206E6F7420666F726D617474656420636F72';
wwv_flow_api.g_varchar2_table(22) := '726563746C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D222C652E6F7074696F6E732E6C616E675F636F646573297D652E5F7661';
wwv_flow_api.g_varchar2_table(23) := '6C7565732E746F74616C4C616E6775616765733D652E5F76616C7565732E6C616E6775616765732E6C656E6774682C652E5F76616C7565732E69674D6F6465262621652E656C656D656E742E64617461282276616C756522297C7C28743D652E656C656D';
wwv_flow_api.g_varchar2_table(24) := '656E742E64617461282276616C75652229292C652E5F696E6974446174614A534F4E2874292C652E5F76616C7565732E637572725F6C616E675F696E6465783D66756E6374696F6E28652C74297B76617220693D6E756C6C2C613D2D313B666F7228693D';
wwv_flow_api.g_varchar2_table(25) := '303B652E6C656E6774683E6926262D313D3D613B692B3D3129655B695D2E6C3D3D3D74262628613D69293B72657475726E20617D28652E5F76616C7565732E646174614A534F4E2C652E6F7074696F6E732E6C616E67292C652E5F6974656D242E62696E';
wwv_flow_api.g_varchar2_table(26) := '6428226368616E6765222C7B7569773A657D2C652E5F73796E634A534F4E64617461292C652E5F656C656D656E74732E24646F63756D656E742E62696E642822617065786265666F7265706167657375626D6974222C7B7569773A657D2C652E5F73796E';
wwv_flow_api.g_varchar2_table(27) := '634A534F4E64617461292C652E5F656C656D656E74732E246D6C73427574746F6E2E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C652E5F696E6974417065784974656D28292C617065782E6A51';
wwv_flow_api.g_varchar2_table(28) := '756572792877696E646F77292E6F6E2822696E74657261637469766567726964766965776D6F64656C637265617465222C66756E6374696F6E28742C69297B652E5F696E697447726964436F6E66696728297D297D2C5F696E6974417065784974656D3A';
wwv_flow_api.g_varchar2_table(29) := '66756E6374696F6E28297B76617220653D746869733B652E6C6F6728225F696E6974417065784974656D222C225265676973746572696E67207769746820617065782E6974656D2E63726561746520666F7220222B652E6F7074696F6E732E6974656D4E';
wwv_flow_api.g_varchar2_table(30) := '616D65292C617065782E6974656D2E63726561746528652E6F7074696F6E732E6974656D4E616D652C7B73657456616C75653A66756E6374696F6E28742C69297B652E6C6F672822617065782E6974656D2E73657456616C7565222C742C69292C652E5F';
wwv_flow_api.g_varchar2_table(31) := '696E6974446174614A534F4E284A534F4E2E706172736528747C7C227B7D2229292C697C7C21747C7C303D3D3D742E6C656E6774687C7C28697C7C28693D652E5F676574544C28652E6F7074696F6E732E6C616E6729292C652E5F6974656D242E76616C';
wwv_flow_api.g_varchar2_table(32) := '286929297D2C67657456616C75653A66756E6374696F6E28297B72657475726E204A534F4E2E737472696E6769667928652E5F76616C7565732E646174614A534F4E297D2C736574466F6375733A66756E6374696F6E28297B652E5F6974656D242E7472';
wwv_flow_api.g_varchar2_table(33) := '69676765722822666F63757322297D2C656E61626C653A66756E6374696F6E28297B652E656E61626C6528297D2C64697361626C653A66756E6374696F6E28297B652E64697361626C6528297D2C646973706C617956616C7565466F723A66756E637469';
wwv_flow_api.g_varchar2_table(34) := '6F6E2874297B76617220693D7B7D3B696628652E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C74292C74297472797B693D4A534F4E2E70617273652874297D63617463682865297B7D72657475726E20652E5F696E69';
wwv_flow_api.g_varchar2_table(35) := '74446174614A534F4E2869292C652E5F676574544C28652E6F7074696F6E732E6C616E67297D7D297D2C5F696E6974456C656D656E74733A66756E6374696F6E28297B746869732E5F656C656D656E74732E2477696E646F773D242877696E646F77292C';
wwv_flow_api.g_varchar2_table(36) := '746869732E5F656C656D656E74732E24646F63756D656E743D2428646F63756D656E74292C746869732E5F656C656D656E74732E24626F64793D2428646F63756D656E742E626F6479297D2C5F696E69744469616C6F67456C656D656E74733A66756E63';
wwv_flow_api.g_varchar2_table(37) := '74696F6E28297B746869732E5F656C656D656E74732E246469616C6F67436F6E74656E743D2428226469762E6A746C6974656D2D636F6E74656E7422292C746869732E5F656C656D656E74732E2473617665427574746F6E3D242822627574746F6E2E6A';
wwv_flow_api.g_varchar2_table(38) := '746C6974656D2D736176652D627574746F6E22292C746869732E5F656C656D656E74732E2463616E63656C427574746F6E3D242822627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E22297D2C5F696E697442617365456C656D656E';
wwv_flow_api.g_varchar2_table(39) := '74733A66756E6374696F6E28297B76617220653D746869733B652E6C6F6728225F696E697442617365456C656D656E747322292C652E656C6F672822656C656D656E74222C652E656C656D656E74292C652E5F76616C7565732E6669656C6453697A653D';
wwv_flow_api.g_varchar2_table(40) := '2254455854223D3D3D652E6F7074696F6E732E6974656D547970653F652E5F6974656D242E61747472282273697A6522293A652E5F6974656D242E617474722822636F6C7322292C225445585441524541223D3D3D652E6F7074696F6E732E6974656D54';
wwv_flow_api.g_varchar2_table(41) := '797065262628652E5F76616C7565732E6669656C64526F77733D652E5F6974656D242E617474722822726F77732229292C652E5F76616C7565732E6669656C644D61784C656E6774683D652E5F6974656D242E6174747228226D61786C656E6774682229';
wwv_flow_api.g_varchar2_table(42) := '2C652E5F656C656D656E74732E246974656D7365743D652E5F6974656D242E706172656E7428292C652E5F656C656D656E74732E246D6C73427574746F6E3D652E5F656C656D656E74732E246974656D7365742E66696E642822627574746F6E2E6A746C';
wwv_flow_api.g_varchar2_table(43) := '6974656D2D6D6F64616C2D6F70656E22297D2C5F73796E634C616E67756167654D61703A66756E6374696F6E28297B76617220652C743D6E756C6C3B666F7228746869732E6C6F6728225F73796E634C616E67756167654D617022292C653D746869732E';
wwv_flow_api.g_varchar2_table(44) := '5F76616C7565732E646174614A534F4E2C746869732E5F76616C7565732E7461674D61703D7B7D2C743D303B652E6C656E6774683E743B742B3D3129746869732E5F76616C7565732E7461674D61705B655B745D2E6C5D3D655B745D2E746C7D2C5F6765';
wwv_flow_api.g_varchar2_table(45) := '74544C3A66756E6374696F6E2865297B72657475726E20746869732E5F76616C7565732E7461674D61705B655D7D2C5F696E6974446174614A534F4E3A66756E6374696F6E2865297B76617220743D5B5D2C693D657C7C7B7D3B746869732E6C6F672822';
wwv_flow_api.g_varchar2_table(46) := '5F696E6974446174614A534F4E22292C746869732E656C6F67287B696E7075745F646174613A697D292C617065782E6A51756572792E6973456D7074794F626A6563742869293F28746869732E6C6F672822496E697469616C697A696E67207769746820';
wwv_flow_api.g_varchar2_table(47) := '656D7074792076616C756522292C746869732E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E2865297B742E70757368287B6C3A652C746C3A22227D297D292C746869732E5F76616C7565732E646174614A534F4E';
wwv_flow_api.g_varchar2_table(48) := '3D742C746869732E5F76616C7565732E6E65775265636F72643D2130293A28746869732E5F76616C7565732E646174614A534F4E3D692C746869732E5F76616C7565732E6E65775265636F72643D2131292C746869732E5F73796E634C616E6775616765';
wwv_flow_api.g_varchar2_table(49) := '4D617028297D2C5F73796E634A534F4E646174613A66756E6374696F6E2865297B76617220742C693B69662828743D766F69642030213D3D653F652E646174612E7569773A74686973292E6C6F6728225F73796E634A534F4E6461746122292C693D742E';
wwv_flow_api.g_varchar2_table(50) := '5F76616C7565732E637572725F6C616E675F696E6465782C742E5F76616C7565732E6E65775265636F726429666F722876617220613D742E5F76616C7565732E746F74616C4C616E6775616765732D313B613E3D303B612D2D29742E5F76616C7565732E';
wwv_flow_api.g_varchar2_table(51) := '646174614A534F4E5B615D2E746C3D742E5F6974656D242E76616C28293B656C736520742E5F76616C7565732E646174614A534F4E5B695D2E746C3D742E5F6974656D242E76616C28293B742E5F73796E634C616E67756167654D617028297D2C5F696E';
wwv_flow_api.g_varchar2_table(52) := '69744469616C6F67427574746F6E733A66756E6374696F6E28297B746869732E5F656C656D656E74732E2463616E63656C427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6543616E63656C4275';
wwv_flow_api.g_varchar2_table(53) := '74746F6E436C69636B292C746869732E5F656C656D656E74732E2473617665427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6553617665427574746F6E436C69636B297D2C5F68616E646C6543';
wwv_flow_api.g_varchar2_table(54) := '616E63656C427574746F6E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E5F76616C7565732E6E65775265636F72643D21312C742E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F';
wwv_flow_api.g_varchar2_table(55) := '736522297D2C5F68616E646C6553617665427574746F6E436C69636B3A66756E6374696F6E2865297B76617220742C693D652E646174612E7569773B692E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428222E6A746C697465';
wwv_flow_api.g_varchar2_table(56) := '6D2D76616C756522292E656163682866756E6374696F6E28652C61297B692E6C6F6728652B2228222B612E646174617365742E6C616E672B22293A222B612E76616C7565292C692E5F76616C7565732E646174614A534F4E5B655D2E6C3D612E64617461';
wwv_flow_api.g_varchar2_table(57) := '7365742E6C616E672C692E5F76616C7565732E646174614A534F4E5B655D2E746C3D612E76616C75652C692E5F76616C7565732E637572725F6C616E675F696E6465783D3D65262628743D612E76616C7565297D292C692E5F73796E634C616E67756167';
wwv_flow_api.g_varchar2_table(58) := '654D617028292C692E5F76616C7565732E6E65775265636F72643D21312C692E5F6974656D242E76616C2874292C692E5F7369676E616C4368616E676528292C692E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D';
wwv_flow_api.g_varchar2_table(59) := '2C5F7369676E616C4368616E67653A66756E6374696F6E28297B617065782E6A517565727928746869732E5F6974656D245B305D292E7472696767657228226368616E676522297D2C5F68616E646C654F70656E436C69636B3A66756E6374696F6E2865';
wwv_flow_api.g_varchar2_table(60) := '297B76617220743D652E646174612E7569773B742E6C6F6728225F68616E646C654F70656E436C69636B22292C742E5F73796E634A534F4E646174612865292C742E5F73686F774469616C6F6728297D2C5F73686F774469616C6F673A66756E6374696F';
wwv_flow_api.g_varchar2_table(61) := '6E28297B76617220652C742C693D746869732C613D692E5F76616C7565732E637572725F6C616E675F696E6465783B692E6C6F6728225F73686F774469616C6F6722292C653D273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274';
wwv_flow_api.g_varchar2_table(62) := '222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E203C74723E5C6E20203C746820636C6173733D22742D5265706F72742D636F6C48656164223E272B692E5F76616C7565732E6D657373616765732E6C616E67';
wwv_flow_api.g_varchar2_table(63) := '756167654C6162656C2B273C2F74683E20203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E272B692E5F76616C7565732E6D657373616765732E6C616E677561676556616C75652B223C2F74683E203C2F74723E5C';
wwv_flow_api.g_varchar2_table(64) := '6E222C242E6561636828692E5F76616C7565732E6C616E6775616765732C66756E6374696F6E28742C6E297B652B3D22203C7472222B28613D3D743F2720636C6173733D2273656C656374656422273A2222292B273E5C6E20203C746420636C6173733D';
wwv_flow_api.g_varchar2_table(65) := '22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443223E272B617065782E7574696C2E65736361706548544D4C41747472286E292B273C2F74643E20203C746420636C6173733D22742D5265706F7274';
wwv_flow_api.g_varchar2_table(66) := '2D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C223E272C2254455854223D3D3D692E6F7074696F6E732E6974656D547970653F652B3D27202020203C696E70757420747970653D22746578742220636C6173733D227465';
wwv_flow_api.g_varchar2_table(67) := '78745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D22272B6E2B27222076616C75653D22272B617065782E7574696C2E65736361706548544D4C4174747228692E5F676574544C28';
wwv_flow_api.g_varchar2_table(68) := '6E29292B27222073697A653D22272B692E5F76616C7565732E6669656C6453697A652B2722206D61786C656E6774683D22272B692E5F76616C7565732E6669656C644D61784C656E6774682B27223E3C2F74643E273A652B3D27202020203C7465787461';
wwv_flow_api.g_varchar2_table(69) := '72656120636C6173733D22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D22272B6E2B272220636F6C733D22272B692E5F76616C7565732E6669656C6453697A652B';
wwv_flow_api.g_varchar2_table(70) := '272220726F77733D22272B692E5F76616C7565732E6669656C64526F77732B2722206D61786C656E6774683D22272B692E5F76616C7565732E6669656C644D61784C656E6774682B27223E272B617065782E7574696C2E65736361706548544D4C417474';
wwv_flow_api.g_varchar2_table(71) := '7228692E5F676574544C286E29292B223C2F74657874617265613E222C652B3D22203C2F74723E5C6E227D292C652B3D223C2F7461626C653E5C6E222C743D273C64697620636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C61';
wwv_flow_api.g_varchar2_table(72) := '73733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E20203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E20202020203C627574746F6E20636C6173733D226A746C';
wwv_flow_api.g_varchar2_table(73) := '6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B692E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E2B27';
wwv_flow_api.g_varchar2_table(74) := '3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F74223E202020202020203C7370616E20';
wwv_flow_api.g_varchar2_table(75) := '636C6173733D22742D427574746F6E2D6C6162656C223E272B692E5F76616C7565732E6D657373616765732E6170706C794368616E6765732B273C2F7370616E3E202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D';
wwv_flow_api.g_varchar2_table(76) := '72696768742066612066612D636865636B223E3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D226A746C6974656D2D636F6E74656E74223E5C6E272B652B2220203C2F6469763E5C6E';
wwv_flow_api.g_varchar2_table(77) := '3C2F6469763E3C2F6469763E5C6E222C692E5F656C656D656E74732E24626F64792E617070656E642874292C692E5F656C656D656E74732E246469616C6F673D2428226469762E6A746C6974656D2D6469616C6F6722292C692E5F656C656D656E74732E';
wwv_flow_api.g_varchar2_table(78) := '246469616C6F672E6469616C6F67287B636C6F73654F6E4573636170653A21302C7469746C653A692E6F7074696F6E732E6469616C6F675469746C652C6175746F526573697A653A21302C6D696E57696474683A3430302C6D696E4865696768743A3235';
wwv_flow_api.g_varchar2_table(79) := '302C77696474683A226175746F222C6865696768743A226175746F222C6D6F64616C3A21302C706F736974696F6E3A7B6D793A226C656674222C61743A226C6566742063656E746572222C6F663A692E5F6974656D245B305D7D2C6F70656E3A66756E63';
wwv_flow_api.g_varchar2_table(80) := '74696F6E28297B692E5F696E69744469616C6F67456C656D656E747328292C692E5F696E69744469616C6F67427574746F6E7328292C692E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E64282274722E73656C6563746564202E';
wwv_flow_api.g_varchar2_table(81) := '6A746C6974656D2D76616C756522292E747269676765722822666F63757322297D2C636C6F73653A66756E6374696F6E28297B242874686973292E6469616C6F67282264657374726F7922292C692E5F656C656D656E74732E246469616C6F672E72656D';
wwv_flow_api.g_varchar2_table(82) := '6F766528292C692E5F656C656D656E74732E24646F63756D656E742E66696E6428226469762E6A746C6974656D2D6469616C6F6722292E72656D6F766528292C692E5F7265736574466F63757328297D7D292E6F6E28226B6579646F776E222C66756E63';
wwv_flow_api.g_varchar2_table(83) := '74696F6E2865297B652E6B6579436F64653D3D3D242E75692E6B6579436F64652E4553434150452626692E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522292C652E73746F7050726F7061676174696F6E28297D297D2C';
wwv_flow_api.g_varchar2_table(84) := '64697361626C653A66756E6374696F6E28297B21313D3D3D746869732E5F76616C7565732E64697361626C6564262628746869732E5F6974656D242E61747472282264697361626C6564222C2264697361626C656422292C746869732E5F656C656D656E';
wwv_flow_api.g_varchar2_table(85) := '74732E246D6C73427574746F6E2E61747472282264697361626C6564222C2264697361626C656422292E756E62696E642822636C69636B222C746869732E5F68616E646C654F70656E436C69636B29292C746869732E5F76616C7565732E64697361626C';
wwv_flow_api.g_varchar2_table(86) := '65643D21307D2C656E61626C653A66756E6374696F6E28297B21303D3D3D746869732E5F76616C7565732E64697361626C6564262628746869732E5F6974656D242E72656D6F766541747472282264697361626C656422292C746869732E5F656C656D65';
wwv_flow_api.g_varchar2_table(87) := '6E74732E246D6C73427574746F6E2E72656D6F766541747472282264697361626C656422292E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C654F70656E436C69636B292C746869732E5F76616C7565732E6469';
wwv_flow_api.g_varchar2_table(88) := '7361626C65643D2131297D7D293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10593019508675613)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'js/jtl_item.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C226E616D6573223A5B5D2C226D617070696E6773223A22222C22736F7572636573223A5B226A746C5F6974656D2E6A73225D2C22736F7572636573436F6E74656E74223A5B222F2A5C6E202A204A544C204974656D2076';
wwv_flow_api.g_varchar2_table(2) := '312E31202D20687474703A2F2F617065782E776F726C642F706C7567696E732F5C6E202A5C6E202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954295C6E202A204A6F7267652052696D626C617320C2A920323031372D';
wwv_flow_api.g_varchar2_table(3) := '323032305C6E2A2F5C6E5C6E242E77696467657428205C2275692E6A746C4974656D5C222C207B5C6E205C6E20202F2F2044656661756C74206F7074696F6E732E5C6E20206F7074696F6E733A207B5C6E20202020206C616E673A205C22656E5C222C5C';
wwv_flow_api.g_varchar2_table(4) := '6E20202020206C616E675F636F6465733A205B5D2C20202F2F205B5C22656E5C222C5C2266725C222C5C2265735C225D5C6E20202020206D657373616765733A206E756C6C2C5C6E20202020206974656D4E616D653A2027272C5C6E2020202020666965';
wwv_flow_api.g_varchar2_table(5) := '6C6453697A653A2033302C5C6E20202020206669656C64526F77733A20352C5C6E20202020206669656C644D61784C656E6774683A2038302C5C6E20202020206469616C6F675469746C653A206E756C6C5C6E20207D2C5C6E5C6E20202F2F204C6F6767';
wwv_flow_api.g_varchar2_table(6) := '696E6720666F72205C22726567756C61725C22207465787420656C656D656E74735C6E20206C6F673A2066756E6374696F6E2829207B5C6E202020207661722061726773203D2041727261792E70726F746F747970652E6A6F696E2E63616C6C28206172';
wwv_flow_api.g_varchar2_table(7) := '67756D656E74732C20272C202720293B5C6E20202020617065782E64656275672E6D65737361676528342C205C226A746C6974656D3A5C222C2061726773293B5C6E20207D2C5C6E20202F2F20456E68616E636564206C6F675C6E20202F2F2061636365';
wwv_flow_api.g_varchar2_table(8) := '7074732032206F626A6563747320666F72206C6F6767696E675C6E2020656C6F673A2066756E6374696F6E2870312C703229207B5C6E20202020617065782E64656275672E6D65737361676528342C205C226A746C6974656D3A5C222C2070312C207032';
wwv_flow_api.g_varchar2_table(9) := '293B5C6E20207D2C5C6E5C6E20205F746F70417065783A20617065782E7574696C2E676574546F704170657828292C5C6E5C6E20205F696E697447726964436F6E6669673A2066756E6374696F6E202829207B5C6E2020202076617220756977203D2074';
wwv_flow_api.g_varchar2_table(10) := '6869732C5C6E2020202020202020726567696F6E203D20617065782E726567696F6E2E66696E64436C6F73657374287569772E5F6974656D245B305D293B5C6E5C6E202020207569772E6C6F67285C225F696E697447726964436F6E6669675C22293B5C';
wwv_flow_api.g_varchar2_table(11) := '6E202020207569772E656C6F67285C227569772E5F6974656D245C222C207569772E5F6974656D24293B5C6E202020207569772E656C6F67285C22726567696F6E5C222C20726567696F6E293B5C6E5C6E20202020696620287569772E5F76616C756573';
wwv_flow_api.g_varchar2_table(12) := '2E69674D6F646529207B5C6E2020202020202F2F207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E74657261637469766547726964285C2267657443757272656E74566965775C22293B5C6E202020';
wwv_flow_api.g_varchar2_table(13) := '2020207569772E5F656C656D656E74732E246967203D20726567696F6E2E77696467657428292E696E7465726163746976654772696428293B5C6E2020202020207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E776964676574';
wwv_flow_api.g_varchar2_table(14) := '28292E696E74657261637469766547726964285C2267657456696577735C22292E677269643B5C6E2020202020207569772E656C6F67285C225F656C656D656E74732E24677269643A5C222C207569772E5F656C656D656E74732E2467726964293B5C6E';
wwv_flow_api.g_varchar2_table(15) := '5C6E202020202020726567696F6E2E77696467657428292E6F6E285C22696E74657261637469766567726964736176655C222C2066756E6374696F6E2829207B5C6E20202020202020202F2F20576F756C64206C696B6520746F2063616C6C20636C6561';
wwv_flow_api.g_varchar2_table(16) := '7253656C656374696F6E282920696E73746561642C206275742063616E277420666967757265206F757420686F772E5C6E20202020202020202F2F205475726E2065646974206F666620746F20666F7263652061206672657368206C6F6164206F662064';
wwv_flow_api.g_varchar2_table(17) := '61746120616761696E2E5C6E20202020202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F766520746F206C6561726E206F6620612062657474657220617070726F6163685C6E20202020';
wwv_flow_api.g_varchar2_table(18) := '202020207569772E5F656C656D656E74732E24677269642E736574456469744D6F64652866616C7365293B5C6E2020202020207D293B5C6E5C6E202020207D5C6E20202020656C7365207B5C6E2020202020207569772E6C6F67285C226E6F7420616E20';
wwv_flow_api.g_varchar2_table(19) := '49475C22293B5C6E202020207D5C6E5C6E20207D2C5C6E5C6E5C6E20205F7265736574466F6375733A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020207569772E6C6F67285C225F7265736574';
wwv_flow_api.g_varchar2_table(20) := '466F6375735C22293B5C6E5C6E20202020696620287569772E5F76616C7565732E69674D6F646529207B20202F2F2061726520776520696E73696465206120677269643F5C6E2020202020202F2F2066696E64206F757220636F6C756D6E20696E207468';
wwv_flow_api.g_varchar2_table(21) := '6520677269645C6E2020202020207569772E656C6F67285C227569772E5F656C656D656E74732E24677269645C222C207569772E5F656C656D656E74732E2467726964293B5C6E2020202020207569772E656C6F67285C227569772E5F656C656D656E74';
wwv_flow_api.g_varchar2_table(22) := '732E2469675C222C207569772E5F656C656D656E74732E246967293B5C6E5C6E202020202020766172207265636F72644964203D207569772E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F72644964287569772E5F656C656D';
wwv_flow_api.g_varchar2_table(23) := '656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B5C6E20202020202076617220636F6C756D6E203D207569772E5F656C656D656E74732E2469672E696E7465726163746976654772';
wwv_flow_api.g_varchar2_table(24) := '696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C756D6E29207B5C6E202020202020202072657475726E20636F6C756D6E2E7374617469634964203D3D3D207569772E6F7074696F';
wwv_flow_api.g_varchar2_table(25) := '6E732E6974656D4E616D653B5C6E2020202020207D295B305D3B5C6E2020202020202F2F20676F20746F206F75722063656C6C20616E6420666F6375732069742020202020205C6E2020202020207569772E5F656C656D656E74732E24677269642E7669';
wwv_flow_api.g_varchar2_table(26) := '6577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D65293B5C6E2020202020207569772E5F656C656D656E74732E24677269642E666F63757328293B5C6E202020207D20656C7365207B5C6E20202020';
wwv_flow_api.g_varchar2_table(27) := '20202F2F20776520617265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D20746861742063616C6C65642075735C6E2020202020207569772E5F6974656D242E747269676765722827666F63757327293B5C6E202020';
wwv_flow_api.g_varchar2_table(28) := '207D5C6E20207D2C5C6E5C6E5C6E20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F6974656D24203D202428272327';
wwv_flow_api.g_varchar2_table(29) := '202B207569772E6F7074696F6E732E6974656D4E616D65293B5C6E5C6E20202020207569772E5F76616C756573203D207B5C6E20202020202020206669656C6453697A653A2033302C5C6E20202020202020206669656C644D61784C656E6774683A2038';
wwv_flow_api.g_varchar2_table(30) := '302C5C6E2020202020202020646174614A534F4E3A207B7D2C5C6E2020202020202020637572725F6C616E675F696E6465783A20302C5C6E20202020202020206C616E6775616765733A207B7D2C5C6E20202020202020207461674D61703A207B7D2C5C';
wwv_flow_api.g_varchar2_table(31) := '6E20202020202020206D657373616765733A204A534F4E2E7061727365287569772E6F7074696F6E732E6D65737361676573292C5C6E2020202020202020677269643A206E756C6C2C5C6E2020202020202020746F74616C4C616E6775616765733A2030';
wwv_flow_api.g_varchar2_table(32) := '2C5C6E202020202020202064697361626C65643A2066616C73652C5C6E20202020202020206E65775265636F72643A2066616C73652C5C6E202020202020202069674D6F64653A207569772E6F7074696F6E732E69674D6F64655C6E20202020207D3B5C';
wwv_flow_api.g_varchar2_table(33) := '6E5C6E20202020207569772E5F656C656D656E7473203D207B5C6E20202020202020202477696E646F773A207B7D2C5C6E202020202020202024646F63756D656E743A207B7D2C5C6E202020202020202024626F64793A207B7D2C5C6E20202020202020';
wwv_flow_api.g_varchar2_table(34) := '20246974656D7365743A207B7D2C5C6E2020202020202020246D6C73427574746F6E3A207B7D2C5C6E20202020202020202469673A207B7D2C5C6E2020202020202020246469616C6F673A207B7D2C5C6E2020202020202020246469616C6F67436F6E74';
wwv_flow_api.g_varchar2_table(35) := '656E743A207B7D2C5C6E20202020202020202473617665427574746F6E3A207B7D2C5C6E20202020202020202463616E63656C427574746F6E3A207B7D2C5C6E202020202020202024627574746F6E436F6E7461696E65723A207B7D5C6E20202020207D';
wwv_flow_api.g_varchar2_table(36) := '3B5C6E20207D2C5C6E5C6E5C6E5C6E20205F6372656174653A2066756E6374696F6E2829207B5C6E2020202076617220756977203D20746869732C5C6E2020202020202020696E69744A534F4E203D207B7D3B5C6E5C6E202020202F2F204F7074696F6E';
wwv_flow_api.g_varchar2_table(37) := '732061726520616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73295C6E202020207569772E6C6F67285C225F6372656174655C22293B5C6E20202020756977';
wwv_flow_api.g_varchar2_table(38) := '2E6C6F67287569772E6F7074696F6E732E6974656D4E616D65293B5C6E5C6E202020202F2F2068656C7065722066756E6374696F6E20666F722066696E64696E672074686520696E64657820706F736974696F6E206F66206F75722063757272656E7420';
wwv_flow_api.g_varchar2_table(39) := '646973706C61796564206C616E67756167655C6E2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B5C6E2020202020207661722069203D206E756C6C2C5C6E20202020202020202020696478203D202D313B5C6E';
wwv_flow_api.g_varchar2_table(40) := '202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B5C6E2020202020202020696620286A5B695D2E6C203D3D3D206C29207B5C6E20202020202020202020696478203D';
wwv_flow_api.g_varchar2_table(41) := '20693B5C6E20202020202020207D5C6E2020202020207D5C6E20202020202072657475726E206964783B5C6E202020207D5C6E5C6E202020207569772E5F6372656174655072697661746553746F7261676528293B5C6E202020207569772E5F696E6974';
wwv_flow_api.g_varchar2_table(42) := '456C656D656E747328293B5C6E202020207569772E5F696E697442617365456C656D656E747328293B5C6E5C6E5C6E20202020747279207B7569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061727365287569772E6F7074696F';
wwv_flow_api.g_varchar2_table(43) := '6E732E6C616E675F636F646573293B7D5C6E20202020636174636820286529207B636F6E736F6C652E6572726F72285C2254686520646566696E6564206C616E67756167657320617265206E6F7420666F726D617474656420636F72726563746C792E20';
wwv_flow_api.g_varchar2_table(44) := '5365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D5C222C207569772E6F7074696F6E732E6C616E675F636F646573293B7D5C6E202020207569';
wwv_flow_api.g_varchar2_table(45) := '772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B5C6E5C6E2020202069662028217569772E5F76616C7565732E69674D6F6465207C7C207569772E656C656D65';
wwv_flow_api.g_varchar2_table(46) := '6E742E64617461285C2276616C75655C22292029207B5C6E2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265207468652076616C7565206973207365742076696120646973706C617956616C7565';
wwv_flow_api.g_varchar2_table(47) := '466F7229205C6E2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75655C6E202020202020696E69744A534F4E203D207569772E656C656D656E742E64617461285C2276616C75655C22';
wwv_flow_api.g_varchar2_table(48) := '293B5C6E202020207D5C6E5C6E202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765735C6E202020207569772E5F696E6974446174614A534F4E28696E69744A534F4E293B5C6E5C6E202020202F2F2057686963';
wwv_flow_api.g_varchar2_table(49) := '6820706F736974696F6E206C616E677561676520617265207765207573696E675C6E202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D206C616E67756167655F696E646578287569772E5F76616C7565732E646174614A';
wwv_flow_api.g_varchar2_table(50) := '534F4E2C207569772E6F7074696F6E732E6C616E67293B5C6E202020205C6E202020202F2F2053796E63206F7572204A534F4E20646174612D76616C7565206174747269627574652077697468207468652061637475616C2076616C756520696E207468';
wwv_flow_api.g_varchar2_table(51) := '6520636F7272656374206C616E67756167652C206275745C6E202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C7565205C6E20';
wwv_flow_api.g_varchar2_table(52) := '2020207569772E5F6974656D245C6E202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B5C6E202020207569772E5F656C656D656E74732E24646F63756D656E745C6E';
wwv_flow_api.g_varchar2_table(53) := '202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B5C6E5C6E202020207569772E5F656C656D656E74732E246D6C73427574746F6E';
wwv_flow_api.g_varchar2_table(54) := '5C6E202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202F2F20496E6974204150455820706167656974656D2066756E6374696F6E735C6E20';
wwv_flow_api.g_varchar2_table(55) := '2020207569772E5F696E6974417065784974656D28293B5C6E5C6E202020202F2F20617065782E6A51756572792877696E646F77292E6F6E285C227468656D65343272656164795C222C2066756E6374696F6E2829207B5C6E20202020617065782E6A51';
wwv_flow_api.g_varchar2_table(56) := '756572792877696E646F77292E6F6E285C22696E74657261637469766567726964766965776D6F64656C6372656174655C222C2066756E6374696F6E286576656E742C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C74';
wwv_flow_api.g_varchar2_table(57) := '69706C652049473F5C6E2020202020202F2F20696E69742074686520677269642076616C7565732C20627574207761697420756E74696C2074686520677269642069732072656164795C6E2020202020207569772E5F696E697447726964436F6E666967';
wwv_flow_api.g_varchar2_table(58) := '28293B5C6E202020207D293B5C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F696E6974417065784974656D3A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020207569772E6C6F67285C225F696E';
wwv_flow_api.g_varchar2_table(59) := '6974417065784974656D5C222C205C225265676973746572696E67207769746820617065782E6974656D2E63726561746520666F72205C22202B207569772E6F7074696F6E732E6974656D4E616D65293B5C6E202020202F2F2053657420616E64206765';
wwv_flow_api.g_varchar2_table(60) := '742076616C75652076696120617065782066756E6374696F6E735C6E20202020617065782E6974656D2E637265617465287569772E6F7074696F6E732E6974656D4E616D652C207B5C6E5C6E2020202020202073657456616C75653A2066756E6374696F';
wwv_flow_api.g_varchar2_table(61) := '6E287056616C75652C2070446973706C617956616C756529207B5C6E202020202020202020207569772E6C6F6728205C22617065782E6974656D2E73657456616C75655C222C207056616C75652C2070446973706C617956616C7565293B5C6E5C6E2020';
wwv_flow_api.g_varchar2_table(62) := '20202020202020207569772E5F696E6974446174614A534F4E284A534F4E2E7061727365287056616C7565207C7C205C227B7D5C2229293B5C6E5C6E202020202020202020206966202870446973706C617956616C7565207C7C20217056616C7565207C';
wwv_flow_api.g_varchar2_table(63) := '7C207056616C75652E6C656E677468203D3D3D203029207B5C6E20202020202020202020202020202F2F20656D707479207056616C75655C6E202020202020202020207D20656C7365207B5C6E20202020202020202020202020202F2F204E4F5420656D';
wwv_flow_api.g_varchar2_table(64) := '707479207056616C75655C6E2020202020202020202020202020696620282170446973706C617956616C756529207B5C6E2020202020202020202020202020202070446973706C617956616C7565203D207569772E5F676574544C287569772E6F707469';
wwv_flow_api.g_varchar2_table(65) := '6F6E732E6C616E67293B5C6E20202020202020202020202020207D5C6E5C6E20202020202020202020202020207569772E5F6974656D242E76616C2870446973706C617956616C7565293B5C6E202020202020202020207D5C6E5C6E202020202020207D';
wwv_flow_api.g_varchar2_table(66) := '2C5C6E2020202020202067657456616C75653A2066756E6374696F6E2829207B5C6E2020202020202020202072657475726E204A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E293B5C6E202020202020207D2C5C';
wwv_flow_api.g_varchar2_table(67) := '6E20202020202020736574466F6375733A2066756E6374696F6E2829207B5C6E202020202020202020207569772E5F6974656D242E74726967676572285C22666F6375735C22293B5C6E202020202020207D2C5C6E20202020202020656E61626C653A20';
wwv_flow_api.g_varchar2_table(68) := '66756E6374696F6E2829207B5C6E202020202020202020207569772E656E61626C6528293B5C6E202020202020207D2C5C6E2020202020202064697361626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E64697361626C';
wwv_flow_api.g_varchar2_table(69) := '6528293B5C6E202020202020207D2C5C6E20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056616C756529207B5C6E20202020202020202020766172206A746C4A534F4E203D207B7D3B5C6E202020202020202020';
wwv_flow_api.g_varchar2_table(70) := '202F2F205468652049472063616C6C73207468697320636F646520746F207365742074686520696E697469616C20646973706C61792076616C7565735C6E202020202020202020207569772E6C6F67285C22617065782E6974656D2E646973706C617956';
wwv_flow_api.g_varchar2_table(71) := '616C7565466F725C222C207056616C7565293B5C6E20202020202020202020696620287056616C756529207B5C6E202020202020202020202020747279207B202F2F206A7573742070726F7465637420757320696620746865204A534F4E20697320696E';
wwv_flow_api.g_varchar2_table(72) := '76616C69645C6E20202020202020202020202020206A746C4A534F4E203D204A534F4E2E7061727365287056616C7565293B5C6E2020202020202020202020207D5C6E202020202020202020202020636174636820286529207B5C6E2020202020202020';
wwv_flow_api.g_varchar2_table(73) := '202020207D5C6E5C6E5C6E202020202020202020207D5C6E202020202020202020207569772E5F696E6974446174614A534F4E286A746C4A534F4E293B5C6E2020202020202020202072657475726E207569772E5F676574544C287569772E6F7074696F';
wwv_flow_api.g_varchar2_table(74) := '6E732E6C616E67293B5C6E202020202020207D5C6E202020207D293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E202020';
wwv_flow_api.g_varchar2_table(75) := '20207569772E5F656C656D656E74732E2477696E646F77203D20242877696E646F77293B5C6E20202020207569772E5F656C656D656E74732E24646F63756D656E74203D202428646F63756D656E74293B5C6E20202020207569772E5F656C656D656E74';
wwv_flow_api.g_varchar2_table(76) := '732E24626F6479203D202428646F63756D656E742E626F6479293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E';
wwv_flow_api.g_varchar2_table(77) := '5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D202428276469762E6A746C6974656D2D636F6E74656E7427293B5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D202428';
wwv_flow_api.g_varchar2_table(78) := '27627574746F6E2E6A746C6974656D2D736176652D627574746F6E27293B5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D20242827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E2729';
wwv_flow_api.g_varchar2_table(79) := '3B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E6C6F6728205C225F696E69744261736545';
wwv_flow_api.g_varchar2_table(80) := '6C656D656E74735C22293B5C6E20202020207569772E656C6F6728205C22656C656D656E745C222C207569772E656C656D656E74293B5C6E5C6E20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E69';
wwv_flow_api.g_varchar2_table(81) := '74656D54797065203D3D3D205C22544558545C223F207569772E5F6974656D242E61747472285C2273697A655C2229203A207569772E5F6974656D242E61747472285C22636F6C735C22293B5C6E2020202020696620287569772E6F7074696F6E732E69';
wwv_flow_api.g_varchar2_table(82) := '74656D54797065203D3D3D205C2254455854415245415C2229207B5C6E202020202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F6974656D242E61747472285C22726F77735C22293B5C6E20202020207D5C6E20202020';
wwv_flow_api.g_varchar2_table(83) := '207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F6974656D242E61747472285C226D61786C656E6774685C22293B5C6E5C6E20202020202F2F205374617274696E67207769746820415045582031382E3120746865';
wwv_flow_api.g_varchar2_table(84) := '206974656D2073657420697320746865206974656D5772617070657220636C6173735C6E20202020207569772E5F656C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B5C6E20202020207569772E5F656C';
wwv_flow_api.g_varchar2_table(85) := '656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74732E246974656D7365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B5C6E20207D2C5C6E5C6E5C6E20205F73796E634C616E67';
wwv_flow_api.g_varchar2_table(86) := '756167654D61703A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E20202020202020202069203D206E756C6C2C5C6E20202020202020202074616773203D207B7D3B5C6E5C6E20202020207569772E6C6F67';
wwv_flow_api.g_varchar2_table(87) := '28205C225F73796E634C616E67756167654D61705C22293B5C6E202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B5C6E5C6E20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D';
wwv_flow_api.g_varchar2_table(88) := '656666696369656E746C792D7365617263682D612D6A736F6E2D61727261792F5C6E20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B5C6E2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069';
wwv_flow_api.g_varchar2_table(89) := '202B3D203129207B5C6E2020202020202020207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B5C6E2020202020202020202F2F20636F6E736F6C652E6C6F6728692C205C225B5C22202B2074';
wwv_flow_api.g_varchar2_table(90) := '6167735B695D2E6C202B205C225D203D205C222C20746167735B695D2E746C295C6E20202020207D5C6E2020202020205C6E20207D2C5C6E5C6E5C6E20202F2F2067657420746865206C616E67756167652076616C756520666F72206120676976656E20';
wwv_flow_api.g_varchar2_table(91) := '6C616E677561676520636F64655C6E20205F676574544C3A2066756E6374696F6E286C616E67436F646529207B5C6E202020202076617220756977203D20746869733B5C6E202020202072657475726E207569772E5F76616C7565732E7461674D61705B';
wwv_flow_api.g_varchar2_table(92) := '6C616E67436F64655D3B5C6E20207D2C5C6E5C6E5C6E5C6E20202F2F20657870656374732061206A746C4A534F4E20737472756374757265206F7220616E20656D707479206F626A6563745C6E20205F696E6974446174614A534F4E3A2066756E637469';
wwv_flow_api.g_varchar2_table(93) := '6F6E286A746C4A534F4E297B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020206A736F6E44617461203D205B5D2C5C6E202020202020202020696E7075745F64617461203D206A746C4A534F4E207C7C207B7D3B5C6E5C';
wwv_flow_api.g_varchar2_table(94) := '6E2020202020202020207569772E6C6F67285C225F696E6974446174614A534F4E5C22293B5C6E2020202020202020207569772E656C6F67287B696E7075745F646174617D293B5C6E5C6E202020202069662028617065782E6A51756572792E6973456D';
wwv_flow_api.g_varchar2_table(95) := '7074794F626A65637428696E7075745F646174612929207B5C6E20202020202020207569772E6C6F67285C22496E697469616C697A696E67207769746820656D7074792076616C75655C22293B5C6E5C6E20202020202020202F2F20546865207265636F';
wwv_flow_api.g_varchar2_table(96) := '726420697320656D70747920736F207765206275696C642061205C6E20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A5C6E20202020202020202F2F20205B207B5C22';
wwv_flow_api.g_varchar2_table(97) := '6C5C223A205C2275735C222C205C22746C5C223A205C2250726F6A65637420416E616C797369735C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2266725C222C205C22746C5C223A205C22416E616C7973652064652070726F6A65';
wwv_flow_api.g_varchar2_table(98) := '745C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2265735C222C205C22746C5C223A205C22416E616C697369732064652070726F6A6563746F5C227D5D5C6E20202020202020207569772E5F76616C7565732E6C616E6775616765';
wwv_flow_api.g_varchar2_table(99) := '732E666F72456163682866756E6374696F6E286C29207B5C6E20202020202020202020206A736F6E446174612E70757368287B5C226C5C223A206C2C205C22746C5C223A205C225C227D293B5C6E20202020202020207D293B5C6E5C6E20202020202020';
wwv_flow_api.g_varchar2_table(100) := '207569772E5F76616C7565732E646174614A534F4E203D206A736F6E446174613B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B5C6E20202020207D5C6E2020202020656C7365207B5C6E2020202020';
wwv_flow_api.g_varchar2_table(101) := '20207569772E5F76616C7565732E646174614A534F4E203D20696E7075745F646174613B5C6E202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E20202020207D5C6E5C6E20202020207569772E5F73796E';
wwv_flow_api.g_varchar2_table(102) := '634C616E67756167654D617028293B5C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F73796E634A534F4E646174613A2066756E6374696F6E286576656E744F626A29207B5C6E20202020202F2F2076617220756977203D206576656E744F626A2E646174';
wwv_flow_api.g_varchar2_table(103) := '612E7569772C5C6E2020202020766172207569772C5C6E2020202020202020206C616E675F696E6465783B5C6E5C6E202020202069662028747970656F66206576656E744F626A20213D205C22756E646566696E65645C2229207B5C6E20202020202020';
wwv_flow_api.g_varchar2_table(104) := '202F2F20776520776572652063616C6C2066726F6D20616E206576656E745C6E2020202020202020756977203D206576656E744F626A2E646174612E7569773B5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F206469';
wwv_flow_api.g_varchar2_table(105) := '726563742063616C6C5C6E2020202020202020756977203D20746869733B5C6E20202020207D5C6E20202020207569772E6C6F67285C225F73796E634A534F4E646174615C22293B5C6E5C6E20202020206C616E675F696E646578203D207569772E5F76';
wwv_flow_api.g_varchar2_table(106) := '616C7565732E637572725F6C616E675F696E6465783B5C6E5C6E2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B5C6E20202020202020202F2F204F6E206E6577207265636F72642077652077616E7420746F20736176';
wwv_flow_api.g_varchar2_table(107) := '6520746865206E657720656E74657265642076616C756520696E746F2074686520414C4C207468655C6E20202020202020202F2F207265636F72647320696E20746865204A534F4E207374727563747572655C6E2020202020202020666F722028766172';
wwv_flow_api.g_varchar2_table(108) := '2069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B5C6E202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569772E5F697465';
wwv_flow_api.g_varchar2_table(109) := '6D242E76616C28293B5C6E20202020202020207D5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E2073747275637475726520666F7220';
wwv_flow_api.g_varchar2_table(110) := '7468652063757272656E74206C616E67756167655C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D207569772E5F6974656D242E76616C28293B5C6E20202020207D5C6E5C6E202020';
wwv_flow_api.g_varchar2_table(111) := '20207569772E5F73796E634C616E67756167654D617028293B5C6E20207D2C5C6E5C6E5C6E5C6E20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20';
wwv_flow_api.g_varchar2_table(112) := '202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C69636B293B5C6E';
wwv_flow_api.g_varchar2_table(113) := '5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69636B293B5C6E5C';
wwv_flow_api.g_varchar2_table(114) := '6E20207D2C5C6E5C6E5C6E20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569773B5C6E5C6E2020';
wwv_flow_api.g_varchar2_table(115) := '2020202F2F20696620746865206469616C6F67206F70656E732C207765277265206E6F742061206E6577207265636F726420616E79206D6F72655C6E20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E5C6E20';
wwv_flow_api.g_varchar2_table(116) := '202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F675C6E5C6E20207D2C5C6E5C6E5C6E';
wwv_flow_api.g_varchar2_table(117) := '5C6E20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569772C5C6E202020202020202020646973706C61';
wwv_flow_api.g_varchar2_table(118) := '795F76616C75653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E28692C656C297B5C6E20202020202020202F';
wwv_flow_api.g_varchar2_table(119) := '2F206C6F6F70207468726F75676820616C6C206469616C6F6720656C656D656E747320616E642073746F7265207472616E736C6174696F6E735C6E20202020202020202F2F206261636B20696E746F2074686520646174614A534F4E2073747275637475';
wwv_flow_api.g_varchar2_table(120) := '72655C6E20202020202020207569772E6C6F672869202B205C22285C22202B20656C2E646174617365742E6C616E67202B205C22293A5C22202B20656C2E76616C7565293B5C6E5C6E20202020202020207569772E5F76616C7565732E646174614A534F';
wwv_flow_api.g_varchar2_table(121) := '4E5B695D2E6C203D20656C2E646174617365742E6C616E673B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C75653B5C6E2020202020202020696620287569772E5F76616C7565732E63';
wwv_flow_api.g_varchar2_table(122) := '7572725F6C616E675F696E646578203D3D206929207B5C6E2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B5C6E20202020202020207D5C6E20202020207D293B5C6E5C6E20202020207569772E5F73796E634C';
wwv_flow_api.g_varchar2_table(123) := '616E67756167654D617028293B5C6E5C6E20202020202F2F20776527726520646F6E65205C22736176696E675C22206261636B2066726F6D20746865206469616C6F672C20636C65617220746865206E65775265636F726420666C61675C6E2020202020';
wwv_flow_api.g_varchar2_table(124) := '7569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E5C6E20202020207569772E5F6974656D242E76616C28646973706C61795F76616C7565293B5C6E20202020207569772E5F7369676E616C4368616E676528293B5C6E5C6E';
wwv_flow_api.g_varchar2_table(125) := '20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F675C6E20207D2C5C6E5C6E5C6E20';
wwv_flow_api.g_varchar2_table(126) := '205F7369676E616C4368616E67653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020202F2F204E65656420746F2075736520617065782E6A517565727920666F7220746865206576656E7473';
wwv_flow_api.g_varchar2_table(127) := '20746F207265676973746572207769746820746865204441206672616D65776F726B5C6E2020202020617065782E6A5175657279287569772E5F6974656D245B305D292E7472696767657228276368616E676527293B5C6E20207D2C5C6E5C6E5C6E2020';
wwv_flow_api.g_varchar2_table(128) := '5F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569773B5C6E5C6E20202020207569772E6C6F67285C225F68616E646C654F';
wwv_flow_api.g_varchar2_table(129) := '70656E436C69636B5C22293B5C6E5C6E20202020207569772E5F73796E634A534F4E64617461286576656E744F626A293B5C6E20202020207569772E5F73686F774469616C6F6728293B5C6E20207D2C5C6E5C6E5C6E20205F73686F774469616C6F673A';
wwv_flow_api.g_varchar2_table(130) := '2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020206C616E675461626C652C5C6E202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E67';
wwv_flow_api.g_varchar2_table(131) := '5F696E6465782C5C6E2020202020202020206469616C6F6748746D6C3B5C6E5C6E20202020207569772E6C6F67285C225F73686F774469616C6F675C22293B5C6E5C6E20202020206C616E675461626C65203D205C6E2020202020202020202020273C74';
wwv_flow_api.g_varchar2_table(132) := '61626C6520636C6173733D5C22742D5265706F72742D7265706F72745C222073756D6D6172793D5C22417661696C61626C65205472616E736C6174696F6E735C223E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E27202B5C6E20';
wwv_flow_api.g_varchar2_table(133) := '202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C486561645C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B5C6E20202020';
wwv_flow_api.g_varchar2_table(134) := '202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C4865616420752D744C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B5C6E2020';
wwv_flow_api.g_varchar2_table(135) := '20202020202020202027203C2F74723E5C5C6E273B5C6E20202020202020202020202F2F2027203C74723E5C5C6E273B5C6E5C6E2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E64';
wwv_flow_api.g_varchar2_table(136) := '65782C206C616E672029207B5C6E202020202020206C616E675461626C65202B3D5C6E2020202020202027203C747227202B2028637572725F6C616E673D3D696E6465783F202720636C6173733D5C2273656C65637465645C22273A272729202B20273E';
wwv_flow_api.g_varchar2_table(137) := '5C5C6E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D74435C223E27202B20617065782E7574696C2E65736361706548544D4C417474';
wwv_flow_api.g_varchar2_table(138) := '72286C616E6729202B20273C2F74643E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C5C223E273B5C6E20202020202020696620';
wwv_flow_api.g_varchar2_table(139) := '287569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C2229207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C696E70757420747970653D5C22746578745C2220636C61';
wwv_flow_api.g_varchar2_table(140) := '73733D5C22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C222076616C75653D5C2227202B20617065782E7574696C2E65736361';
wwv_flow_api.g_varchar2_table(141) := '706548544D4C41747472287569772E5F676574544C286C616E672929202B20275C222073697A653D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C22206D61786C656E6774683D5C2227202B207569772E5F76616C7565';
wwv_flow_api.g_varchar2_table(142) := '732E6669656C644D61784C656E677468202B20275C223E3C2F74643E273B5C6E202020202020207D5C6E20202020202020656C7365207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C7465787461';
wwv_flow_api.g_varchar2_table(143) := '72656120636C6173733D5C22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C2227202B5C6E20202020202020202020202020';
wwv_flow_api.g_varchar2_table(144) := '202720636F6C733D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C2220726F77733D5C2227202B207569772E5F76616C7565732E6669656C64526F7773202B20275C2227202B205C6E2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(145) := '27206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C2227202B205C6E2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472';
wwv_flow_api.g_varchar2_table(146) := '287569772E5F676574544C286C616E672929202B20273C2F74657874617265613E273B5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E202020202020202027203C2F74723E5C5C6E273B5C6E20202020207D293B';
wwv_flow_api.g_varchar2_table(147) := '5C6E20202020206C616E675461626C65202B3D5C6E2020202020273C2F7461626C653E5C5C6E273B5C6E5C6E2020202020206469616C6F6748746D6C203D5C6E2020202020202020202020273C64697620636C6173733D5C226A746C6974656D2D646961';
wwv_flow_api.g_varchar2_table(148) := '6C6F675C223E3C64697620636C6173733D5C226A746C6974656D2D636F6E7461696E65722075692D7769646765745C223E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D627574746F6E2D63';
wwv_flow_api.g_varchar2_table(149) := '6F6E7461696E65725C223E5C5C6E27202B5C6E20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E5C223E27202B5C6E20202020202020202020';
wwv_flow_api.g_varchar2_table(150) := '2027202020202020203C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B5C6E20202020202020';
wwv_flow_api.g_varchar2_table(151) := '202020202F2F2027202020202020203C7370616E20636C6173733D5C2275692D69636F6E2075692D69636F6E2D636C6F73655C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E';
wwv_flow_api.g_varchar2_table(152) := '20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F745C223E27202B205C6E20202020202020202020202720202020';
wwv_flow_api.g_varchar2_table(153) := '2020203C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C794368616E676573202B20273C2F7370616E3E27202B5C6E20202020202020202020202720';
wwv_flow_api.g_varchar2_table(154) := '2020202020203C7370616E20636C6173733D5C22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B5C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B';
wwv_flow_api.g_varchar2_table(155) := '5C6E20202020202020202020202720203C2F6469763E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D636F6E74656E745C223E5C5C6E27202B5C6E20202020202020202020202020206C616E';
wwv_flow_api.g_varchar2_table(156) := '675461626C65202B5C6E20202020202020202020202720203C2F6469763E5C5C6E27202B5C6E2020202020202020202020273C2F6469763E3C2F6469763E5C5C6E273B5C6E5C6E20202020207569772E5F656C656D656E74732E24626F64792E61707065';
wwv_flow_api.g_varchar2_table(157) := '6E64286469616C6F6748746D6C293B5C6E5C6E20202020202F2F2072656164792061206469616C6F6720636F6E7461696E6572206279206372656174696E672061206469765C6E20202020207569772E5F656C656D656E74732E246469616C6F67203D20';
wwv_flow_api.g_varchar2_table(158) := '2428276469762E6A746C6974656D2D6469616C6F6727293B5C6E5C6E20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F675C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F6728';
wwv_flow_api.g_varchar2_table(159) := '7B5C6E202020202020202020636C6F73654F6E4573636170653A20747275652C5C6E2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C5C6E2020202020202020206175746F526573';
wwv_flow_api.g_varchar2_table(160) := '697A653A20202020747275652C5C6E2020202020202020206D696E57696474683A2020202020203430302C5C6E2020202020202020206D696E4865696768743A20202020203235302C5C6E20202020202020202077696474683A20202020202020202027';
wwv_flow_api.g_varchar2_table(161) := '6175746F272C5C6E2020202020202020206865696768743A2020202020202020276175746F272C5C6E2020202020202020206D6F64616C3A202020202020202020747275652C5C6E202020202020202020706F736974696F6E3A2020202020207B206D79';
wwv_flow_api.g_varchar2_table(162) := '3A205C226C6566745C222C2061743A205C226C6566742063656E7465725C222C206F663A207569772E5F6974656D245B305D207D2C5C6E2020202020202020206F70656E3A2066756E6374696F6E2829207B5C6E2020202020202020202020202F2F2075';
wwv_flow_api.g_varchar2_table(163) := '69772E5F746F70417065782E6E617669676174696F6E2E626567696E467265657A655363726F6C6C28293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B5C6E202020202020202020202020756977';
wwv_flow_api.g_varchar2_table(164) := '2E5F696E69744469616C6F67427574746F6E7328293B5C6E5C6E2020202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565206F66207468652063757272656E74206C616E6775616765205C6E2020202020202020';
wwv_flow_api.g_varchar2_table(165) := '202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C756527292E747269676765722827666F63757327293B5C6E2020202020202020207D2C5C6E';
wwv_flow_api.g_varchar2_table(166) := '202020202020202020636C6F73653A2066756E6374696F6E2829207B5C6E5C6E202020202020202020202020242874686973292E6469616C6F67282764657374726F7927293B5C6E2020202020202020202020207569772E5F656C656D656E74732E2464';
wwv_flow_api.g_varchar2_table(167) := '69616C6F672E72656D6F766528293B5C6E2020202020202020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B5C6E202020202020202020';
wwv_flow_api.g_varchar2_table(168) := '2020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E656E64467265657A655363726F6C6C28293B5C6E5C6E2020202020202020202020207569772E5F7265736574466F63757328293B5C6E2020202020202020207D5C6E20202020';
wwv_flow_api.g_varchar2_table(169) := '2020207D295C6E202020202020202E6F6E28276B6579646F776E272C2066756E6374696F6E2865767429207B5C6E2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B5C';
wwv_flow_api.g_varchar2_table(170) := '6E2020202020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B5C6E20202020202020202020207D202020202020202020202020202020205C6E2020202020202020202020657674';
wwv_flow_api.g_varchar2_table(171) := '2E73746F7050726F7061676174696F6E28293B5C6E202020202020207D293B5C6E5C6E5C6E20207D2C5C6E5C6E5C6E202064697361626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020';
wwv_flow_api.g_varchar2_table(172) := '20696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B5C6E20202020202020207569772E5F6974656D245C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B';
wwv_flow_api.g_varchar2_table(173) := '5C6E5C6E20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427295C6E20202020202020202020202E756E62696E64282763';
wwv_flow_api.g_varchar2_table(174) := '6C69636B272C207569772E5F68616E646C654F70656E436C69636B293B5C6E20202020207D5C6E5C6E20202020207569772E5F76616C7565732E64697361626C6564203D20747275653B5C6E20207D2C5C6E5C6E5C6E2020656E61626C653A2066756E63';
wwv_flow_api.g_varchar2_table(175) := '74696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D207472756529207B5C6E202020202020207569772E5F6974656D242E72656D6F76';
wwv_flow_api.g_varchar2_table(176) := '6541747472282764697361626C656427293B5C6E202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202020202E72656D6F766541747472282764697361626C656427295C6E202020202020202020202E62';
wwv_flow_api.g_varchar2_table(177) := '696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202020207569772E5F76616C7565732E64697361626C6564203D2066616C73653B5C6E20202020207D5C6E20207D';
wwv_flow_api.g_varchar2_table(178) := '5C6E7D293B5C6E225D2C2266696C65223A226A746C5F6974656D2E6A73227D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10593458298675623)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'js/jtl_item.js.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
