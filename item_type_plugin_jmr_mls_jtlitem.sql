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
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix=>'&G_APEX_NITRO_IMAGES.'
,p_javascript_file_urls=>'#PLUGIN_FILES#www/dist/js/jtl_item#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#www/dist/css/jtl_item#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'subtype scope_name_t is varchar2(60);',
'',
'subtype gt_string is varchar2(32767);',
'',
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
'  log(''lagunages count:'' || l_count, l_scope);',
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
'function render(',
'    p_item                in apex_plugin.t_page_item',
'  , p_plugin              in apex_plugin.t_plugin',
'  , p_value               in gt_string',
'  , p_is_readonly         in boolean',
'  , p_is_printer_friendly in boolean',
' )',
'return apex_plugin.t_page_item_render_result',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''render'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''render'';',
'  $END',
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
'  l_item_jq           gt_string := apex_plugin_util.page_item_names_to_jquery(p_item.name);',
'  l_item_display      gt_string := p_item.name ||''_DISPLAY'';',
'  -- l_item_display_jq   gt_string := apex_plugin_util.page_item_names_to_jquery(l_item_display);',
'',
'  l_render_result     apex_plugin.t_page_item_render_result;',
'  ',
'  l_crlf              char(2) := chr(13)||chr(10);',
'',
'begin',
'  log(''BEGIN'', l_scope);',
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
'',
'',
'  log(''l_default_language:'' || l_default_language, l_scope);',
'  apex_plugin_util.debug_page_item(p_plugin, p_item, p_value, p_is_readonly, p_is_printer_friendly);',
'',
'  -- Tell APEX that this field is navigable',
'  l_render_result.is_navigable := true;',
'',
'  if p_value is null then',
'    l_language := l_default_language;',
'    l_display_value := null;',
'  else',
'    set_display_value(',
'        p_jtl_value     => p_value',
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
'',
'  if p_is_readonly or p_is_printer_friendly then',
'    -- if the item is readonly we will still render a hidden field with',
'    -- the value so that it can be used when the page gets submitted',
'    apex_plugin_util.print_hidden_if_readonly(',
'        p_item_name           => p_item.name,',
'        p_value               => p_value,',
'        p_is_readonly         => p_is_readonly,',
'        p_is_printer_friendly => p_is_printer_friendly );',
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
'    l_render_result.is_navigable := false;',
'  else',
'    l_name := apex_plugin.get_input_name_for_page_item(false);',
'',
'    -- this hidden item contains the full JSON column content (all languages!)',
'    sys.htp.p(''',
'      <input type="hidden" ''',
'         || ''id="'' || p_item.name || ''" ''',
'         || ''name="'' || l_name || ''" ''',
'         || ''value="'' || apex_plugin_util.escape(p_value => p_value, p_escape => p_item.escape_output) || ''" ''',
'         || ''/>''',
'    );',
'',
'    -- now render the visible element',
'    sys.htp.p(',
'        ''<fieldset id="'' || p_item.name || ''_fieldset" class="jtlitem-controls''',
'         || case when l_item_type = ''TEXTAREA'' then '' textarea'' end ',
'         || ''" tabindex="-1">'');',
'',
'    if l_item_type = ''TEXT'' then',
'      sys.htp.prn(',
'          ''<input type="text" id="'' || l_item_display || ''" ''',
'               || ''value="''|| apex_plugin_util.escape(p_value => l_display_value, p_escape => p_item.escape_output) || ''" ''',
'               || ''size="'' || p_item.element_width||''" ''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || ''class="text_field apex-item-text jtlitem '' || p_item.element_css_classes || ''"''',
'               || p_item.element_attributes ||'' />'' );',
'    else',
'      -- Textareas don''t use a value attribute, instead they contain their value ',
'      -- in between the tags. Therefore, make sure not to add any spaces or other',
'      -- characters that are not part of the value.',
'      sys.htp.prn(',
'          ''<textarea id="'' || l_item_display || ''" wrap="virtual" style="resize: both;" ''',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || ''class="textarea apex-item-textarea jtlitem '' || p_item.element_css_classes || ''"''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''cols="'' || p_item.element_width||''" ''',
'               || ''rows="'' || p_item.element_height||''" ''',
'               -- || ''maxlength="''||p_item.element_max_length||''" ''',
'               || p_item.element_attributes ||'' >''',
'               || apex_plugin_util.escape(p_value => l_display_value, p_escape => p_item.escape_output)',
'       || ''</textarea>'');',
'    end if;',
'',
'    if l_edit_languages then',
'      sys.htp.p(''<button type="button" class="jtlitem-modal-open t-Button">'' || l_crlf',
'             || ''  <span class="t-Icon fa fa-globe"></span>'' || l_crlf',
'             || ''</button>'' || l_crlf',
'             );',
'    end if;',
'',
'    -- Close fieldset.  Note that the textarea should have a fieldset regardless ',
'    -- of the modal control button',
'    sys.htp.p (',
'        '' </fieldset>'');',
'    ',
'  end if;',
'',
'  apex_javascript.add_onload_code (',
'      p_code => ''$("'' || l_item_jq || ''").jtl_item({'' || l_crlf',
'                      || apex_javascript.add_attribute(''lang'', l_language, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang_codes'', l_languages_list, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''messages'', l_messages, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''itemType'', l_item_type, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''dialogTitle'', l_dialog_title, false, false) || l_crlf',
'             || ''});''',
'            );',
'',
'',
'  l_render_result.is_navigable := true;',
'  return l_render_result;',
'',
'  exception',
'    when OTHERS then',
'      apex_debug.error(''Unhandled Exception'');',
'      raise;',
'end render;',
'',
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
'function validate (',
'   p_item   in apex_plugin.t_page_item',
' , p_plugin in apex_plugin.t_plugin',
' , p_value  in varchar2',
')',
'return apex_plugin.t_page_item_validation_result',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''validate'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''validate'';',
'  $END',
'',
'  l_result apex_plugin.t_page_item_validation_result;',
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
'  apex_json.parse(p_value);',
'  apex_debug.message(''parsing: %s'', p_value);',
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
'          l_error_suffix := ''('' || l_language || '')'';',
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
'    l_result.message := wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED'');',
'    -- if l_result.message = ''APEX.PAGE_ITEM_IS_REQUIRED'' then',
'    --   -- message not defined yet',
'    --   l_result.message := apex_lang.message(''#LABEL# must have some value.'');',
'    -- end if;',
'    -- add the language suffix, if the error doesn''t apply to the language being displayed.',
'    l_result.message := l_result.message || l_error_suffix;',
'  else',
'    l_result.message := '''';',
'  end if;',
'',
'  return l_result;',
'',
'exception',
'  when apex_json.e_parse_error then',
'    -- Somehow we don''t have valid JSON in our item.',
'    -- This is more critical for 11g where we don''t have "is json" constraints',
'    l_result.message := ''The JSON structure for #LABEL# is invalid.'';',
'    return l_result;',
'',
'end validate;',
'',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_validation_function=>'validate'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Plugin for storing multi-language translations (MLS) in a JSON column.',
'',
'For better plugin render performance switch from the inline code to the package code.  Change the render and validate function to tk_jtl_plugin.render and tk_jtl_plugin.validate.'))
,p_version_identifier=>'1.1.0'
,p_about_url=>'https://github.com/rimblas/jtlitem'
,p_files_version=>63
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
wwv_flow_api.g_varchar2_table(1) := '2E6A746C6974656D2D636F6E74726F6C73207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70';
wwv_flow_api.g_varchar2_table(2) := '656E2E742D427574746F6E207B0A2020202070616464696E673A202E3872656D202E3972656D3B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E74';
wwv_flow_api.g_varchar2_table(3) := '2D427574746F6E207B0A2020202070616464696E673A20312E3272656D3B0A7D0A627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E207B0A202070616464696E673A202E3472656D202E3872656D3B0A7D0A2E6A746C6974656D2D636F6E74';
wwv_flow_api.g_varchar2_table(4) := '656E74207B0A20206D617267696E3A203020313070783B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C65207B0A20206D617267696E3A203130707820303B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074642E73656C';
wwv_flow_api.g_varchar2_table(5) := '6563746564207B0A20206261636B67726F756E642D636F6C6F723A20236637663762613B0A7D0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B';
wwv_flow_api.g_varchar2_table(6) := '0A7D0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B0A202070616464696E673A2035707820313070783B0A2020706F736974696F6E3A2072656C61746976653B0A2020666C6F61743A2072696768743B0A7D0A2F2A0A2E6A746C69';
wwv_flow_api.g_varchar2_table(7) := '74656D2D6469616C6F6720627574746F6E207B0A2020626F726465723A206E6F6E653B0A2020636F6C6F723A20233338333833383B0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(8) := '6F6C6F723A20236638663866383B0A2020626F782D736861646F773A20302030203020317078207267626128302C302C302C2E3132352920696E7365743B0A2020626F726465722D7261646975733A203270783B0A2020746578742D736861646F773A20';
wwv_flow_api.g_varchar2_table(9) := '6E6F6E653B0A202070616464696E673A202E3472656D202E3872656D3B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A20206D617267696E3A202E3472656D3B0A7D0A2A2F0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E';
wwv_flow_api.g_varchar2_table(10) := '6572202E742D427574746F6E2D6C6162656C207B0A20206C696E652D6865696768743A20312E3872656D3B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2F2A2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E63';
wwv_flow_api.g_varchar2_table(11) := '73732E6D6170202A2F0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465087039112501031)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/css/jtl_item.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141413B454143452C7342414173423B43414376423B414143443B494143492C71424141';
wwv_flow_api.g_varchar2_table(2) := '71423B43414378423B414143443B494143492C6742414167423B4341436E423B414143443B454143452C7142414171423B43414374423B414143443B454143452C654141653B43414368423B414143443B454143452C654141653B43414368423B414143';
wwv_flow_api.g_varchar2_table(3) := '443B454143452C3042414130423B43414333423B414143443B454143452C7342414173423B43414376423B414143443B454143452C6B4241416B423B4541436C422C6D4241416D423B4541436E422C614141613B434143643B414143443B3B3B3B3B3B3B';
wwv_flow_api.g_varchar2_table(4) := '3B3B3B3B3B3B454161453B414143463B454143452C6F4241416F423B45414370422C6F4241416F423B4341437242222C2266696C65223A226A746C5F6974656D2E637373222C22736F7572636573436F6E74656E74223A5B222E6A746C6974656D2D636F';
wwv_flow_api.g_varchar2_table(5) := '6E74726F6C73207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D427574';
wwv_flow_api.g_varchar2_table(6) := '746F6E207B5C6E2020202070616464696E673A202E3872656D202E3972656D3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D42757474';
wwv_flow_api.g_varchar2_table(7) := '6F6E207B5C6E2020202070616464696E673A20312E3272656D3B5C6E7D5C6E627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E207B5C6E202070616464696E673A202E3472656D202E3872656D3B5C6E7D5C6E2E6A746C6974656D2D636F6E';
wwv_flow_api.g_varchar2_table(8) := '74656E74207B5C6E20206D617267696E3A203020313070783B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C65207B5C6E20206D617267696E3A203130707820303B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C65';
wwv_flow_api.g_varchar2_table(9) := '2074642E73656C6563746564207B5C6E20206261636B67726F756E642D636F6C6F723A20236637663762613B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E207B5C6E2020646973706C61793A20696E';
wwv_flow_api.g_varchar2_table(10) := '6C696E652D626C6F636B3B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B5C6E202070616464696E673A2035707820313070783B5C6E2020706F736974696F6E3A2072656C61746976653B5C6E2020666C6F61743A2072';
wwv_flow_api.g_varchar2_table(11) := '696768743B5C6E7D5C6E2F2A5C6E2E6A746C6974656D2D6469616C6F6720627574746F6E207B5C6E2020626F726465723A206E6F6E653B5C6E2020636F6C6F723A20233338333833383B5C6E20206261636B67726F756E642D636C69703A207061646469';
wwv_flow_api.g_varchar2_table(12) := '6E672D626F783B5C6E20206261636B67726F756E642D636F6C6F723A20236638663866383B5C6E2020626F782D736861646F773A20302030203020317078207267626128302C302C302C2E3132352920696E7365743B5C6E2020626F726465722D726164';
wwv_flow_api.g_varchar2_table(13) := '6975733A203270783B5C6E2020746578742D736861646F773A206E6F6E653B5C6E202070616464696E673A202E3472656D202E3872656D3B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E20206D617267696E3A202E3472656D3B';
wwv_flow_api.g_varchar2_table(14) := '5C6E7D5C6E2A2F5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E742D427574746F6E2D6C6162656C207B5C6E20206C696E652D6865696768743A20312E3872656D3B5C6E2020766572746963616C2D616C69676E3A20746F703B';
wwv_flow_api.g_varchar2_table(15) := '5C6E7D225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465087286426501054)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/css/jtl_item.css.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6A746C6974656D2D636F6E74726F6C737B646973706C61793A696E6C696E652D626C6F636B7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D427574';
wwv_flow_api.g_varchar2_table(2) := '746F6E7B70616464696E673A2E3872656D202E3972656D7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D427574746F6E7B70616464696E673A312E';
wwv_flow_api.g_varchar2_table(3) := '3272656D7D627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E7B70616464696E673A2E3472656D202E3872656D7D2E6A746C6974656D2D636F6E74656E747B6D617267696E3A3020313070787D2E6A746C6974656D2D636F6E74656E742074';
wwv_flow_api.g_varchar2_table(4) := '61626C657B6D617267696E3A3130707820307D2E6A746C6974656D2D636F6E74656E74207461626C652074642E73656C65637465647B6261636B67726F756E642D636F6C6F723A236637663762617D2E6A746C6974656D2D627574746F6E2D636F6E7461';
wwv_flow_api.g_varchar2_table(5) := '696E6572202E75692D69636F6E7B646973706C61793A696E6C696E652D626C6F636B7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E65727B70616464696E673A35707820313070783B706F736974696F6E3A72656C61746976653B666C6F61';
wwv_flow_api.g_varchar2_table(6) := '743A72696768747D2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E742D427574746F6E2D6C6162656C7B6C696E652D6865696768743A312E3872656D3B766572746963616C2D616C69676E3A746F707D0A2F2A2320736F757263654D';
wwv_flow_api.g_varchar2_table(7) := '617070696E6755524C3D6A746C5F6974656D2E6D696E2E6373732E6D6170202A2F0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465087745128501058)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/css/jtl_item.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141412C6B424143452C514141412C614145462C69454143492C514141412C4D4141412C';
wwv_flow_api.g_varchar2_table(2) := '4D41454A2C6B454143492C514141412C4F41454A2C30424143452C514141412C4D4141412C4D4145462C69424143452C4F4141412C454141412C4B4145462C75424143452C4F4141412C4B4141412C454145462C6D434143452C69424141412C51414546';
wwv_flow_api.g_varchar2_table(3) := '2C6D434143452C514141412C614145462C30424143452C514141412C494141412C4B4143412C534141412C534143412C4D4141412C4D416742462C30434143452C594141412C4F4143412C65414141222C2266696C65223A226A746C5F6974656D2E6D69';
wwv_flow_api.g_varchar2_table(4) := '6E2E637373222C22736F7572636573436F6E74656E74223A5B222E6A746C6974656D2D636F6E74726F6C73207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D';
wwv_flow_api.g_varchar2_table(5) := '6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D427574746F6E207B5C6E2020202070616464696E673A202E3872656D202E3972656D3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C';
wwv_flow_api.g_varchar2_table(6) := '6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E742D427574746F6E207B5C6E2020202070616464696E673A20312E3272656D3B5C6E7D5C6E627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E207B5C6E202070';
wwv_flow_api.g_varchar2_table(7) := '616464696E673A202E3472656D202E3872656D3B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207B5C6E20206D617267696E3A203020313070783B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C65207B5C6E20206D61726769';
wwv_flow_api.g_varchar2_table(8) := '6E3A203130707820303B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074642E73656C6563746564207B5C6E20206261636B67726F756E642D636F6C6F723A20236637663762613B5C6E7D5C6E2E6A746C6974656D2D627574746F';
wwv_flow_api.g_varchar2_table(9) := '6E2D636F6E7461696E6572202E75692D69636F6E207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B5C6E202070616464696E673A2035707820313070';
wwv_flow_api.g_varchar2_table(10) := '783B5C6E2020706F736974696F6E3A2072656C61746976653B5C6E2020666C6F61743A2072696768743B5C6E7D5C6E2F2A5C6E2E6A746C6974656D2D6469616C6F6720627574746F6E207B5C6E2020626F726465723A206E6F6E653B5C6E2020636F6C6F';
wwv_flow_api.g_varchar2_table(11) := '723A20233338333833383B5C6E20206261636B67726F756E642D636C69703A2070616464696E672D626F783B5C6E20206261636B67726F756E642D636F6C6F723A20236638663866383B5C6E2020626F782D736861646F773A2030203020302031707820';
wwv_flow_api.g_varchar2_table(12) := '7267626128302C302C302C2E3132352920696E7365743B5C6E2020626F726465722D7261646975733A203270783B5C6E2020746578742D736861646F773A206E6F6E653B5C6E202070616464696E673A202E3472656D202E3872656D3B5C6E2020646973';
wwv_flow_api.g_varchar2_table(13) := '706C61793A20696E6C696E652D626C6F636B3B5C6E20206D617267696E3A202E3472656D3B5C6E7D5C6E2A2F5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E742D427574746F6E2D6C6162656C207B5C6E20206C696E652D6865';
wwv_flow_api.g_varchar2_table(14) := '696768743A20312E3872656D3B5C6E2020766572746963616C2D616C69676E3A20746F703B5C6E7D225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465088103958501064)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/css/jtl_item.min.css.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076322E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052696D';
wwv_flow_api.g_varchar2_table(2) := '626C617320C2A920323031370A2A2F0A0A242E776964676574282022746B2E6A746C5F6974656D222C207B0A200A20202F2F2044656661756C74206F7074696F6E732E0A20206F7074696F6E733A207B0A20202020206C616E673A2022656E222C0A2020';
wwv_flow_api.g_varchar2_table(3) := '2020206C616E675F636F6465733A205B22656E222C226672222C226573225D2C0A20202020206D657373616765733A206E756C6C2C0A20202020206669656C6453697A653A2033302C0A20202020206669656C64526F77733A20352C0A20202020206669';
wwv_flow_api.g_varchar2_table(4) := '656C644D61784C656E6774683A2038302C0A20202020206469616C6F675469746C653A206E756C6C0A20207D2C0A20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B0A202020202076617220756977203D2074';
wwv_flow_api.g_varchar2_table(5) := '6869733B0A0A20202020207569772E5F76616C756573203D207B0A2020202020202020617065784974656D49643A2027272C0A2020202020202020636F6E74726F6C7349643A2027272C0A20202020202020206669656C6453697A653A2033302C0A2020';
wwv_flow_api.g_varchar2_table(6) := '2020202020206669656C644D61784C656E6774683A2038302C0A2020202020202020646174614A534F4E3A207B7D2C0A2020202020202020637572725F6C616E675F696E6465783A20302C0A20202020202020206C616E6775616765733A207B7D2C0A20';
wwv_flow_api.g_varchar2_table(7) := '202020202020207461674D61703A207B7D2C0A20202020202020206D657373616765733A20242E70617273654A534F4E287569772E6F7074696F6E732E6D65737361676573292C0A2020202020202020746F74616C4C616E6775616765733A20302C0A20';
wwv_flow_api.g_varchar2_table(8) := '2020202020202064697361626C65643A2066616C73652C0A2020202020202020666F6375734F6E436C6F73653A2027425554544F4E272C202F2F425554544F4E206F7220494E5055542C0A20202020202020206E65775265636F72643A2066616C73652C';
wwv_flow_api.g_varchar2_table(9) := '0A20202020202020207369676E616C4368616E67653A2066616C73650A20202020207D3B0A0A20202020207569772E5F656C656D656E7473203D207B0A20202020202020202477696E646F773A207B7D2C0A202020202020202024646F63756D656E743A';
wwv_flow_api.g_varchar2_table(10) := '207B7D2C0A202020202020202024626F64793A207B7D2C0A20202020202020202468696464656E496E7075743A207B7D2C0A202020202020202024646973706C6179496E7075743A207B7D2C0A2020202020202020246669656C647365743A207B7D2C0A';
wwv_flow_api.g_varchar2_table(11) := '2020202020202020246D6C73427574746F6E3A207B7D2C0A2020202020202020246469616C6F673A207B7D2C0A2020202020202020246469616C6F67436F6E74656E743A207B7D2C0A20202020202020202473617665427574746F6E3A207B7D2C0A2020';
wwv_flow_api.g_varchar2_table(12) := '2020202020202463616E63656C427574746F6E3A207B7D2C0A202020202020202024627574746F6E436F6E7461696E65723A207B7D0A20202020207D3B0A20207D2C0A20205F6372656174653A2066756E6374696F6E2829207B0A202020207661722075';
wwv_flow_api.g_varchar2_table(13) := '6977203D20746869733B0A0A202020202F2F204F7074696F6E732061726520616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73290A0A202020202F2F206865';
wwv_flow_api.g_varchar2_table(14) := '6C7065722066756E6374696F6E20666F722066696E64696E672074686520706F736974696F6E206F66206F75722063757272656E7420646973706C61796564206C616E67756167650A2020202066756E6374696F6E206C616E67756167655F696E646578';
wwv_flow_api.g_varchar2_table(15) := '20286A2C206C29207B0A2020202020207661722069203D206E756C6C2C0A20202020202020202020696478203D202D313B0A202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D20';
wwv_flow_api.g_varchar2_table(16) := '3129207B0A2020202020202020696620286A5B695D2E6C203D3D3D206C29207B0A20202020202020202020696478203D20693B0A20202020202020207D0A2020202020207D0A20202020202072657475726E206964783B0A202020207D0A0A2020202075';
wwv_flow_api.g_varchar2_table(17) := '69772E5F6372656174655072697661746553746F7261676528293B0A202020207569772E5F76616C7565732E617065784974656D4964203D2024287569772E656C656D656E74292E617474722827696427293B0A202020207569772E5F76616C7565732E';
wwv_flow_api.g_varchar2_table(18) := '636F6E74726F6C734964203D207569772E5F76616C7565732E617065784974656D4964202B20275F6669656C64736574273B0A202020207569772E5F696E6974456C656D656E747328293B0A202020207569772E5F696E697442617365456C656D656E74';
wwv_flow_api.g_varchar2_table(19) := '7328293B0A0A202020207569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B0A202020207569772E5F76616C7565732E746F74616C4C616E677561676573';
wwv_flow_api.g_varchar2_table(20) := '203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B0A0A202020202F2F2067657420746865206672657368206C697374206F66206C616E6775616765730A202020207569772E5F696E6974446174614A534F4E28293B0A2020';
wwv_flow_api.g_varchar2_table(21) := '20207569772E5F696E69744C616E67756167654D617028293B0A202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E670A202020207569772E5F76616C7565732E637572725F6C616E675F696E6465';
wwv_flow_api.g_varchar2_table(22) := '78203D206C616E67756167655F696E646578287569772E5F76616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B0A202020200A202020202F2F2053796E63206F75722068696464656E206669656C6420776974682074';
wwv_flow_api.g_varchar2_table(23) := '68652061637475616C2076616C756520696E2074686520636F7272656374206C616E67756167652C206275740A202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074';
wwv_flow_api.g_varchar2_table(24) := '686520636F72726563742076616C7565200A202020207569772E5F656C656D656E74732E24646973706C6179496E7075740A202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E6348696464656E';
wwv_flow_api.g_varchar2_table(25) := '4669656C64293B0A202020207569772E5F656C656D656E74732E24646F63756D656E740A202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E6348696464656E';
wwv_flow_api.g_varchar2_table(26) := '4669656C64293B0A0A202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A20202020';
wwv_flow_api.g_varchar2_table(27) := '617065782E64656275672E6D65737361676528342C225265676973746572696E67207769746820617065782E7769646765742E696E6974506167654974656D3A2022202B207569772E5F656C656D656E74732E24646973706C6179496E7075742E617474';
wwv_flow_api.g_varchar2_table(28) := '72282769642729293B0A0A20202020617065782E7769646765742E696E6974506167654974656D287569772E5F656C656D656E74732E2468696464656E496E7075742E617474722827696427292C207B0A2020202020202073657456616C75653A206675';
wwv_flow_api.g_varchar2_table(29) := '6E6374696F6E2876616C75652C20646973706C617956616C756529207B0A202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973706C617956616C7565293B0A20202020202020202020756977';
wwv_flow_api.g_varchar2_table(30) := '2E5F73796E6348696464656E4669656C6428293B0A202020202020207D2C0A2020202020202067657456616C75653A2066756E6374696F6E2829207B0A2020202020202020202072657475726E207569772E5F656C656D656E74732E2468696464656E49';
wwv_flow_api.g_varchar2_table(31) := '6E7075742E76616C28293B0A202020202020207D2C0A20202020202020736574466F6375733A2066756E6374696F6E2829207B0A202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328293B0A20';
wwv_flow_api.g_varchar2_table(32) := '2020202020207D2C0A202020202020202F2F2073686F773A2066756E6374696F6E2829207B0A202020202020202F2F202020207569772E73686F7728293B0A202020202020202F2F207D2C0A202020202020202F2F20686964653A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(33) := '2829207B0A202020202020202F2F202020207569772E6869646528293B0A202020202020202F2F207D2C0A20202020202020656E61626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E656E61626C6528293B0A2020202020';
wwv_flow_api.g_varchar2_table(34) := '20207D2C0A2020202020202064697361626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E64697361626C6528293B0A202020202020207D0A202020207D293B0A0A20207D2C0A20205F696E6974456C656D656E74733A2066';
wwv_flow_api.g_varchar2_table(35) := '756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2477696E646F77203D20242877696E646F77293B0A20202020207569772E5F656C656D656E74732E24646F63756D65';
wwv_flow_api.g_varchar2_table(36) := '6E74203D202428646F63756D656E74293B0A20202020207569772E5F656C656D656E74732E24626F6479203D202428646F63756D656E742E626F6479293B0A20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A';
wwv_flow_api.g_varchar2_table(37) := '746C6974656D2D6469616C6F6727293B0A0A20207D2C0A20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E';
wwv_flow_api.g_varchar2_table(38) := '246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D202428276469762E6A746C6974656D2D636F6E74656E7427293B0A202020';
wwv_flow_api.g_varchar2_table(39) := '20207569772E5F656C656D656E74732E2473617665427574746F6E203D20242827627574746F6E2E6A746C6974656D2D736176652D627574746F6E27293B0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D202428';
wwv_flow_api.g_varchar2_table(40) := '27627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B0A0A20207D2C0A20205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020';
wwv_flow_api.g_varchar2_table(41) := '7569772E5F656C656D656E74732E2468696464656E496E707574203D207569772E656C656D656E743B0A20202020207569772E5F656C656D656E74732E24646973706C6179496E707574203D202428272327202B207569772E5F76616C7565732E617065';
wwv_flow_api.g_varchar2_table(42) := '784974656D4964202B20275F444953504C415927293B20202020200A20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D202254455854223F207569772E5F656C656D65';
wwv_flow_api.g_varchar2_table(43) := '6E74732E24646973706C6179496E7075742E61747472282273697A652229203A207569772E5F656C656D656E74732E24646973706C6179496E7075742E617474722822636F6C7322293B0A2020202020696620287569772E6F7074696F6E732E6974656D';
wwv_flow_api.g_varchar2_table(44) := '54797065203D3D3D202254455854415245412229207B0A202020202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E617474722822726F777322293B0A20202020';
wwv_flow_api.g_varchar2_table(45) := '207D0A20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E6174747228226D61786C656E67746822293B0A0A20202020207569772E5F656C656D65';
wwv_flow_api.g_varchar2_table(46) := '6E74732E246669656C64736574203D202428272327202B207569772E5F76616C7565732E636F6E74726F6C734964293B0A20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D0A20202020202020207569772E5F656C656D656E';
wwv_flow_api.g_varchar2_table(47) := '74732E246669656C647365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B0A20207D2C0A20205F696E6974446174614A534F4E3A2066756E6374696F6E28297B0A202020202076617220756977203D20746869';
wwv_flow_api.g_varchar2_table(48) := '732C0A2020202020202020206A736F6E44617461203D205B5D2C0A202020202020202020696E7075745F64617461203D207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B0A0A202020202069662028696E7075745F64';
wwv_flow_api.g_varchar2_table(49) := '61746129207B0A20202020202020207569772E5F76616C7565732E646174614A534F4E203D204A534F4E2E706172736528696E7075745F64617461293B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B';
wwv_flow_api.g_varchar2_table(50) := '0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F20546865207265636F726420697320656D70747920736F207765206275696C642061200A20202020202020202F2F206275696C64204A534F4E20776974682074686973207374';
wwv_flow_api.g_varchar2_table(51) := '7275637475726520746F20736565642069743A0A20202020202020202F2F20205B207B226C223A20227573222C2022746C223A202250726F6A65637420416E616C79736973227D0A20202020202020202F2F20202C207B226C223A20226672222C202274';
wwv_flow_api.g_varchar2_table(52) := '6C223A2022416E616C7973652064652070726F6A6574227D0A20202020202020202F2F20202C207B226C223A20226573222C2022746C223A2022416E616C697369732064652070726F6A6563746F227D5D0A20202020202020207569772E5F76616C7565';
wwv_flow_api.g_varchar2_table(53) := '732E6C616E6775616765732E666F72456163682866756E6374696F6E286C29207B0A20202020202020202020206A736F6E446174612E70757368287B226C223A206C2C2022746C223A2022227D293B0A20202020202020207D293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(54) := '2F2F20496E6974207468652068696464656E206974656D0A20202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679286A736F6E4461746129293B0A20202020202020207569';
wwv_flow_api.g_varchar2_table(55) := '772E5F76616C7565732E646174614A534F4E203D206A736F6E446174613B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B0A20202020207D0A0A20207D2C0A20205F73796E6348696464656E4669656C64';
wwv_flow_api.g_varchar2_table(56) := '3A2066756E6374696F6E286576656E744F626A29207B0A20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C0A2020202020766172207569772C0A2020202020202020206C616E674A534F4E203D207B7D2C0A2020';
wwv_flow_api.g_varchar2_table(57) := '202020202020206C616E675F696E6465783B0A0A202020202069662028747970656F66206576656E744F626A20213D2022756E646566696E65642229207B0A20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E74';
wwv_flow_api.g_varchar2_table(58) := '0A2020202020202020756977203D206576656E744F626A2E646174612E7569773B0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F206469726563742063616C6C0A2020202020202020756977203D20746869733B0A20202020';
wwv_flow_api.g_varchar2_table(59) := '207D0A0A20202020206C616E675F696E646578203D207569772E5F76616C7565732E637572725F6C616E675F696E6465783B0A0A2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B0A20202020202020202F2F20736176';
wwv_flow_api.g_varchar2_table(60) := '6520746865206E6577207465787420696E746F2074686520414C4C20746865207265636F72647320696E20746865204A534F4E207374727563747572650A2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C';
wwv_flow_api.g_varchar2_table(61) := '4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B0A202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C';
wwv_flow_api.g_varchar2_table(62) := '28293B0A20202020202020207D0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E207374727563747572650A20202020202020207569772E5F76';
wwv_flow_api.g_varchar2_table(63) := '616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B0A20202020207D0A20202020202F2F20706C616365207468652066756C6C204A534F';
wwv_flow_api.g_varchar2_table(64) := '4E206261636B20696E746F207468652068696464656E206974656D0A20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29';
wwv_flow_api.g_varchar2_table(65) := '293B0A20202020202F2F204B65657020746865206D617020667265736820286F6E6C79206E656564656420666F7220746865206469616C6F67290A20202020207569772E5F696E69744C616E67756167654D617028293B0A20207D2C0A20205F696E6974';
wwv_flow_api.g_varchar2_table(66) := '4469616C6F67427574746F6E733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E0A20202020202020202E62696E642827636C';
wwv_flow_api.g_varchar2_table(67) := '69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C69636B293B0A0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E0A20202020202020202E62696E642827636C6963';
wwv_flow_api.g_varchar2_table(68) := '6B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69636B293B0A0A20207D2C0A20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A';
wwv_flow_api.g_varchar2_table(69) := '202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C642063617363616465';
wwv_flow_api.g_varchar2_table(70) := '20746F2072656D6F766520746865206469616C6F670A20207D2C0A20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E6461';
wwv_flow_api.g_varchar2_table(71) := '74612E7569772C0A202020202020202020646973706C61795F76616C75653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374';
wwv_flow_api.g_varchar2_table(72) := '696F6E28692C656C297B0A2020202020202020617065782E64656275672E6D65737361676528342C69202B20222822202B20656C2E646174617365742E6C616E67202B2022293A22202B20656C2E76616C7565293B0A20202020202020207569772E5F76';
wwv_flow_api.g_varchar2_table(73) := '616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E6C616E673B0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C75653B0A2020202020202020696620287569';
wwv_flow_api.g_varchar2_table(74) := '772E5F76616C7565732E637572725F6C616E675F696E646578203D3D206929207B0A2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B0A20202020202020207D0A20202020207D293B0A0A20202020207569772E';
wwv_flow_api.g_varchar2_table(75) := '5F696E69744C616E67756167654D617028293B0A0A20202020202F2F2073796E6320746865206974656D7320616761696E0A20202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973706C61795F76616C7565';
wwv_flow_api.g_varchar2_table(76) := '293B0A20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B0A20202020202F2F207569772E5F7369676E616C436861';
wwv_flow_api.g_varchar2_table(77) := '6E676528293B20202F2F20646F657320746865202E76616C20747269676765722061206368616E676520616C72656164793F0A20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A20202020207569772E5F656C';
wwv_flow_api.g_varchar2_table(78) := '656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A20207D2C0A20205F7369676E616C4368616E67653A206675';
wwv_flow_api.g_varchar2_table(79) := '6E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A202020202020202068696464656E456C6D74203D207569772E5F656C656D656E74732E2468696464656E496E7075745B305D2C20202F2F20446F20776520757365205B30';
wwv_flow_api.g_varchar2_table(80) := '5D206F72206A7175657279206F626A6563743F0A2020202020202020646973706C6179456C6D74203D207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D3B0A0A20202020202F2F4E65656420617065782E6A51756572792066';
wwv_flow_api.g_varchar2_table(81) := '6F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B0A2020202020617065782E6A51756572792868696464656E456C6D74292E7472696767657228276368616E676527293B0A20202020';
wwv_flow_api.g_varchar2_table(82) := '20617065782E6A517565727928646973706C6179456C6D74292E7472696767657228276368616E676527293B0A20207D2C0A20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220';
wwv_flow_api.g_varchar2_table(83) := '756977203D206576656E744F626A2E646174612E7569773B0A0A20202020207569772E5F73796E6348696464656E4669656C64286576656E744F626A293B0A20202020207569772E5F73686F774469616C6F6728293B0A20207D2C0A20205F696E69744C';
wwv_flow_api.g_varchar2_table(84) := '616E67756167654D61703A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A20202020202020202069203D206E756C6C2C0A20202020202020202074616773203D207B7D3B0A0A202020202074616773203D207569';
wwv_flow_api.g_varchar2_table(85) := '772E5F76616C7565732E646174614A534F4E3B0A0A20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A736F6E2D61727261792F0A20202020207569772E';
wwv_flow_api.g_varchar2_table(86) := '5F76616C7565732E7461674D6170203D207B7D3B0A2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B0A2020202020202020207569772E5F76616C7565732E7461674D61705B746167735B695D';
wwv_flow_api.g_varchar2_table(87) := '2E6C5D203D20746167735B695D2E746C3B0A20202020207D0A2020202020200A20207D2C0A20205F6861735461673A2066756E6374696F6E287461674E616D6529207B0A202020202076617220756977203D20746869733B0A202020202072657475726E';
wwv_flow_api.g_varchar2_table(88) := '207569772E5F76616C7565732E7461674D61705B7461674E616D655D3B0A20207D2C0A20205F73686F774469616C6F673A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A2020202020202020206C616E67546162';
wwv_flow_api.g_varchar2_table(89) := '6C652C0A202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F696E6465782C0A2020202020202020206469616C6F6748746D6C3B0A0A20202020206C616E675461626C65203D200A202020202020';
wwv_flow_api.g_varchar2_table(90) := '2020202020273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E27202B0A202020202020202020202027203C74723E5C6E27202B0A20';
wwv_flow_api.g_varchar2_table(91) := '202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C48656164223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B0A20202020202020';
wwv_flow_api.g_varchar2_table(92) := '202020202720203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B0A2020202020202020';
wwv_flow_api.g_varchar2_table(93) := '20202027203C2F74723E5C6E27202B0A202020202020202020202027203C74723E5C6E273B0A0A2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E6465782C206C616E672029207B0A';
wwv_flow_api.g_varchar2_table(94) := '202020202020206C616E675461626C65202B3D0A2020202020202027203C74723E5C6E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443';
wwv_flow_api.g_varchar2_table(95) := '27202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B2027223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C616E6729202B20273C2F74643E27202B0A202020202020202720';
wwv_flow_api.g_varchar2_table(96) := '203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C27202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B2027223E273B0A20';
wwv_flow_api.g_varchar2_table(97) := '202020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D2022544558542229207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C696E70757420747970653D22746578742220';
wwv_flow_api.g_varchar2_table(98) := '636C6173733D22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B2027222076616C75653D2227202B20617065782E7574696C2E657363617065';
wwv_flow_api.g_varchar2_table(99) := '48544D4C41747472287569772E5F686173546167286C616E672929202B2027222073697A653D2227202B207569772E5F76616C7565732E6669656C6453697A65202B202722206D61786C656E6774683D2227202B207569772E5F76616C7565732E666965';
wwv_flow_api.g_varchar2_table(100) := '6C644D61784C656E677468202B2027223E3C2F74643E273B0A202020202020207D0A20202020202020656C7365207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C746578746172656120636C6173733D';
wwv_flow_api.g_varchar2_table(101) := '22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B20272227202B0A20202020202020202020202020202720636F6C733D2227202B207569';
wwv_flow_api.g_varchar2_table(102) := '772E5F76616C7565732E6669656C6453697A65202B20272220726F77733D2227202B207569772E5F76616C7565732E6669656C64526F7773202B20272227202B200A202020202020202020202020202027206D61786C656E6774683D2227202B20756977';
wwv_flow_api.g_varchar2_table(103) := '2E5F76616C7565732E6669656C644D61784C656E677468202B20272227202B200A2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F686173546167286C616E672929202B2027';
wwv_flow_api.g_varchar2_table(104) := '3C2F74657874617265613E273B0A202020202020207D0A0A202020202020206C616E675461626C65202B3D0A202020202020202027203C2F74723E5C6E273B0A20202020207D293B0A20202020206C616E675461626C65202B3D0A2020202020273C2F74';
wwv_flow_api.g_varchar2_table(105) := '61626C653E5C6E273B0A0A2020202020206469616C6F6748746D6C203D0A2020202020202020202020273C64697620636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E657220';
wwv_flow_api.g_varchar2_table(106) := '75692D776964676574223E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20';
wwv_flow_api.g_varchar2_table(107) := '636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F';
wwv_flow_api.g_varchar2_table(108) := '76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B0A20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D2275692D69636F6E2075692D69636F6E2D636C6F736522';
wwv_flow_api.g_varchar2_table(109) := '3E3C2F7370616E3E27202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D42';
wwv_flow_api.g_varchar2_table(110) := '7574746F6E20742D427574746F6E2D2D686F74223E27202B200A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C7565732E6D657373616765732E61';
wwv_flow_api.g_varchar2_table(111) := '70706C794368616E676573202B20273C2F7370616E3E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E27';
wwv_flow_api.g_varchar2_table(112) := '202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D636F6E74';
wwv_flow_api.g_varchar2_table(113) := '656E74223E5C6E27202B0A20202020202020202020202020206C616E675461626C65202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A2020202020202020202020273C2F6469763E3C2F6469763E5C6E273B0A0A20202020202075';
wwv_flow_api.g_varchar2_table(114) := '69772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B0A0A2020202020207569772E5F696E6974456C656D656E747328293B0A0A20202020202F2F206F70656E2063726561746564206469762061732061206469';
wwv_flow_api.g_varchar2_table(115) := '616C6F670A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B0A202020202020202020636C6F73654F6E4573636170653A20747275652C0A2020202020202020207469746C653A2020202020202020207569772E6F';
wwv_flow_api.g_varchar2_table(116) := '7074696F6E732E6469616C6F675469746C652C0A2020202020202020206175746F526573697A653A20202020747275652C0A2020202020202020206D696E57696474683A2020202020203430302C0A2020202020202020206D696E4865696768743A2020';
wwv_flow_api.g_varchar2_table(117) := '2020203235302C0A20202020202020202077696474683A202020202020202020276175746F272C0A2020202020202020206865696768743A2020202020202020276175746F272C0A2020202020202020206D6F64616C3A20202020202020202074727565';
wwv_flow_api.g_varchar2_table(118) := '2C0A202020202020202020706F736974696F6E3A2020202020207B206D793A20226C656674222C2061743A20226C6566742063656E746572222C206F663A207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D207D2C0A202020';
wwv_flow_api.g_varchar2_table(119) := '2020202020206F70656E3A2066756E6374696F6E2829207B0A2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B0A2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E732829';
wwv_flow_api.g_varchar2_table(120) := '3B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E642827696E70757427292E666972737428292E666F63757328293B0A2020202020202020207D2C0A202020202020202020636C6F7365';
wwv_flow_api.g_varchar2_table(121) := '3A2066756E6374696F6E2829207B0A0A202020202020202020202020242874686973292E6469616C6F67282764657374726F7927293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B0A20';
wwv_flow_api.g_varchar2_table(122) := '20202020202020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B0A0A202020202020202020202020696620287569772E5F76616C756573';
wwv_flow_api.g_varchar2_table(123) := '2E666F6375734F6E436C6F7365203D3D3D2027425554544F4E2729207B0A2020202020202020202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293B0A2020202020202020202020207D20656C7365206966';
wwv_flow_api.g_varchar2_table(124) := '20287569772E5F76616C7565732E666F6375734F6E436C6F7365203D3D3D2027494E5055542729207B0A2020202020202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328293B0A202020202020';
wwv_flow_api.g_varchar2_table(125) := '2020202020207D0A0A2020202020202020202020207569772E5F76616C7565732E666F6375734F6E436C6F7365203D2027425554544F4E273B0A2020202020202020207D0A202020202020207D290A202020202020202E6F6E28276B6579646F776E272C';
wwv_flow_api.g_varchar2_table(126) := '2066756E6374696F6E2865767429207B0A2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B0A2020202020202020202020202020207569772E5F656C656D656E74732E';
wwv_flow_api.g_varchar2_table(127) := '246469616C6F672E6469616C6F672827636C6F736527293B0A20202020202020202020207D202020202020202020202020202020200A20202020202020202020206576742E73746F7050726F7061676174696F6E28293B0A202020202020207D293B0A0A';
wwv_flow_api.g_varchar2_table(128) := '0A20207D2C0A202064697361626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B0A2020202020';
wwv_flow_api.g_varchar2_table(129) := '2020207569772E5F656C656D656E74732E24646973706C6179496E7075740A20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B0A20202020202020207569772E5F656C656D656E74732E246869646465';
wwv_flow_api.g_varchar2_table(130) := '6E496E7075742E61747472282764697361626C6564272C2764697361626C656427293B0A0A20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A20202020202020202020202E61747472282764697361626C6564272C2764';
wwv_flow_api.g_varchar2_table(131) := '697361626C656427290A20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B0A20202020207D0A0A20202020207569772E5F76616C7565732E64697361626C6564203D20747275';
wwv_flow_api.g_varchar2_table(132) := '653B0A20207D2C0A2020656E61626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D207472756529207B0A2020202020';
wwv_flow_api.g_varchar2_table(133) := '20207569772E5F656C656D656E74732E24646973706C6179496E7075742E72656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E72656D6F7665417474722827';
wwv_flow_api.g_varchar2_table(134) := '64697361626C656427293B0A202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202020202E72656D6F766541747472282764697361626C656427290A202020202020202020202E62696E642827636C69636B';
wwv_flow_api.g_varchar2_table(135) := '272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202020207569772E5F76616C7565732E64697361626C6564203D2066616C73653B0A20202020207D0A20207D0A7D293B0A2F2F2320736F757263';
wwv_flow_api.g_varchar2_table(136) := '654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465088471666501068)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/js/jtl_item.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C226E616D6573223A5B5D2C226D617070696E6773223A22222C22736F7572636573223A5B226A746C5F6974656D2E6A73225D2C22736F7572636573436F6E74656E74223A5B222F2A5C6E202A204A544C204974656D2076';
wwv_flow_api.g_varchar2_table(2) := '322E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F5C6E202A5C6E202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954295C6E202A204A6F7267652052696D626C617320C2A920323031375C';
wwv_flow_api.g_varchar2_table(3) := '6E2A2F5C6E5C6E242E77696467657428205C22746B2E6A746C5F6974656D5C222C207B5C6E205C6E20202F2F2044656661756C74206F7074696F6E732E5C6E20206F7074696F6E733A207B5C6E20202020206C616E673A205C22656E5C222C5C6E202020';
wwv_flow_api.g_varchar2_table(4) := '20206C616E675F636F6465733A205B5C22656E5C222C5C2266725C222C5C2265735C225D2C5C6E20202020206D657373616765733A206E756C6C2C5C6E20202020206669656C6453697A653A2033302C5C6E20202020206669656C64526F77733A20352C';
wwv_flow_api.g_varchar2_table(5) := '5C6E20202020206669656C644D61784C656E6774683A2038302C5C6E20202020206469616C6F675469746C653A206E756C6C5C6E20207D2C5C6E20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B5C6E202020';
wwv_flow_api.g_varchar2_table(6) := '202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F76616C756573203D207B5C6E2020202020202020617065784974656D49643A2027272C5C6E2020202020202020636F6E74726F6C7349643A2027272C5C6E20202020202020';
wwv_flow_api.g_varchar2_table(7) := '206669656C6453697A653A2033302C5C6E20202020202020206669656C644D61784C656E6774683A2038302C5C6E2020202020202020646174614A534F4E3A207B7D2C5C6E2020202020202020637572725F6C616E675F696E6465783A20302C5C6E2020';
wwv_flow_api.g_varchar2_table(8) := '2020202020206C616E6775616765733A207B7D2C5C6E20202020202020207461674D61703A207B7D2C5C6E20202020202020206D657373616765733A20242E70617273654A534F4E287569772E6F7074696F6E732E6D65737361676573292C5C6E202020';
wwv_flow_api.g_varchar2_table(9) := '2020202020746F74616C4C616E6775616765733A20302C5C6E202020202020202064697361626C65643A2066616C73652C5C6E2020202020202020666F6375734F6E436C6F73653A2027425554544F4E272C202F2F425554544F4E206F7220494E505554';
wwv_flow_api.g_varchar2_table(10) := '2C5C6E20202020202020206E65775265636F72643A2066616C73652C5C6E20202020202020207369676E616C4368616E67653A2066616C73655C6E20202020207D3B5C6E5C6E20202020207569772E5F656C656D656E7473203D207B5C6E202020202020';
wwv_flow_api.g_varchar2_table(11) := '20202477696E646F773A207B7D2C5C6E202020202020202024646F63756D656E743A207B7D2C5C6E202020202020202024626F64793A207B7D2C5C6E20202020202020202468696464656E496E7075743A207B7D2C5C6E20202020202020202464697370';
wwv_flow_api.g_varchar2_table(12) := '6C6179496E7075743A207B7D2C5C6E2020202020202020246669656C647365743A207B7D2C5C6E2020202020202020246D6C73427574746F6E3A207B7D2C5C6E2020202020202020246469616C6F673A207B7D2C5C6E2020202020202020246469616C6F';
wwv_flow_api.g_varchar2_table(13) := '67436F6E74656E743A207B7D2C5C6E20202020202020202473617665427574746F6E3A207B7D2C5C6E20202020202020202463616E63656C427574746F6E3A207B7D2C5C6E202020202020202024627574746F6E436F6E7461696E65723A207B7D5C6E20';
wwv_flow_api.g_varchar2_table(14) := '202020207D3B5C6E20207D2C5C6E20205F6372656174653A2066756E6374696F6E2829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020202F2F204F7074696F6E732061726520616C7265616479206D657267656420616E6420';
wwv_flow_api.g_varchar2_table(15) := '73746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73295C6E5C6E202020202F2F2068656C7065722066756E6374696F6E20666F722066696E64696E672074686520706F736974696F6E206F66206F7572206375';
wwv_flow_api.g_varchar2_table(16) := '7272656E7420646973706C61796564206C616E67756167655C6E2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B5C6E2020202020207661722069203D206E756C6C2C5C6E20202020202020202020696478203D';
wwv_flow_api.g_varchar2_table(17) := '202D313B5C6E202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B5C6E2020202020202020696620286A5B695D2E6C203D3D3D206C29207B5C6E202020202020202020';
wwv_flow_api.g_varchar2_table(18) := '20696478203D20693B5C6E20202020202020207D5C6E2020202020207D5C6E20202020202072657475726E206964783B5C6E202020207D5C6E5C6E202020207569772E5F6372656174655072697661746553746F7261676528293B5C6E20202020756977';
wwv_flow_api.g_varchar2_table(19) := '2E5F76616C7565732E617065784974656D4964203D2024287569772E656C656D656E74292E617474722827696427293B5C6E202020207569772E5F76616C7565732E636F6E74726F6C734964203D207569772E5F76616C7565732E617065784974656D49';
wwv_flow_api.g_varchar2_table(20) := '64202B20275F6669656C64736574273B5C6E202020207569772E5F696E6974456C656D656E747328293B5C6E202020207569772E5F696E697442617365456C656D656E747328293B5C6E5C6E202020207569772E5F76616C7565732E6C616E6775616765';
wwv_flow_api.g_varchar2_table(21) := '73203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B5C6E202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E67';
wwv_flow_api.g_varchar2_table(22) := '74683B5C6E5C6E202020202F2F2067657420746865206672657368206C697374206F66206C616E6775616765735C6E202020207569772E5F696E6974446174614A534F4E28293B5C6E202020207569772E5F696E69744C616E67756167654D617028293B';
wwv_flow_api.g_varchar2_table(23) := '5C6E202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E675C6E202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D206C616E67756167655F696E646578287569772E';
wwv_flow_api.g_varchar2_table(24) := '5F76616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B5C6E202020205C6E202020202F2F2053796E63206F75722068696464656E206669656C642077697468207468652061637475616C2076616C756520696E207468';
wwv_flow_api.g_varchar2_table(25) := '6520636F7272656374206C616E67756167652C206275745C6E202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C7565205C6E20';
wwv_flow_api.g_varchar2_table(26) := '2020207569772E5F656C656D656E74732E24646973706C6179496E7075745C6E202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E6348696464656E4669656C64293B5C6E202020207569772E5F';
wwv_flow_api.g_varchar2_table(27) := '656C656D656E74732E24646F63756D656E745C6E202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E6348696464656E4669656C64293B5C6E5C6E2020202075';
wwv_flow_api.g_varchar2_table(28) := '69772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E20202020617065782E64656275672E';
wwv_flow_api.g_varchar2_table(29) := '6D65737361676528342C5C225265676973746572696E67207769746820617065782E7769646765742E696E6974506167654974656D3A205C22202B207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472282769642729293B';
wwv_flow_api.g_varchar2_table(30) := '5C6E5C6E20202020617065782E7769646765742E696E6974506167654974656D287569772E5F656C656D656E74732E2468696464656E496E7075742E617474722827696427292C207B5C6E2020202020202073657456616C75653A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(31) := '2876616C75652C20646973706C617956616C756529207B5C6E202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973706C617956616C7565293B5C6E202020202020202020207569772E5F7379';
wwv_flow_api.g_varchar2_table(32) := '6E6348696464656E4669656C6428293B5C6E202020202020207D2C5C6E2020202020202067657456616C75653A2066756E6374696F6E2829207B5C6E2020202020202020202072657475726E207569772E5F656C656D656E74732E2468696464656E496E';
wwv_flow_api.g_varchar2_table(33) := '7075742E76616C28293B5C6E202020202020207D2C5C6E20202020202020736574466F6375733A2066756E6374696F6E2829207B5C6E202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328293B';
wwv_flow_api.g_varchar2_table(34) := '5C6E202020202020207D2C5C6E202020202020202F2F2073686F773A2066756E6374696F6E2829207B5C6E202020202020202F2F202020207569772E73686F7728293B5C6E202020202020202F2F207D2C5C6E202020202020202F2F20686964653A2066';
wwv_flow_api.g_varchar2_table(35) := '756E6374696F6E2829207B5C6E202020202020202F2F202020207569772E6869646528293B5C6E202020202020202F2F207D2C5C6E20202020202020656E61626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E656E6162';
wwv_flow_api.g_varchar2_table(36) := '6C6528293B5C6E202020202020207D2C5C6E2020202020202064697361626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E64697361626C6528293B5C6E202020202020207D5C6E202020207D293B5C6E5C6E20207D2C5C';
wwv_flow_api.g_varchar2_table(37) := '6E20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2477696E646F77203D20242877696E646F77293B5C6E202020';
wwv_flow_api.g_varchar2_table(38) := '20207569772E5F656C656D656E74732E24646F63756D656E74203D202428646F63756D656E74293B5C6E20202020207569772E5F656C656D656E74732E24626F6479203D202428646F63756D656E742E626F6479293B5C6E20202020207569772E5F656C';
wwv_flow_api.g_varchar2_table(39) := '656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B5C6E5C6E20207D2C5C6E20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977';
wwv_flow_api.g_varchar2_table(40) := '203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74';
wwv_flow_api.g_varchar2_table(41) := '203D202428276469762E6A746C6974656D2D636F6E74656E7427293B5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D20242827627574746F6E2E6A746C6974656D2D736176652D627574746F6E27293B5C6E202020';
wwv_flow_api.g_varchar2_table(42) := '20207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D20242827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B5C6E5C6E20207D2C5C6E20205F696E697442617365456C656D656E74733A2066756E';
wwv_flow_api.g_varchar2_table(43) := '6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2468696464656E496E707574203D207569772E656C656D656E743B5C6E20202020207569772E5F656C656D656E74';
wwv_flow_api.g_varchar2_table(44) := '732E24646973706C6179496E707574203D202428272327202B207569772E5F76616C7565732E617065784974656D4964202B20275F444953504C415927293B20202020205C6E20202020207569772E5F76616C7565732E6669656C6453697A65203D2075';
wwv_flow_api.g_varchar2_table(45) := '69772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C223F207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C2273697A655C2229203A207569772E5F656C656D656E74732E24646973706C61';
wwv_flow_api.g_varchar2_table(46) := '79496E7075742E61747472285C22636F6C735C22293B5C6E2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C2254455854415245415C2229207B5C6E202020202020207569772E5F76616C7565732E6669656C6452';
wwv_flow_api.g_varchar2_table(47) := '6F7773203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C22726F77735C22293B5C6E20202020207D5C6E20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F656C';
wwv_flow_api.g_varchar2_table(48) := '656D656E74732E24646973706C6179496E7075742E61747472285C226D61786C656E6774685C22293B5C6E5C6E20202020207569772E5F656C656D656E74732E246669656C64736574203D202428272327202B207569772E5F76616C7565732E636F6E74';
wwv_flow_api.g_varchar2_table(49) := '726F6C734964293B5C6E20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D5C6E20202020202020207569772E5F656C656D656E74732E246669656C647365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F6461';
wwv_flow_api.g_varchar2_table(50) := '6C2D6F70656E27293B5C6E20207D2C5C6E20205F696E6974446174614A534F4E3A2066756E6374696F6E28297B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020206A736F6E44617461203D205B5D2C5C6E202020202020';
wwv_flow_api.g_varchar2_table(51) := '202020696E7075745F64617461203D207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B5C6E5C6E202020202069662028696E7075745F6461746129207B5C6E20202020202020207569772E5F76616C7565732E646174';
wwv_flow_api.g_varchar2_table(52) := '614A534F4E203D204A534F4E2E706172736528696E7075745F64617461293B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E20202020207D5C6E2020202020656C7365207B5C6E202020202020';
wwv_flow_api.g_varchar2_table(53) := '20202F2F20546865207265636F726420697320656D70747920736F207765206275696C642061205C6E20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A5C6E20202020';
wwv_flow_api.g_varchar2_table(54) := '202020202F2F20205B207B5C226C5C223A205C2275735C222C205C22746C5C223A205C2250726F6A65637420416E616C797369735C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2266725C222C205C22746C5C223A205C22416E61';
wwv_flow_api.g_varchar2_table(55) := '6C7973652064652070726F6A65745C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2265735C222C205C22746C5C223A205C22416E616C697369732064652070726F6A6563746F5C227D5D5C6E20202020202020207569772E5F7661';
wwv_flow_api.g_varchar2_table(56) := '6C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E286C29207B5C6E20202020202020202020206A736F6E446174612E70757368287B5C226C5C223A206C2C205C22746C5C223A205C225C227D293B5C6E20202020202020207D';
wwv_flow_api.g_varchar2_table(57) := '293B5C6E20202020202020202F2F20496E6974207468652068696464656E206974656D5C6E20202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679286A736F6E4461746129';
wwv_flow_api.g_varchar2_table(58) := '293B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E203D206A736F6E446174613B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B5C6E20202020207D5C6E5C6E20207D2C5C';
wwv_flow_api.g_varchar2_table(59) := '6E20205F73796E6348696464656E4669656C643A2066756E6374696F6E286576656E744F626A29207B5C6E20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C5C6E2020202020766172207569772C5C6E20202020';
wwv_flow_api.g_varchar2_table(60) := '20202020206C616E674A534F4E203D207B7D2C5C6E2020202020202020206C616E675F696E6465783B5C6E5C6E202020202069662028747970656F66206576656E744F626A20213D205C22756E646566696E65645C2229207B5C6E20202020202020202F';
wwv_flow_api.g_varchar2_table(61) := '2F20776520776572652063616C6C2066726F6D20616E206576656E745C6E2020202020202020756977203D206576656E744F626A2E646174612E7569773B5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F2064697265';
wwv_flow_api.g_varchar2_table(62) := '63742063616C6C5C6E2020202020202020756977203D20746869733B5C6E20202020207D5C6E5C6E20202020206C616E675F696E646578203D207569772E5F76616C7565732E637572725F6C616E675F696E6465783B5C6E5C6E20202020206966202875';
wwv_flow_api.g_varchar2_table(63) := '69772E5F76616C7565732E6E65775265636F726429207B5C6E20202020202020202F2F207361766520746865206E6577207465787420696E746F2074686520414C4C20746865207265636F72647320696E20746865204A534F4E20737472756374757265';
wwv_flow_api.g_varchar2_table(64) := '5C6E2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B5C6E202020202020202020207569772E5F76616C7565732E646174614A534F';
wwv_flow_api.g_varchar2_table(65) := '4E5B695D2E746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B5C6E20202020202020207D5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F207361766520746865206E65';
wwv_flow_api.g_varchar2_table(66) := '77207465787420696E746F20746865204A534F4E207374727563747572655C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D207569772E5F656C656D656E74732E24646973706C6179';
wwv_flow_api.g_varchar2_table(67) := '496E7075742E76616C28293B5C6E20202020207D5C6E20202020202F2F20706C616365207468652066756C6C204A534F4E206261636B20696E746F207468652068696464656E206974656D5C6E20202020207569772E5F656C656D656E74732E24686964';
wwv_flow_api.g_varchar2_table(68) := '64656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B5C6E20202020202F2F204B65657020746865206D617020667265736820286F6E6C79206E656564656420666F7220746865';
wwv_flow_api.g_varchar2_table(69) := '206469616C6F67295C6E20202020207569772E5F696E69744C616E67756167654D617028293B5C6E20207D2C5C6E20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869';
wwv_flow_api.g_varchar2_table(70) := '733B5C6E5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C';
wwv_flow_api.g_varchar2_table(71) := '69636B293B5C6E5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69';
wwv_flow_api.g_varchar2_table(72) := '636B293B5C6E5C6E20207D2C5C6E20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569773B5C6E20';
wwv_flow_api.g_varchar2_table(73) := '202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F675C6E20207D2C5C6E20205F68616E';
wwv_flow_api.g_varchar2_table(74) := '646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569772C5C6E202020202020202020646973706C61795F76616C75653B';
wwv_flow_api.g_varchar2_table(75) := '5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E28692C656C297B5C6E2020202020202020617065782E64656275';
wwv_flow_api.g_varchar2_table(76) := '672E6D65737361676528342C69202B205C22285C22202B20656C2E646174617365742E6C616E67202B205C22293A5C22202B20656C2E76616C7565293B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E6C203D2065';
wwv_flow_api.g_varchar2_table(77) := '6C2E646174617365742E6C616E673B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C75653B5C6E2020202020202020696620287569772E5F76616C7565732E637572725F6C616E675F69';
wwv_flow_api.g_varchar2_table(78) := '6E646578203D3D206929207B5C6E2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B5C6E20202020202020207D5C6E20202020207D293B5C6E5C6E20202020207569772E5F696E69744C616E67756167654D6170';
wwv_flow_api.g_varchar2_table(79) := '28293B5C6E5C6E20202020202F2F2073796E6320746865206974656D7320616761696E5C6E20202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973706C61795F76616C7565293B5C6E20202020207569772E';
wwv_flow_api.g_varchar2_table(80) := '5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B5C6E20202020202F2F207569772E5F7369676E616C4368616E676528293B20202F2F20';
wwv_flow_api.g_varchar2_table(81) := '646F657320746865202E76616C20747269676765722061206368616E676520616C72656164793F5C6E20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E5C6E20202020207569772E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(82) := '6469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F675C6E20207D2C5C6E20205F7369676E616C4368616E67653A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(83) := '2829207B5C6E202020202076617220756977203D20746869732C5C6E202020202020202068696464656E456C6D74203D207569772E5F656C656D656E74732E2468696464656E496E7075745B305D2C20202F2F20446F20776520757365205B305D206F72';
wwv_flow_api.g_varchar2_table(84) := '206A7175657279206F626A6563743F5C6E2020202020202020646973706C6179456C6D74203D207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D3B5C6E5C6E20202020202F2F4E65656420617065782E6A517565727920666F';
wwv_flow_api.g_varchar2_table(85) := '7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B5C6E2020202020617065782E6A51756572792868696464656E456C6D74292E7472696767657228276368616E676527293B5C6E202020';
wwv_flow_api.g_varchar2_table(86) := '2020617065782E6A517565727928646973706C6179456C6D74292E7472696767657228276368616E676527293B5C6E20207D2C5C6E20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E2020202020';
wwv_flow_api.g_varchar2_table(87) := '76617220756977203D206576656E744F626A2E646174612E7569773B5C6E5C6E20202020207569772E5F73796E6348696464656E4669656C64286576656E744F626A293B5C6E20202020207569772E5F73686F774469616C6F6728293B5C6E20207D2C5C';
wwv_flow_api.g_varchar2_table(88) := '6E20205F696E69744C616E67756167654D61703A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E20202020202020202069203D206E756C6C2C5C6E20202020202020202074616773203D207B7D3B5C6E5C6E';
wwv_flow_api.g_varchar2_table(89) := '202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B5C6E5C6E20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A736F6E2D';
wwv_flow_api.g_varchar2_table(90) := '61727261792F5C6E20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B5C6E2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B5C6E2020202020202020207569772E5F7661';
wwv_flow_api.g_varchar2_table(91) := '6C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B5C6E20202020207D5C6E2020202020205C6E20207D2C5C6E20205F6861735461673A2066756E6374696F6E287461674E616D6529207B5C6E2020202020766172';
wwv_flow_api.g_varchar2_table(92) := '20756977203D20746869733B5C6E202020202072657475726E207569772E5F76616C7565732E7461674D61705B7461674E616D655D3B5C6E20207D2C5C6E20205F73686F774469616C6F673A2066756E6374696F6E2829207B5C6E202020202076617220';
wwv_flow_api.g_varchar2_table(93) := '756977203D20746869732C5C6E2020202020202020206C616E675461626C652C5C6E202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F696E6465782C5C6E2020202020202020206469616C6F67';
wwv_flow_api.g_varchar2_table(94) := '48746D6C3B5C6E5C6E20202020206C616E675461626C65203D205C6E2020202020202020202020273C7461626C6520636C6173733D5C22742D5265706F72742D7265706F72745C222073756D6D6172793D5C22417661696C61626C65205472616E736C61';
wwv_flow_api.g_varchar2_table(95) := '74696F6E735C223E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C486561645C223E27202B207569772E5F76616C7565';
wwv_flow_api.g_varchar2_table(96) := '732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C4865616420752D744C5C223E27202B207569772E5F76616C';
wwv_flow_api.g_varchar2_table(97) := '7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B5C6E202020202020202020202027203C2F74723E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E273B5C6E5C6E2020202020242E65';
wwv_flow_api.g_varchar2_table(98) := '616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E6465782C206C616E672029207B5C6E202020202020206C616E675461626C65202B3D5C6E2020202020202027203C74723E5C5C6E27202B5C6E20202020';
wwv_flow_api.g_varchar2_table(99) := '2020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744327202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B2027';
wwv_flow_api.g_varchar2_table(100) := '5C223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C616E6729202B20273C2F74643E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E70757443';
wwv_flow_api.g_varchar2_table(101) := '6F6E7461696E657220752D744C27202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B20275C223E273B5C6E20202020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C22';
wwv_flow_api.g_varchar2_table(102) := '544558545C2229207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C696E70757420747970653D5C22746578745C2220636C6173733D5C22746578745F6669656C6420617065782D6974656D2D7465';
wwv_flow_api.g_varchar2_table(103) := '7874206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C222076616C75653D5C2227202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F686173546167286C616E6729';
wwv_flow_api.g_varchar2_table(104) := '29202B20275C222073697A653D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C22206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C223E3C2F7464';
wwv_flow_api.g_varchar2_table(105) := '3E273B5C6E202020202020207D5C6E20202020202020656C7365207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C746578746172656120636C6173733D5C22746578746172656120617065782D69';
wwv_flow_api.g_varchar2_table(106) := '74656D2D7465787461726561206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C2227202B5C6E20202020202020202020202020202720636F6C733D5C2227202B207569772E5F76616C7565732E66';
wwv_flow_api.g_varchar2_table(107) := '69656C6453697A65202B20275C2220726F77733D5C2227202B207569772E5F76616C7565732E6669656C64526F7773202B20275C2227202B205C6E202020202020202020202020202027206D61786C656E6774683D5C2227202B207569772E5F76616C75';
wwv_flow_api.g_varchar2_table(108) := '65732E6669656C644D61784C656E677468202B20275C2227202B205C6E2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F686173546167286C616E672929202B20273C2F7465';
wwv_flow_api.g_varchar2_table(109) := '7874617265613E273B5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E202020202020202027203C2F74723E5C5C6E273B5C6E20202020207D293B5C6E20202020206C616E675461626C65202B3D5C6E2020202020';
wwv_flow_api.g_varchar2_table(110) := '273C2F7461626C653E5C5C6E273B5C6E5C6E2020202020206469616C6F6748746D6C203D5C6E2020202020202020202020273C64697620636C6173733D5C226A746C6974656D2D6469616C6F675C223E3C64697620636C6173733D5C226A746C6974656D';
wwv_flow_api.g_varchar2_table(111) := '2D636F6E7461696E65722075692D7769646765745C223E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D627574746F6E2D636F6E7461696E65725C223E5C5C6E27202B5C6E20202020202020';
wwv_flow_api.g_varchar2_table(112) := '202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E5C223E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D42';
wwv_flow_api.g_varchar2_table(113) := '7574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B5C6E20202020202020202020202F2F2027202020202020203C7370616E20636C617373';
wwv_flow_api.g_varchar2_table(114) := '3D5C2275692D69636F6E2075692D69636F6E2D636C6F73655C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720202020203C627574746F6E2063';
wwv_flow_api.g_varchar2_table(115) := '6C6173733D5C226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F745C223E27202B205C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(116) := '6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C794368616E676573202B20273C2F7370616E3E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D49636F6E';
wwv_flow_api.g_varchar2_table(117) := '20742D49636F6E2D2D72696768742066612066612D636865636B5C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720203C2F6469763E5C5C6E27';
wwv_flow_api.g_varchar2_table(118) := '202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D636F6E74656E745C223E5C5C6E27202B5C6E20202020202020202020202020206C616E675461626C65202B5C6E20202020202020202020202720203C2F';
wwv_flow_api.g_varchar2_table(119) := '6469763E5C5C6E27202B5C6E2020202020202020202020273C2F6469763E3C2F6469763E5C5C6E273B5C6E5C6E2020202020207569772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B5C6E5C6E202020202020';
wwv_flow_api.g_varchar2_table(120) := '7569772E5F696E6974456C656D656E747328293B5C6E5C6E20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F675C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B5C6E20';
wwv_flow_api.g_varchar2_table(121) := '2020202020202020636C6F73654F6E4573636170653A20747275652C5C6E2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C5C6E2020202020202020206175746F526573697A653A';
wwv_flow_api.g_varchar2_table(122) := '20202020747275652C5C6E2020202020202020206D696E57696474683A2020202020203430302C5C6E2020202020202020206D696E4865696768743A20202020203235302C5C6E20202020202020202077696474683A202020202020202020276175746F';
wwv_flow_api.g_varchar2_table(123) := '272C5C6E2020202020202020206865696768743A2020202020202020276175746F272C5C6E2020202020202020206D6F64616C3A202020202020202020747275652C5C6E202020202020202020706F736974696F6E3A2020202020207B206D793A205C22';
wwv_flow_api.g_varchar2_table(124) := '6C6566745C222C2061743A205C226C6566742063656E7465725C222C206F663A207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D207D2C5C6E2020202020202020206F70656E3A2066756E6374696F6E2829207B5C6E202020';
wwv_flow_api.g_varchar2_table(125) := '2020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B5C6E2020202020202020202020207569772E5F656C656D656E74';
wwv_flow_api.g_varchar2_table(126) := '732E246469616C6F67436F6E74656E742E66696E642827696E70757427292E666972737428292E666F63757328293B5C6E2020202020202020207D2C5C6E202020202020202020636C6F73653A2066756E6374696F6E2829207B5C6E5C6E202020202020';
wwv_flow_api.g_varchar2_table(127) := '202020202020242874686973292E6469616C6F67282764657374726F7927293B5C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B5C6E2020202020202020202020207569772E5F656C656D';
wwv_flow_api.g_varchar2_table(128) := '656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B5C6E5C6E202020202020202020202020696620287569772E5F76616C7565732E666F6375734F6E436C6F7365203D3D3D20';
wwv_flow_api.g_varchar2_table(129) := '27425554544F4E2729207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293B5C6E2020202020202020202020207D20656C736520696620287569772E5F76616C7565732E666F';
wwv_flow_api.g_varchar2_table(130) := '6375734F6E436C6F7365203D3D3D2027494E5055542729207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328293B5C6E2020202020202020202020207D5C6E5C6E202020';
wwv_flow_api.g_varchar2_table(131) := '2020202020202020207569772E5F76616C7565732E666F6375734F6E436C6F7365203D2027425554544F4E273B5C6E2020202020202020207D5C6E202020202020207D295C6E202020202020202E6F6E28276B6579646F776E272C2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(132) := '2865767429207B5C6E2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E246469616C6F67';
wwv_flow_api.g_varchar2_table(133) := '2E6469616C6F672827636C6F736527293B5C6E20202020202020202020207D202020202020202020202020202020205C6E20202020202020202020206576742E73746F7050726F7061676174696F6E28293B5C6E202020202020207D293B5C6E5C6E5C6E';
wwv_flow_api.g_varchar2_table(134) := '20207D2C5C6E202064697361626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B5C6E20';
wwv_flow_api.g_varchar2_table(135) := '202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075745C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B5C6E20202020202020207569772E5F656C656D656E74732E';
wwv_flow_api.g_varchar2_table(136) := '2468696464656E496E7075742E61747472282764697361626C6564272C2764697361626C656427293B5C6E5C6E20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E20202020202020202020202E617474722827646973';
wwv_flow_api.g_varchar2_table(137) := '61626C6564272C2764697361626C656427295C6E20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B5C6E20202020207D5C6E5C6E20202020207569772E5F76616C7565732E64';
wwv_flow_api.g_varchar2_table(138) := '697361626C6564203D20747275653B5C6E20207D2C5C6E2020656E61626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C6564';
wwv_flow_api.g_varchar2_table(139) := '203D3D3D207472756529207B5C6E202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E72656D6F766541747472282764697361626C656427293B5C6E202020202020207569772E5F656C656D656E74732E2468696464';
wwv_flow_api.g_varchar2_table(140) := '656E496E7075742E72656D6F766541747472282764697361626C656427293B5C6E202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202020202E72656D6F766541747472282764697361626C656427295C';
wwv_flow_api.g_varchar2_table(141) := '6E202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202020207569772E5F76616C7565732E64697361626C6564203D2066616C73653B';
wwv_flow_api.g_varchar2_table(142) := '5C6E20202020207D5C6E20207D5C6E7D293B225D2C2266696C65223A226A746C5F6974656D2E6A73227D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465096905983501091)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/js/jtl_item.js.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076322E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052696D';
wwv_flow_api.g_varchar2_table(2) := '626C617320C2A920323031370A2A2F0A242E7769646765742822746B2E6A746C5F6974656D222C7B6F7074696F6E733A7B6C616E673A22656E222C6C616E675F636F6465733A5B22656E222C226672222C226573225D2C6D657373616765733A6E756C6C';
wwv_flow_api.g_varchar2_table(3) := '2C6669656C6453697A653A33302C6669656C64526F77733A352C6669656C644D61784C656E6774683A38302C6469616C6F675469746C653A6E756C6C7D2C5F6372656174655072697661746553746F726167653A66756E6374696F6E28297B7661722065';
wwv_flow_api.g_varchar2_table(4) := '3D746869733B652E5F76616C7565733D7B617065784974656D49643A22222C636F6E74726F6C7349643A22222C6669656C6453697A653A33302C6669656C644D61784C656E6774683A38302C646174614A534F4E3A7B7D2C637572725F6C616E675F696E';
wwv_flow_api.g_varchar2_table(5) := '6465783A302C6C616E6775616765733A7B7D2C7461674D61703A7B7D2C6D657373616765733A242E70617273654A534F4E28652E6F7074696F6E732E6D65737361676573292C746F74616C4C616E6775616765733A302C64697361626C65643A21312C66';
wwv_flow_api.g_varchar2_table(6) := '6F6375734F6E436C6F73653A22425554544F4E222C6E65775265636F72643A21312C7369676E616C4368616E67653A21317D2C652E5F656C656D656E74733D7B2477696E646F773A7B7D2C24646F63756D656E743A7B7D2C24626F64793A7B7D2C246869';
wwv_flow_api.g_varchar2_table(7) := '6464656E496E7075743A7B7D2C24646973706C6179496E7075743A7B7D2C246669656C647365743A7B7D2C246D6C73427574746F6E3A7B7D2C246469616C6F673A7B7D2C246469616C6F67436F6E74656E743A7B7D2C2473617665427574746F6E3A7B7D';
wwv_flow_api.g_varchar2_table(8) := '2C2463616E63656C427574746F6E3A7B7D2C24627574746F6E436F6E7461696E65723A7B7D7D7D2C5F6372656174653A66756E6374696F6E28297B76617220653D746869733B652E5F6372656174655072697661746553746F7261676528292C652E5F76';
wwv_flow_api.g_varchar2_table(9) := '616C7565732E617065784974656D49643D2428652E656C656D656E74292E617474722822696422292C652E5F76616C7565732E636F6E74726F6C7349643D652E5F76616C7565732E617065784974656D49642B225F6669656C64736574222C652E5F696E';
wwv_flow_api.g_varchar2_table(10) := '6974456C656D656E747328292C652E5F696E697442617365456C656D656E747328292C652E5F76616C7565732E6C616E6775616765733D4A534F4E2E706172736528652E6F7074696F6E732E6C616E675F636F646573292C652E5F76616C7565732E746F';
wwv_flow_api.g_varchar2_table(11) := '74616C4C616E6775616765733D652E5F76616C7565732E6C616E6775616765732E6C656E6774682C652E5F696E6974446174614A534F4E28292C652E5F696E69744C616E67756167654D617028292C652E5F76616C7565732E637572725F6C616E675F69';
wwv_flow_api.g_varchar2_table(12) := '6E6465783D66756E6374696F6E28652C74297B766172206E3D6E756C6C2C613D2D313B666F72286E3D303B652E6C656E6774683E6E26262D313D3D613B6E2B3D3129655B6E5D2E6C3D3D3D74262628613D6E293B72657475726E20617D28652E5F76616C';
wwv_flow_api.g_varchar2_table(13) := '7565732E646174614A534F4E2C652E6F7074696F6E732E6C616E67292C652E5F656C656D656E74732E24646973706C6179496E7075742E62696E6428226368616E6765222C7B7569773A657D2C652E5F73796E6348696464656E4669656C64292C652E5F';
wwv_flow_api.g_varchar2_table(14) := '656C656D656E74732E24646F63756D656E742E62696E642822617065786265666F7265706167657375626D6974222C7B7569773A657D2C652E5F73796E6348696464656E4669656C64292C652E5F656C656D656E74732E246D6C73427574746F6E2E6269';
wwv_flow_api.g_varchar2_table(15) := '6E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C617065782E64656275672E6D65737361676528342C225265676973746572696E67207769746820617065782E7769646765742E696E6974506167654974';
wwv_flow_api.g_varchar2_table(16) := '656D3A20222B652E5F656C656D656E74732E24646973706C6179496E7075742E61747472282269642229292C617065782E7769646765742E696E6974506167654974656D28652E5F656C656D656E74732E2468696464656E496E7075742E617474722822';
wwv_flow_api.g_varchar2_table(17) := '696422292C7B73657456616C75653A66756E6374696F6E28742C6E297B652E5F656C656D656E74732E24646973706C6179496E7075742E76616C286E292C652E5F73796E6348696464656E4669656C6428297D2C67657456616C75653A66756E6374696F';
wwv_flow_api.g_varchar2_table(18) := '6E28297B72657475726E20652E5F656C656D656E74732E2468696464656E496E7075742E76616C28297D2C736574466F6375733A66756E6374696F6E28297B652E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328297D2C656E';
wwv_flow_api.g_varchar2_table(19) := '61626C653A66756E6374696F6E28297B652E656E61626C6528297D2C64697361626C653A66756E6374696F6E28297B652E64697361626C6528297D7D297D2C5F696E6974456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B65';
wwv_flow_api.g_varchar2_table(20) := '2E5F656C656D656E74732E2477696E646F773D242877696E646F77292C652E5F656C656D656E74732E24646F63756D656E743D2428646F63756D656E74292C652E5F656C656D656E74732E24626F64793D2428646F63756D656E742E626F6479292C652E';
wwv_flow_api.g_varchar2_table(21) := '5F656C656D656E74732E246469616C6F673D2428226469762E6A746C6974656D2D6469616C6F6722297D2C5F696E69744469616C6F67456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E246469';
wwv_flow_api.g_varchar2_table(22) := '616C6F673D2428226469762E6A746C6974656D2D6469616C6F6722292C652E5F656C656D656E74732E246469616C6F67436F6E74656E743D2428226469762E6A746C6974656D2D636F6E74656E7422292C652E5F656C656D656E74732E24736176654275';
wwv_flow_api.g_varchar2_table(23) := '74746F6E3D242822627574746F6E2E6A746C6974656D2D736176652D627574746F6E22292C652E5F656C656D656E74732E2463616E63656C427574746F6E3D242822627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E22297D2C5F69';
wwv_flow_api.g_varchar2_table(24) := '6E697442617365456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E2468696464656E496E7075743D652E656C656D656E742C652E5F656C656D656E74732E24646973706C6179496E7075743D24';
wwv_flow_api.g_varchar2_table(25) := '282223222B652E5F76616C7565732E617065784974656D49642B225F444953504C415922292C652E5F76616C7565732E6669656C6453697A653D2254455854223D3D3D652E6F7074696F6E732E6974656D547970653F652E5F656C656D656E74732E2464';
wwv_flow_api.g_varchar2_table(26) := '6973706C6179496E7075742E61747472282273697A6522293A652E5F656C656D656E74732E24646973706C6179496E7075742E617474722822636F6C7322292C225445585441524541223D3D3D652E6F7074696F6E732E6974656D54797065262628652E';
wwv_flow_api.g_varchar2_table(27) := '5F76616C7565732E6669656C64526F77733D652E5F656C656D656E74732E24646973706C6179496E7075742E617474722822726F77732229292C652E5F76616C7565732E6669656C644D61784C656E6774683D652E5F656C656D656E74732E2464697370';
wwv_flow_api.g_varchar2_table(28) := '6C6179496E7075742E6174747228226D61786C656E67746822292C652E5F656C656D656E74732E246669656C647365743D24282223222B652E5F76616C7565732E636F6E74726F6C734964292C652E5F656C656D656E74732E246D6C73427574746F6E3D';
wwv_flow_api.g_varchar2_table(29) := '652E5F656C656D656E74732E246669656C647365742E66696E642822627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E22297D2C5F696E6974446174614A534F4E3A66756E6374696F6E28297B76617220653D746869732C743D5B5D2C6E3D';
wwv_flow_api.g_varchar2_table(30) := '652E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B6E3F28652E5F76616C7565732E646174614A534F4E3D4A534F4E2E7061727365286E292C652E5F76616C7565732E6E65775265636F72643D2131293A28652E5F76616C7565';
wwv_flow_api.g_varchar2_table(31) := '732E6C616E6775616765732E666F72456163682866756E6374696F6E2865297B742E70757368287B6C3A652C746C3A22227D297D292C652E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287429';
wwv_flow_api.g_varchar2_table(32) := '292C652E5F76616C7565732E646174614A534F4E3D742C652E5F76616C7565732E6E65775265636F72643D2130297D2C5F73796E6348696464656E4669656C643A66756E6374696F6E2865297B76617220742C6E3B6966286E3D28743D766F6964203021';
wwv_flow_api.g_varchar2_table(33) := '3D3D653F652E646174612E7569773A74686973292E5F76616C7565732E637572725F6C616E675F696E6465782C742E5F76616C7565732E6E65775265636F726429666F722876617220613D742E5F76616C7565732E746F74616C4C616E6775616765732D';
wwv_flow_api.g_varchar2_table(34) := '313B613E3D303B612D2D29742E5F76616C7565732E646174614A534F4E5B615D2E746C3D742E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B656C736520742E5F76616C7565732E646174614A534F4E5B6E5D2E746C3D742E';
wwv_flow_api.g_varchar2_table(35) := '5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B742E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E6769667928742E5F76616C7565732E646174614A534F4E29292C742E5F696E';
wwv_flow_api.g_varchar2_table(36) := '69744C616E67756167654D617028297D2C5F696E69744469616C6F67427574746F6E733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E2463616E63656C427574746F6E2E62696E642822636C69636B222C7B7569';
wwv_flow_api.g_varchar2_table(37) := '773A657D2C652E5F68616E646C6543616E63656C427574746F6E436C69636B292C652E5F656C656D656E74732E2473617665427574746F6E2E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C6553617665427574746F6E436C69';
wwv_flow_api.g_varchar2_table(38) := '636B297D2C5F68616E646C6543616E63656C427574746F6E436C69636B3A66756E6374696F6E2865297B652E646174612E7569772E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F68616E646C655361766542';
wwv_flow_api.g_varchar2_table(39) := '7574746F6E436C69636B3A66756E6374696F6E2865297B76617220742C6E3D652E646174612E7569773B6E2E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428222E6A746C6974656D2D76616C756522292E656163682866756E';
wwv_flow_api.g_varchar2_table(40) := '6374696F6E28652C61297B617065782E64656275672E6D65737361676528342C652B2228222B612E646174617365742E6C616E672B22293A222B612E76616C7565292C6E2E5F76616C7565732E646174614A534F4E5B655D2E6C3D612E64617461736574';
wwv_flow_api.g_varchar2_table(41) := '2E6C616E672C6E2E5F76616C7565732E646174614A534F4E5B655D2E746C3D612E76616C75652C6E2E5F76616C7565732E637572725F6C616E675F696E6465783D3D65262628743D612E76616C7565297D292C6E2E5F696E69744C616E67756167654D61';
wwv_flow_api.g_varchar2_table(42) := '7028292C6E2E5F656C656D656E74732E24646973706C6179496E7075742E76616C2874292C6E2E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679286E2E5F76616C7565732E646174614A534F4E29';
wwv_flow_api.g_varchar2_table(43) := '292C6E2E5F76616C7565732E6E65775265636F72643D21312C6E2E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F7369676E616C4368616E67653A66756E6374696F6E28297B76617220653D746869732E5F65';
wwv_flow_api.g_varchar2_table(44) := '6C656D656E74732E2468696464656E496E7075745B305D2C743D746869732E5F656C656D656E74732E24646973706C6179496E7075745B305D3B617065782E6A51756572792865292E7472696767657228226368616E676522292C617065782E6A517565';
wwv_flow_api.g_varchar2_table(45) := '72792874292E7472696767657228226368616E676522297D2C5F68616E646C654F70656E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E5F73796E6348696464656E4669656C642865292C742E5F73686F77';
wwv_flow_api.g_varchar2_table(46) := '4469616C6F6728297D2C5F696E69744C616E67756167654D61703A66756E6374696F6E28297B76617220652C743D746869732C6E3D6E756C6C3B666F7228653D742E5F76616C7565732E646174614A534F4E2C742E5F76616C7565732E7461674D61703D';
wwv_flow_api.g_varchar2_table(47) := '7B7D2C6E3D303B652E6C656E6774683E6E3B6E2B3D3129742E5F76616C7565732E7461674D61705B655B6E5D2E6C5D3D655B6E5D2E746C7D2C5F6861735461673A66756E6374696F6E2865297B72657475726E20746869732E5F76616C7565732E746167';
wwv_flow_api.g_varchar2_table(48) := '4D61705B655D7D2C5F73686F774469616C6F673A66756E6374696F6E28297B76617220652C742C6E3D746869732C613D6E2E5F76616C7565732E637572725F6C616E675F696E6465783B653D273C7461626C6520636C6173733D22742D5265706F72742D';
wwv_flow_api.g_varchar2_table(49) := '7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E203C74723E5C6E20203C746820636C6173733D22742D5265706F72742D636F6C48656164223E272B6E2E5F76616C7565732E6D657373616765';
wwv_flow_api.g_varchar2_table(50) := '732E6C616E67756167654C6162656C2B273C2F74683E20203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E272B6E2E5F76616C7565732E6D657373616765732E6C616E677561676556616C75652B223C2F74683E20';
wwv_flow_api.g_varchar2_table(51) := '3C2F74723E5C6E203C74723E5C6E222C242E65616368286E2E5F76616C7565732E6C616E6775616765732C66756E6374696F6E28742C6C297B652B3D27203C74723E5C6E20203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F72';
wwv_flow_api.g_varchar2_table(52) := '6D2D696E707574436F6E7461696E657220752D7443272B28613D3D743F222073656C6563746564223A2222292B27223E272B617065782E7574696C2E65736361706548544D4C41747472286C292B273C2F74643E20203C746420636C6173733D22742D52';
wwv_flow_api.g_varchar2_table(53) := '65706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C272B28613D3D743F222073656C6563746564223A2222292B27223E272C2254455854223D3D3D6E2E6F7074696F6E732E6974656D547970653F652B3D272020';
wwv_flow_api.g_varchar2_table(54) := '20203C696E70757420747970653D22746578742220636C6173733D22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D22272B6C2B27222076616C75653D22272B61706578';
wwv_flow_api.g_varchar2_table(55) := '2E7574696C2E65736361706548544D4C41747472286E2E5F686173546167286C29292B27222073697A653D22272B6E2E5F76616C7565732E6669656C6453697A652B2722206D61786C656E6774683D22272B6E2E5F76616C7565732E6669656C644D6178';
wwv_flow_api.g_varchar2_table(56) := '4C656E6774682B27223E3C2F74643E273A652B3D27202020203C746578746172656120636C6173733D22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D22272B6C2B';
wwv_flow_api.g_varchar2_table(57) := '272220636F6C733D22272B6E2E5F76616C7565732E6669656C6453697A652B272220726F77733D22272B6E2E5F76616C7565732E6669656C64526F77732B2722206D61786C656E6774683D22272B6E2E5F76616C7565732E6669656C644D61784C656E67';
wwv_flow_api.g_varchar2_table(58) := '74682B27223E272B617065782E7574696C2E65736361706548544D4C41747472286E2E5F686173546167286C29292B223C2F74657874617265613E222C652B3D22203C2F74723E5C6E227D292C652B3D223C2F7461626C653E5C6E222C743D273C646976';
wwv_flow_api.g_varchar2_table(59) := '20636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E20203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E74';
wwv_flow_api.g_varchar2_table(60) := '61696E6572223E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B6E';
wwv_flow_api.g_varchar2_table(61) := '2E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E2B273C2F7370616E3E20202020203C2F627574746F6E3E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D427574';
wwv_flow_api.g_varchar2_table(62) := '746F6E20742D427574746F6E2D2D686F74223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B6E2E5F76616C7565732E6D657373616765732E6170706C794368616E6765732B273C2F7370616E3E202020';
wwv_flow_api.g_varchar2_table(63) := '202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D226A74';
wwv_flow_api.g_varchar2_table(64) := '6C6974656D2D636F6E74656E74223E5C6E272B652B2220203C2F6469763E5C6E3C2F6469763E3C2F6469763E5C6E222C6E2E5F656C656D656E74732E24626F64792E617070656E642874292C6E2E5F696E6974456C656D656E747328292C6E2E5F656C65';
wwv_flow_api.g_varchar2_table(65) := '6D656E74732E246469616C6F672E6469616C6F67287B636C6F73654F6E4573636170653A21302C7469746C653A6E2E6F7074696F6E732E6469616C6F675469746C652C6175746F526573697A653A21302C6D696E57696474683A3430302C6D696E486569';
wwv_flow_api.g_varchar2_table(66) := '6768743A3235302C77696474683A226175746F222C6865696768743A226175746F222C6D6F64616C3A21302C706F736974696F6E3A7B6D793A226C656674222C61743A226C6566742063656E746572222C6F663A6E2E5F656C656D656E74732E24646973';
wwv_flow_api.g_varchar2_table(67) := '706C6179496E7075745B305D7D2C6F70656E3A66756E6374696F6E28297B6E2E5F696E69744469616C6F67456C656D656E747328292C6E2E5F696E69744469616C6F67427574746F6E7328292C6E2E5F656C656D656E74732E246469616C6F67436F6E74';
wwv_flow_api.g_varchar2_table(68) := '656E742E66696E642822696E70757422292E666972737428292E666F63757328297D2C636C6F73653A66756E6374696F6E28297B242874686973292E6469616C6F67282264657374726F7922292C6E2E5F656C656D656E74732E246469616C6F672E7265';
wwv_flow_api.g_varchar2_table(69) := '6D6F766528292C6E2E5F656C656D656E74732E24646F63756D656E742E66696E6428226469762E6A746C6974656D2D6469616C6F6722292E72656D6F766528292C22425554544F4E223D3D3D6E2E5F76616C7565732E666F6375734F6E436C6F73653F6E';
wwv_flow_api.g_varchar2_table(70) := '2E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293A22494E505554223D3D3D6E2E5F76616C7565732E666F6375734F6E436C6F736526266E2E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328292C6E2E';
wwv_flow_api.g_varchar2_table(71) := '5F76616C7565732E666F6375734F6E436C6F73653D22425554544F4E227D7D292E6F6E28226B6579646F776E222C66756E6374696F6E2865297B652E6B6579436F64653D3D3D242E75692E6B6579436F64652E45534341504526266E2E5F656C656D656E';
wwv_flow_api.g_varchar2_table(72) := '74732E246469616C6F672E6469616C6F672822636C6F736522292C652E73746F7050726F7061676174696F6E28297D297D2C64697361626C653A66756E6374696F6E28297B76617220653D746869733B21313D3D3D652E5F76616C7565732E6469736162';
wwv_flow_api.g_varchar2_table(73) := '6C6564262628652E5F656C656D656E74732E24646973706C6179496E7075742E61747472282264697361626C6564222C2264697361626C656422292C652E5F656C656D656E74732E2468696464656E496E7075742E61747472282264697361626C656422';
wwv_flow_api.g_varchar2_table(74) := '2C2264697361626C656422292C652E5F656C656D656E74732E246D6C73427574746F6E2E61747472282264697361626C6564222C2264697361626C656422292E756E62696E642822636C69636B222C652E5F68616E646C654F70656E436C69636B29292C';
wwv_flow_api.g_varchar2_table(75) := '652E5F76616C7565732E64697361626C65643D21307D2C656E61626C653A66756E6374696F6E28297B76617220653D746869733B21303D3D3D652E5F76616C7565732E64697361626C6564262628652E5F656C656D656E74732E24646973706C6179496E';
wwv_flow_api.g_varchar2_table(76) := '7075742E72656D6F766541747472282264697361626C656422292C652E5F656C656D656E74732E2468696464656E496E7075742E72656D6F766541747472282264697361626C656422292C652E5F656C656D656E74732E246D6C73427574746F6E2E7265';
wwv_flow_api.g_varchar2_table(77) := '6D6F766541747472282264697361626C656422292E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C652E5F76616C7565732E64697361626C65643D2131297D7D293B0A2F2F2320736F757263654D';
wwv_flow_api.g_varchar2_table(78) := '617070696E6755524C3D6A746C5F6974656D2E6D696E2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465097285894501116)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/js/jtl_item.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E6A73225D2C226E616D6573223A5B2224222C22776964676574222C226F7074696F6E73222C226C616E67222C226C616E675F636F646573222C226D65737361676573';
wwv_flow_api.g_varchar2_table(2) := '222C226669656C6453697A65222C226669656C64526F7773222C226669656C644D61784C656E677468222C226469616C6F675469746C65222C225F6372656174655072697661746553746F72616765222C22756977222C2274686973222C225F76616C75';
wwv_flow_api.g_varchar2_table(3) := '6573222C22617065784974656D4964222C22636F6E74726F6C734964222C22646174614A534F4E222C22637572725F6C616E675F696E646578222C226C616E677561676573222C227461674D6170222C2270617273654A534F4E222C22746F74616C4C61';
wwv_flow_api.g_varchar2_table(4) := '6E677561676573222C2264697361626C6564222C22666F6375734F6E436C6F7365222C226E65775265636F7264222C227369676E616C4368616E6765222C225F656C656D656E7473222C222477696E646F77222C2224646F63756D656E74222C2224626F';
wwv_flow_api.g_varchar2_table(5) := '6479222C222468696464656E496E707574222C2224646973706C6179496E707574222C22246669656C64736574222C22246D6C73427574746F6E222C22246469616C6F67222C22246469616C6F67436F6E74656E74222C222473617665427574746F6E22';
wwv_flow_api.g_varchar2_table(6) := '2C222463616E63656C427574746F6E222C2224627574746F6E436F6E7461696E6572222C225F637265617465222C22656C656D656E74222C2261747472222C225F696E6974456C656D656E7473222C225F696E697442617365456C656D656E7473222C22';
wwv_flow_api.g_varchar2_table(7) := '4A534F4E222C227061727365222C226C656E677468222C225F696E6974446174614A534F4E222C225F696E69744C616E67756167654D6170222C226A222C226C222C2269222C22696478222C226C616E67756167655F696E646578222C2262696E64222C';
wwv_flow_api.g_varchar2_table(8) := '225F73796E6348696464656E4669656C64222C225F68616E646C654F70656E436C69636B222C2261706578222C226465627567222C226D657373616765222C22696E6974506167654974656D222C2273657456616C7565222C2276616C7565222C226469';
wwv_flow_api.g_varchar2_table(9) := '73706C617956616C7565222C2276616C222C2267657456616C7565222C22736574466F637573222C22666F637573222C22656E61626C65222C2264697361626C65222C2277696E646F77222C22646F63756D656E74222C22626F6479222C225F696E6974';
wwv_flow_api.g_varchar2_table(10) := '4469616C6F67456C656D656E7473222C226974656D54797065222C2266696E64222C226A736F6E44617461222C22696E7075745F64617461222C22666F7245616368222C2270757368222C22746C222C22737472696E67696679222C226576656E744F62';
wwv_flow_api.g_varchar2_table(11) := '6A222C226C616E675F696E646578222C2264617461222C225F696E69744469616C6F67427574746F6E73222C225F68616E646C6543616E63656C427574746F6E436C69636B222C225F68616E646C6553617665427574746F6E436C69636B222C22646961';
wwv_flow_api.g_varchar2_table(12) := '6C6F67222C22646973706C61795F76616C7565222C2265616368222C22656C222C2264617461736574222C225F7369676E616C4368616E6765222C2268696464656E456C6D74222C22646973706C6179456C6D74222C226A5175657279222C2274726967';
wwv_flow_api.g_varchar2_table(13) := '676572222C225F73686F774469616C6F67222C2274616773222C225F686173546167222C227461674E616D65222C226C616E675461626C65222C226469616C6F6748746D6C222C22637572725F6C616E67222C226C616E67756167654C6162656C222C22';
wwv_flow_api.g_varchar2_table(14) := '6C616E677561676556616C7565222C22696E646578222C227574696C222C2265736361706548544D4C41747472222C2263616E63656C427574746F6E222C226170706C794368616E676573222C22617070656E64222C22636C6F73654F6E457363617065';
wwv_flow_api.g_varchar2_table(15) := '222C227469746C65222C226175746F526573697A65222C226D696E5769647468222C226D696E486569676874222C227769647468222C22686569676874222C226D6F64616C222C22706F736974696F6E222C226D79222C226174222C226F66222C226F70';
wwv_flow_api.g_varchar2_table(16) := '656E222C226669727374222C22636C6F7365222C2272656D6F7665222C226F6E222C22657674222C226B6579436F6465222C227569222C22455343415045222C2273746F7050726F7061676174696F6E222C22756E62696E64222C2272656D6F76654174';
wwv_flow_api.g_varchar2_table(17) := '7472225D2C226D617070696E6773223A223B3B3B3B3B3B41414F41412C45414145432C4F4141512C65414752432C53414347432C4B41414D2C4B41434E432C594141612C4B41414B2C4B41414B2C4D41437642432C534141552C4B414356432C55414157';
wwv_flow_api.g_varchar2_table(18) := '2C47414358432C554141572C45414358432C65414167422C4741436842432C594141612C4D41456842432C7342414175422C57414370422C49414149432C4541414D432C4B414556442C45414149452C53414344432C574141592C4741435A432C574141';
wwv_flow_api.g_varchar2_table(19) := '592C4741435A542C554141572C47414358452C65414167422C4741436842512C59414341432C6742414169422C4541436A42432C61414341432C55414341642C534141554C2C454141456F422C55414155542C45414149542C51414151472C5541436C43';
wwv_flow_api.g_varchar2_table(20) := '67422C65414167422C4541436842432C554141552C45414356432C614141632C53414364432C574141572C45414358432C634141632C4741476A42642C45414149652C57414344432C57414341432C61414341432C53414341432C6742414341432C6942';
wwv_flow_api.g_varchar2_table(21) := '414341432C61414341432C63414341432C57414341432C6B42414341432C65414341432C6942414341432C734241474E432C514141532C574143502C4941414935422C4541414D432C4B41674256442C45414149442C774241434A432C45414149452C51';
wwv_flow_api.g_varchar2_table(22) := '414151432C57414161642C45414145572C4541414936422C53414153432C4B41414B2C4D4143374339422C45414149452C51414151452C574141614A2C45414149452C51414151432C574141612C5941436C44482C454141492B422C674241434A2F422C';
wwv_flow_api.g_varchar2_table(23) := '4541414967432C6F4241454A68432C45414149452C514141514B2C5541415930422C4B41414B432C4D41414D6C432C45414149542C51414151452C5941432F434F2C45414149452C51414151512C6541416942562C45414149452C514141514B2C554141';
wwv_flow_api.g_varchar2_table(24) := '5534422C4F41476E446E432C454141496F432C674241434A70432C4541414971432C6D4241454A72432C45414149452C51414151492C67424178425A2C534141794267432C45414147432C47414331422C49414149432C454141492C4B41434A432C4741';
wwv_flow_api.g_varchar2_table(25) := '414F2C454143582C4941414B442C454141492C45414147462C45414145482C4F4141534B2C494141612C47414152432C45414157442C4741414B2C4541437443462C45414145452C47414147442C4941414D412C49414362452C4541414D442C47414756';
wwv_flow_api.g_varchar2_table(26) := '2C4F41414F432C454167427142432C4341416531432C45414149452C51414151472C534141554C2C45414149542C51414151432C4D41492F45512C45414149652C554141554B2C6341435675422C4B41414B2C5541415733432C4941414B412C4741414D';
wwv_flow_api.g_varchar2_table(27) := '412C4541414934432C6B4241436E4335432C45414149652C55414155452C5541435630422C4B41414B2C77424141794233432C4941414B412C4741414D412C4541414934432C6B4241456A4435432C45414149652C554141554F2C5741435671422C4B41';
wwv_flow_api.g_varchar2_table(28) := '414B2C5341415533432C4941414B412C4741414D412C4541414936432C6B4241456C43432C4B41414B432C4D41414D432C514141512C454141452C38434141674468442C45414149652C554141554B2C63414163552C4B41414B2C4F4145744767422C4B';
wwv_flow_api.g_varchar2_table(29) := '41414B78442C4F41414F32442C614141616A442C45414149652C55414155492C61414161572C4B41414B2C4F414374446F422C534141552C53414153432C4541414F432C474143764270442C45414149652C554141554B2C6341416369432C4941414944';
wwv_flow_api.g_varchar2_table(30) := '2C474143684370442C4541414934432C6F42414550552C534141552C574143502C4F41414F74442C45414149652C55414155492C614141616B432C4F41457243452C534141552C5741435076442C45414149652C554141554B2C634141636F432C534151';
wwv_flow_api.g_varchar2_table(31) := '2F42432C4F4141512C5741434C7A442C4541414979442C55414550432C514141532C5741434E31442C4541414930442C63414B5A33422C634141652C5741435A2C494141492F422C4541414D432C4B414556442C45414149652C55414155432C51414155';
wwv_flow_api.g_varchar2_table(32) := '33422C4541414573452C514143314233442C45414149652C55414155452C5541415935422C4541414575452C554143354235442C45414149652C55414155472C4D41415137422C4541414575452C53414153432C4D41436A4337442C45414149652C5541';
wwv_flow_api.g_varchar2_table(33) := '4155512C514141556C432C454141452C75424147374279452C6F42414171422C5741436C422C4941414939442C4541414D432C4B414556442C45414149652C55414155512C514141556C432C454141452C734241433142572C45414149652C5541415553';
wwv_flow_api.g_varchar2_table(34) := '2C65414169426E432C454141452C754241436A43572C45414149652C55414155552C5941416370432C454141452C384241433942572C45414149652C55414155572C634141674272432C454141452C694341476E4332432C6B4241416D422C5741436842';
wwv_flow_api.g_varchar2_table(35) := '2C4941414968432C4541414D432C4B414556442C45414149652C55414155492C614141656E422C4541414936422C5141436A4337422C45414149652C554141554B2C63414167422F422C454141452C4941414D572C45414149452C51414151432C574141';
wwv_flow_api.g_varchar2_table(36) := '612C5941432F44482C45414149452C51414151502C55414171432C5341417A424B2C45414149542C5141415177452C53414171422F442C45414149652C554141554B2C63414163552C4B41414B2C5141415539422C45414149652C554141554B2C634141';
wwv_flow_api.g_varchar2_table(37) := '63552C4B41414B2C51414378472C6141417A4239422C45414149542C5141415177452C574143642F442C45414149452C514141514E2C55414159492C45414149652C554141554B2C63414163552C4B41414B2C534145334439422C45414149452C514141';
wwv_flow_api.g_varchar2_table(38) := '514C2C6541416942472C45414149652C554141554B2C63414163552C4B41414B2C614145394439422C45414149652C554141554D2C5541415968432C454141452C4941414D572C45414149452C51414151452C59414339434A2C45414149652C55414155';
wwv_flow_api.g_varchar2_table(39) := '4F2C5741435874422C45414149652C554141554D2C5541415532432C4B41414B2C384241456E4335422C634141652C5741435A2C4941414970432C4541414D432C4B41434E67452C4B414341432C454141616C452C45414149652C55414155492C614141';
wwv_flow_api.g_varchar2_table(40) := '616B432C4D41457843612C474143446C452C45414149452C51414151472C5341415734422C4B41414B432C4D41414D67432C4741436C436C452C45414149452C51414151572C574141592C4941517842622C45414149452C514141514B2C554141553444';
wwv_flow_api.g_varchar2_table(41) := '2C514141512C5341415335422C474143704330422C45414153472C4D41414D37422C4541414B412C4541414738422C4741414D2C4F4147684372452C45414149652C55414155492C614141616B432C4941414970422C4B41414B71432C554141554C2C49';
wwv_flow_api.g_varchar2_table(42) := '414339436A452C45414149452C51414151472C5341415734442C45414376426A452C45414149452C51414151572C574141592C49414939422B422C694241416B422C5341415332422C47414578422C4941414976452C4541454177452C4541614A2C4741';
wwv_flow_api.g_varchar2_table(43) := '4641412C4741504778452C4F41466F422C4941415A75452C45414546412C45414153452C4B41414B7A452C49414964432C4D414751432C51414151492C6742414572424E2C45414149452C51414151572C554145622C4941414B2C4941414932422C4541';
wwv_flow_api.g_varchar2_table(44) := '414978432C45414149452C51414151512C65414169422C4541414738422C4741414B2C45414147412C4941436E4478432C45414149452C51414151472C534141536D432C4741414736422C4741414B72452C45414149652C554141554B2C634141636943';
wwv_flow_api.g_varchar2_table(45) := '2C57414B334472442C45414149452C51414151472C534141536D452C47414159482C4741414B72452C45414149652C554141554B2C6341416369432C4D4147724572442C45414149652C55414155492C614141616B432C4941414970422C4B41414B7143';
wwv_flow_api.g_varchar2_table(46) := '2C5541415574452C45414149452C51414151472C57414531444C2C4541414971432C6F4241455071432C6D4241416F422C5741436A422C4941414931452C4541414D432C4B414556442C45414149652C55414155572C6341435669422C4B41414B2C5341';
wwv_flow_api.g_varchar2_table(47) := '415533432C4941414B412C4741414D412C4541414932452C304241456C4333452C45414149652C55414155552C594143566B422C4B41414B2C5341415533432C4941414B412C4741414D412C4541414934452C794241477243442C7942414130422C5341';
wwv_flow_api.g_varchar2_table(48) := '41534A2C4741437442412C45414153452C4B41414B7A452C4941437042652C55414155512C5141415173442C4F41414F2C5541456843442C7542414177422C534141534C2C47414339422C494143494F2C4541444139452C4541414D75452C4541415345';
wwv_flow_api.g_varchar2_table(49) := '2C4B41414B7A452C4941477842412C45414149652C55414155532C6541416577432C4B41414B2C6B4241416B42652C4B41414B2C5341415376432C4541414577432C4741436A456C432C4B41414B432C4D41414D432C514141512C45414145522C454141';
wwv_flow_api.g_varchar2_table(50) := '492C4941414D77432C45414147432C514141517A462C4B41414F2C4B41414F77462C4541414737422C4F414333446E442C45414149452C51414151472C534141536D432C47414147442C4541414979432C45414147432C514141517A462C4B4143764351';
wwv_flow_api.g_varchar2_table(51) := '2C45414149452C51414151472C534141536D432C4741414736422C4741414B572C4541414737422C4D414335426E442C45414149452C51414151492C694241416D426B432C494143684373432C4541416742452C4541414737422C5341497A426E442C45';
wwv_flow_api.g_varchar2_table(52) := '41414971432C6D4241474A72432C45414149652C554141554B2C6341416369432C4941414979422C474143684339452C45414149652C55414155492C614141616B432C4941414970422C4B41414B71432C5541415574452C45414149452C51414151472C';
wwv_flow_api.g_varchar2_table(53) := '57414531444C2C45414149452C51414151572C574141592C4541457842622C45414149652C55414155512C5141415173442C4F41414F2C55414568434B2C634141652C5741435A2C49414347432C4541444F6C462C4B414355632C55414155492C614141';
wwv_flow_api.g_varchar2_table(54) := '612C474143784369452C4541464F6E462C4B414557632C554141554B2C634141632C474147374330422C4B41414B75432C4F41414F462C47414159472C514141512C554143684378432C4B41414B75432C4F41414F442C47414161452C514141512C5741';
wwv_flow_api.g_varchar2_table(55) := '4570437A432C694241416B422C5341415330422C47414378422C4941414976452C4541414D75452C45414153452C4B41414B7A452C4941457842412C4541414934432C69424141694232422C474143724276452C4541414975462C654145506C442C6942';
wwv_flow_api.g_varchar2_table(56) := '41416B422C574143662C494145496D442C4541464178462C4541414D432C4B41434E75432C454141492C4B414F522C49414A4167442C4541414F78462C45414149452C51414151472C5341476E424C2C45414149452C514141514D2C5541435067432C45';
wwv_flow_api.g_varchar2_table(57) := '4141492C4541414767442C4541414B72442C4F4141534B2C45414147412C4741414B2C454143394278432C45414149452C514141514D2C4F41414F67462C4541414B68442C47414147442C4741414B69442C4541414B68442C4741414736422C4941492F';
wwv_flow_api.g_varchar2_table(58) := '436F422C514141532C53414153432C474145662C4F4144557A462C4B414343432C514141514D2C4F41414F6B462C4941453742482C594141612C574143562C49414349492C45414541432C4541484135462C4541414D432C4B41454E34462C4541415937';
wwv_flow_api.g_varchar2_table(59) := '462C45414149452C51414151492C67424147354271462C4541434D2C324741456F4333462C45414149452C51414151522C534141536F472C63414167422C34434143684339462C45414149452C51414151522C5341415371472C63414167422C75424149';
wwv_flow_api.g_varchar2_table(60) := '704631472C4541414530462C4B41414B2F452C45414149452C514141514B2C554141572C5341415579462C4541414F78472C47414337436D472C474143412C674541433244452C47414157472C4541414F2C594141592C4941414D2C4B41414F6C442C4B';
wwv_flow_api.g_varchar2_table(61) := '41414B6D442C4B41414B432C6541416531472C474141512C38444143354571472C47414157472C4541414F2C594141592C4941414D2C4B41436C452C5341417A4268472C45414149542C5141415177452C5341436434422C474143412C7146414175466E';
wwv_flow_api.g_varchar2_table(62) := '472C4541414F2C5941416373442C4B41414B6D442C4B41414B432C654141656C472C4541414979462C514141516A472C494141532C57414161512C45414149452C51414151502C554141592C674241416B424B2C45414149452C514141514C2C65414169';
wwv_flow_api.g_varchar2_table(63) := '422C554147394F38462C474143412C3845414167466E472C4541414F2C5741437445512C45414149452C51414151502C554141592C574141614B2C45414149452C514141514E2C554141592C674241437844492C45414149452C514141514C2C65414169';
wwv_flow_api.g_varchar2_table(64) := '422C4B4143784369442C4B41414B6D442C4B41414B432C654141656C472C4541414979462C514141516A472C494141532C63414733446D472C474143432C61414548412C474143412C61414543432C4541434B2C344D4147794335462C45414149452C51';
wwv_flow_api.g_varchar2_table(65) := '414151522C5341415379472C614141652C3848414970436E472C45414149452C51414151522C5341415330472C614141652C6B49414B3145542C454143482C324241474C33462C45414149652C55414155472C4D41414D6D462C4F41414F542C47414533';
wwv_flow_api.g_varchar2_table(66) := '4235462C454141492B422C674241474C2F422C45414149652C55414155512C5141415173442C5141436C4279422C654141652C45414366432C4D41416576472C45414149542C514141514F2C594143334230472C594141652C45414366432C534141652C';
wwv_flow_api.g_varchar2_table(67) := '49414366432C554141652C49414366432C4D4141652C4F414366432C4F4141652C4F414366432C4F4141652C45414366432C5541416942432C474141492C4F414151432C474141492C63414165432C474141496A482C45414149652C554141554B2C6341';
wwv_flow_api.g_varchar2_table(68) := '41632C494143684638462C4B41414D2C574143486C482C4541414938442C734241434A39442C4541414930452C714241434A31452C45414149652C55414155532C6541416577432C4B41414B2C534141536D442C5141415133442C534145744434442C4D';
wwv_flow_api.g_varchar2_table(69) := '41414F2C5741454A2F482C45414145592C4D41414D34452C4F41414F2C5741436637452C45414149652C55414155512C5141415138462C534143744272482C45414149652C55414155452C554141552B432C4B41414B2C73424141734271442C5341456C';
wwv_flow_api.g_varchar2_table(70) := '422C574141374272482C45414149452C51414151552C614143625A2C45414149652C554141554F2C574141576B432C514143592C554141374278442C45414149452C51414151552C63414370425A2C45414149652C554141554B2C634141636F432C5141';
wwv_flow_api.g_varchar2_table(71) := '472F4278442C45414149452C51414151552C614141652C5941472F4230472C474141472C554141572C53414153432C4741436842412C45414149432C554141596E492C454141456F492C47414147442C51414151452C514143374231482C45414149652C';
wwv_flow_api.g_varchar2_table(72) := '55414155512C5141415173442C4F41414F2C5341456A4330432C45414149492C7142414B626A452C514141532C5741434E2C4941414931442C4541414D432C4D41456D422C4941417A42442C45414149452C51414151532C57414362582C45414149652C';
wwv_flow_api.g_varchar2_table(73) := '554141554B2C63414356552C4B41414B2C574141572C594143704239422C45414149652C55414155492C61414161572C4B41414B2C574141572C594145334339422C45414149652C554141554F2C57414356512C4B41414B2C574141572C594143684238';
wwv_flow_api.g_varchar2_table(74) := '462C4F41414F2C5141415335482C4541414936432C6D424147334237432C45414149452C51414151532C554141572C474145314238432C4F4141512C5741434C2C494141497A442C4541414D432C4D41456D422C4941417A42442C45414149452C514141';
wwv_flow_api.g_varchar2_table(75) := '51532C57414364582C45414149652C554141554B2C6341416379472C574141572C594143764337482C45414149652C55414155492C6141416130472C574141572C594143744337482C45414149652C554141554F2C5741435675472C574141572C594143';
wwv_flow_api.g_varchar2_table(76) := '586C462C4B41414B2C5341415533432C4941414B412C4741414D412C4541414936432C6B4241456C4337432C45414149452C51414151532C55414157222C2266696C65223A226A746C5F6974656D2E6D696E2E6A73222C22736F7572636573436F6E7465';
wwv_flow_api.g_varchar2_table(77) := '6E74223A5B222F2A5C6E202A204A544C204974656D2076322E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F5C6E202A5C6E202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954295C6E202A';
wwv_flow_api.g_varchar2_table(78) := '204A6F7267652052696D626C617320C2A920323031375C6E2A2F5C6E5C6E242E77696467657428205C22746B2E6A746C5F6974656D5C222C207B5C6E205C6E20202F2F2044656661756C74206F7074696F6E732E5C6E20206F7074696F6E733A207B5C6E';
wwv_flow_api.g_varchar2_table(79) := '20202020206C616E673A205C22656E5C222C5C6E20202020206C616E675F636F6465733A205B5C22656E5C222C5C2266725C222C5C2265735C225D2C5C6E20202020206D657373616765733A206E756C6C2C5C6E20202020206669656C6453697A653A20';
wwv_flow_api.g_varchar2_table(80) := '33302C5C6E20202020206669656C64526F77733A20352C5C6E20202020206669656C644D61784C656E6774683A2038302C5C6E20202020206469616C6F675469746C653A206E756C6C5C6E20207D2C5C6E20205F6372656174655072697661746553746F';
wwv_flow_api.g_varchar2_table(81) := '726167653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F76616C756573203D207B5C6E2020202020202020617065784974656D49643A2027272C5C6E202020202020202063';
wwv_flow_api.g_varchar2_table(82) := '6F6E74726F6C7349643A2027272C5C6E20202020202020206669656C6453697A653A2033302C5C6E20202020202020206669656C644D61784C656E6774683A2038302C5C6E2020202020202020646174614A534F4E3A207B7D2C5C6E2020202020202020';
wwv_flow_api.g_varchar2_table(83) := '637572725F6C616E675F696E6465783A20302C5C6E20202020202020206C616E6775616765733A207B7D2C5C6E20202020202020207461674D61703A207B7D2C5C6E20202020202020206D657373616765733A20242E70617273654A534F4E287569772E';
wwv_flow_api.g_varchar2_table(84) := '6F7074696F6E732E6D65737361676573292C5C6E2020202020202020746F74616C4C616E6775616765733A20302C5C6E202020202020202064697361626C65643A2066616C73652C5C6E2020202020202020666F6375734F6E436C6F73653A2027425554';
wwv_flow_api.g_varchar2_table(85) := '544F4E272C202F2F425554544F4E206F7220494E5055542C5C6E20202020202020206E65775265636F72643A2066616C73652C5C6E20202020202020207369676E616C4368616E67653A2066616C73655C6E20202020207D3B5C6E5C6E20202020207569';
wwv_flow_api.g_varchar2_table(86) := '772E5F656C656D656E7473203D207B5C6E20202020202020202477696E646F773A207B7D2C5C6E202020202020202024646F63756D656E743A207B7D2C5C6E202020202020202024626F64793A207B7D2C5C6E20202020202020202468696464656E496E';
wwv_flow_api.g_varchar2_table(87) := '7075743A207B7D2C5C6E202020202020202024646973706C6179496E7075743A207B7D2C5C6E2020202020202020246669656C647365743A207B7D2C5C6E2020202020202020246D6C73427574746F6E3A207B7D2C5C6E2020202020202020246469616C';
wwv_flow_api.g_varchar2_table(88) := '6F673A207B7D2C5C6E2020202020202020246469616C6F67436F6E74656E743A207B7D2C5C6E20202020202020202473617665427574746F6E3A207B7D2C5C6E20202020202020202463616E63656C427574746F6E3A207B7D2C5C6E2020202020202020';
wwv_flow_api.g_varchar2_table(89) := '24627574746F6E436F6E7461696E65723A207B7D5C6E20202020207D3B5C6E20207D2C5C6E20205F6372656174653A2066756E6374696F6E2829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020202F2F204F7074696F6E7320';
wwv_flow_api.g_varchar2_table(90) := '61726520616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73295C6E5C6E202020202F2F2068656C7065722066756E6374696F6E20666F722066696E64696E67';
wwv_flow_api.g_varchar2_table(91) := '2074686520706F736974696F6E206F66206F75722063757272656E7420646973706C61796564206C616E67756167655C6E2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B5C6E2020202020207661722069203D';
wwv_flow_api.g_varchar2_table(92) := '206E756C6C2C5C6E20202020202020202020696478203D202D313B5C6E202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B5C6E2020202020202020696620286A5B69';
wwv_flow_api.g_varchar2_table(93) := '5D2E6C203D3D3D206C29207B5C6E20202020202020202020696478203D20693B5C6E20202020202020207D5C6E2020202020207D5C6E20202020202072657475726E206964783B5C6E202020207D5C6E5C6E202020207569772E5F637265617465507269';
wwv_flow_api.g_varchar2_table(94) := '7661746553746F7261676528293B5C6E202020207569772E5F76616C7565732E617065784974656D4964203D2024287569772E656C656D656E74292E617474722827696427293B5C6E202020207569772E5F76616C7565732E636F6E74726F6C73496420';
wwv_flow_api.g_varchar2_table(95) := '3D207569772E5F76616C7565732E617065784974656D4964202B20275F6669656C64736574273B5C6E202020207569772E5F696E6974456C656D656E747328293B5C6E202020207569772E5F696E697442617365456C656D656E747328293B5C6E5C6E20';
wwv_flow_api.g_varchar2_table(96) := '2020207569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B5C6E202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D20756977';
wwv_flow_api.g_varchar2_table(97) := '2E5F76616C7565732E6C616E6775616765732E6C656E6774683B5C6E5C6E202020202F2F2067657420746865206672657368206C697374206F66206C616E6775616765735C6E202020207569772E5F696E6974446174614A534F4E28293B5C6E20202020';
wwv_flow_api.g_varchar2_table(98) := '7569772E5F696E69744C616E67756167654D617028293B5C6E202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E675C6E202020207569772E5F76616C7565732E637572725F6C616E675F696E6465';
wwv_flow_api.g_varchar2_table(99) := '78203D206C616E67756167655F696E646578287569772E5F76616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B5C6E202020205C6E202020202F2F2053796E63206F75722068696464656E206669656C642077697468';
wwv_flow_api.g_varchar2_table(100) := '207468652061637475616C2076616C756520696E2074686520636F7272656374206C616E67756167652C206275745C6E202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69';
wwv_flow_api.g_varchar2_table(101) := '742074686520636F72726563742076616C7565205C6E202020207569772E5F656C656D656E74732E24646973706C6179496E7075745C6E202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E6348';
wwv_flow_api.g_varchar2_table(102) := '696464656E4669656C64293B5C6E202020207569772E5F656C656D656E74732E24646F63756D656E745C6E202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E';
wwv_flow_api.g_varchar2_table(103) := '6348696464656E4669656C64293B5C6E5C6E202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69';
wwv_flow_api.g_varchar2_table(104) := '636B293B5C6E5C6E20202020617065782E64656275672E6D65737361676528342C5C225265676973746572696E67207769746820617065782E7769646765742E696E6974506167654974656D3A205C22202B207569772E5F656C656D656E74732E246469';
wwv_flow_api.g_varchar2_table(105) := '73706C6179496E7075742E61747472282769642729293B5C6E5C6E20202020617065782E7769646765742E696E6974506167654974656D287569772E5F656C656D656E74732E2468696464656E496E7075742E617474722827696427292C207B5C6E2020';
wwv_flow_api.g_varchar2_table(106) := '202020202073657456616C75653A2066756E6374696F6E2876616C75652C20646973706C617956616C756529207B5C6E202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973706C617956616C';
wwv_flow_api.g_varchar2_table(107) := '7565293B5C6E202020202020202020207569772E5F73796E6348696464656E4669656C6428293B5C6E202020202020207D2C5C6E2020202020202067657456616C75653A2066756E6374696F6E2829207B5C6E2020202020202020202072657475726E20';
wwv_flow_api.g_varchar2_table(108) := '7569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B5C6E202020202020207D2C5C6E20202020202020736574466F6375733A2066756E6374696F6E2829207B5C6E202020202020202020207569772E5F656C656D656E7473';
wwv_flow_api.g_varchar2_table(109) := '2E24646973706C6179496E7075742E666F63757328293B5C6E202020202020207D2C5C6E202020202020202F2F2073686F773A2066756E6374696F6E2829207B5C6E202020202020202F2F202020207569772E73686F7728293B5C6E202020202020202F';
wwv_flow_api.g_varchar2_table(110) := '2F207D2C5C6E202020202020202F2F20686964653A2066756E6374696F6E2829207B5C6E202020202020202F2F202020207569772E6869646528293B5C6E202020202020202F2F207D2C5C6E20202020202020656E61626C653A2066756E6374696F6E28';
wwv_flow_api.g_varchar2_table(111) := '29207B5C6E202020202020202020207569772E656E61626C6528293B5C6E202020202020207D2C5C6E2020202020202064697361626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E64697361626C6528293B5C6E202020';
wwv_flow_api.g_varchar2_table(112) := '202020207D5C6E202020207D293B5C6E5C6E20207D2C5C6E20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2477';
wwv_flow_api.g_varchar2_table(113) := '696E646F77203D20242877696E646F77293B5C6E20202020207569772E5F656C656D656E74732E24646F63756D656E74203D202428646F63756D656E74293B5C6E20202020207569772E5F656C656D656E74732E24626F6479203D202428646F63756D65';
wwv_flow_api.g_varchar2_table(114) := '6E742E626F6479293B5C6E20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B5C6E5C6E20207D2C5C6E20205F696E69744469616C6F67456C656D656E74733A2066756E';
wwv_flow_api.g_varchar2_table(115) := '6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B5C6E20202020207569772E5F';
wwv_flow_api.g_varchar2_table(116) := '656C656D656E74732E246469616C6F67436F6E74656E74203D202428276469762E6A746C6974656D2D636F6E74656E7427293B5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D20242827627574746F6E2E6A746C69';
wwv_flow_api.g_varchar2_table(117) := '74656D2D736176652D627574746F6E27293B5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D20242827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B5C6E5C6E20207D2C5C6E20';
wwv_flow_api.g_varchar2_table(118) := '205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2468696464656E496E707574203D207569772E656C656D';
wwv_flow_api.g_varchar2_table(119) := '656E743B5C6E20202020207569772E5F656C656D656E74732E24646973706C6179496E707574203D202428272327202B207569772E5F76616C7565732E617065784974656D4964202B20275F444953504C415927293B20202020205C6E20202020207569';
wwv_flow_api.g_varchar2_table(120) := '772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C223F207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C2273697A655C222920';
wwv_flow_api.g_varchar2_table(121) := '3A207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C22636F6C735C22293B5C6E2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C2254455854415245415C2229207B5C6E2020';
wwv_flow_api.g_varchar2_table(122) := '20202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C22726F77735C22293B5C6E20202020207D5C6E20202020207569772E5F76616C7565732E66';
wwv_flow_api.g_varchar2_table(123) := '69656C644D61784C656E677468203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472285C226D61786C656E6774685C22293B5C6E5C6E20202020207569772E5F656C656D656E74732E246669656C64736574203D2024';
wwv_flow_api.g_varchar2_table(124) := '28272327202B207569772E5F76616C7565732E636F6E74726F6C734964293B5C6E20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D5C6E20202020202020207569772E5F656C656D656E74732E246669656C647365742E6669';
wwv_flow_api.g_varchar2_table(125) := '6E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B5C6E20207D2C5C6E20205F696E6974446174614A534F4E3A2066756E6374696F6E28297B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020';
wwv_flow_api.g_varchar2_table(126) := '206A736F6E44617461203D205B5D2C5C6E202020202020202020696E7075745F64617461203D207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B5C6E5C6E202020202069662028696E7075745F6461746129207B5C6E';
wwv_flow_api.g_varchar2_table(127) := '20202020202020207569772E5F76616C7565732E646174614A534F4E203D204A534F4E2E706172736528696E7075745F64617461293B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E20202020';
wwv_flow_api.g_varchar2_table(128) := '207D5C6E2020202020656C7365207B5C6E20202020202020202F2F20546865207265636F726420697320656D70747920736F207765206275696C642061205C6E20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275';
wwv_flow_api.g_varchar2_table(129) := '637475726520746F20736565642069743A5C6E20202020202020202F2F20205B207B5C226C5C223A205C2275735C222C205C22746C5C223A205C2250726F6A65637420416E616C797369735C227D5C6E20202020202020202F2F20202C207B5C226C5C22';
wwv_flow_api.g_varchar2_table(130) := '3A205C2266725C222C205C22746C5C223A205C22416E616C7973652064652070726F6A65745C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2265735C222C205C22746C5C223A205C22416E616C697369732064652070726F6A6563';
wwv_flow_api.g_varchar2_table(131) := '746F5C227D5D5C6E20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E286C29207B5C6E20202020202020202020206A736F6E446174612E70757368287B5C226C5C223A206C2C205C2274';
wwv_flow_api.g_varchar2_table(132) := '6C5C223A205C225C227D293B5C6E20202020202020207D293B5C6E20202020202020202F2F20496E6974207468652068696464656E206974656D5C6E20202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A';
wwv_flow_api.g_varchar2_table(133) := '534F4E2E737472696E67696679286A736F6E4461746129293B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E203D206A736F6E446174613B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D';
wwv_flow_api.g_varchar2_table(134) := '20747275653B5C6E20202020207D5C6E5C6E20207D2C5C6E20205F73796E6348696464656E4669656C643A2066756E6374696F6E286576656E744F626A29207B5C6E20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569';
wwv_flow_api.g_varchar2_table(135) := '772C5C6E2020202020766172207569772C5C6E2020202020202020206C616E674A534F4E203D207B7D2C5C6E2020202020202020206C616E675F696E6465783B5C6E5C6E202020202069662028747970656F66206576656E744F626A20213D205C22756E';
wwv_flow_api.g_varchar2_table(136) := '646566696E65645C2229207B5C6E20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E745C6E2020202020202020756977203D206576656E744F626A2E646174612E7569773B5C6E20202020207D5C6E2020202020';
wwv_flow_api.g_varchar2_table(137) := '656C7365207B5C6E20202020202020202F2F206469726563742063616C6C5C6E2020202020202020756977203D20746869733B5C6E20202020207D5C6E5C6E20202020206C616E675F696E646578203D207569772E5F76616C7565732E637572725F6C61';
wwv_flow_api.g_varchar2_table(138) := '6E675F696E6465783B5C6E5C6E2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B5C6E20202020202020202F2F207361766520746865206E6577207465787420696E746F2074686520414C4C20746865207265636F7264';
wwv_flow_api.g_varchar2_table(139) := '7320696E20746865204A534F4E207374727563747572655C6E2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B5C6E202020202020';
wwv_flow_api.g_varchar2_table(140) := '202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B5C6E20202020202020207D5C6E20202020207D5C6E2020202020656C7365207B5C';
wwv_flow_api.g_varchar2_table(141) := '6E20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E207374727563747572655C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D';
wwv_flow_api.g_varchar2_table(142) := '207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B5C6E20202020207D5C6E20202020202F2F20706C616365207468652066756C6C204A534F4E206261636B20696E746F207468652068696464656E206974656D5C6E';
wwv_flow_api.g_varchar2_table(143) := '20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B5C6E20202020202F2F204B65657020746865206D617020667265';
wwv_flow_api.g_varchar2_table(144) := '736820286F6E6C79206E656564656420666F7220746865206469616C6F67295C6E20202020207569772E5F696E69744C616E67756167654D617028293B5C6E20207D2C5C6E20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E28';
wwv_flow_api.g_varchar2_table(145) := '29207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569';
wwv_flow_api.g_varchar2_table(146) := '772E5F68616E646C6543616E63656C427574746F6E436C69636B293B5C6E5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C2075';
wwv_flow_api.g_varchar2_table(147) := '69772E5F68616E646C6553617665427574746F6E436C69636B293B5C6E5C6E20207D2C5C6E20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E20202020207661722075697720';
wwv_flow_api.g_varchar2_table(148) := '3D206576656E744F626A2E646174612E7569773B5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F76652074';
wwv_flow_api.g_varchar2_table(149) := '6865206469616C6F675C6E20207D2C5C6E20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569772C5C6E';
wwv_flow_api.g_varchar2_table(150) := '202020202020202020646973706C61795F76616C75653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E28692C';
wwv_flow_api.g_varchar2_table(151) := '656C297B5C6E2020202020202020617065782E64656275672E6D65737361676528342C69202B205C22285C22202B20656C2E646174617365742E6C616E67202B205C22293A5C22202B20656C2E76616C7565293B5C6E20202020202020207569772E5F76';
wwv_flow_api.g_varchar2_table(152) := '616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E6C616E673B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C75653B5C6E202020202020202069662028';
wwv_flow_api.g_varchar2_table(153) := '7569772E5F76616C7565732E637572725F6C616E675F696E646578203D3D206929207B5C6E2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B5C6E20202020202020207D5C6E20202020207D293B5C6E5C6E2020';
wwv_flow_api.g_varchar2_table(154) := '2020207569772E5F696E69744C616E67756167654D617028293B5C6E5C6E20202020202F2F2073796E6320746865206974656D7320616761696E5C6E20202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28646973';
wwv_flow_api.g_varchar2_table(155) := '706C61795F76616C7565293B5C6E20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B5C6E20202020202F2F207569';
wwv_flow_api.g_varchar2_table(156) := '772E5F7369676E616C4368616E676528293B20202F2F20646F657320746865202E76616C20747269676765722061206368616E676520616C72656164793F5C6E20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C';
wwv_flow_api.g_varchar2_table(157) := '6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F675C6E20207D2C5C6E2020';
wwv_flow_api.g_varchar2_table(158) := '5F7369676E616C4368616E67653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E202020202020202068696464656E456C6D74203D207569772E5F656C656D656E74732E2468696464656E496E7075745B30';
wwv_flow_api.g_varchar2_table(159) := '5D2C20202F2F20446F20776520757365205B305D206F72206A7175657279206F626A6563743F5C6E2020202020202020646973706C6179456C6D74203D207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D3B5C6E5C6E202020';
wwv_flow_api.g_varchar2_table(160) := '20202F2F4E65656420617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B5C6E2020202020617065782E6A51756572792868696464656E456C6D74292E';
wwv_flow_api.g_varchar2_table(161) := '7472696767657228276368616E676527293B5C6E2020202020617065782E6A517565727928646973706C6179456C6D74292E7472696767657228276368616E676527293B5C6E20207D2C5C6E20205F68616E646C654F70656E436C69636B3A2066756E63';
wwv_flow_api.g_varchar2_table(162) := '74696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569773B5C6E5C6E20202020207569772E5F73796E6348696464656E4669656C64286576656E744F626A293B5C6E20202020207569';
wwv_flow_api.g_varchar2_table(163) := '772E5F73686F774469616C6F6728293B5C6E20207D2C5C6E20205F696E69744C616E67756167654D61703A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E20202020202020202069203D206E756C6C2C5C6E';
wwv_flow_api.g_varchar2_table(164) := '20202020202020202074616773203D207B7D3B5C6E5C6E202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B5C6E5C6E20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666';
wwv_flow_api.g_varchar2_table(165) := '696369656E746C792D7365617263682D612D6A736F6E2D61727261792F5C6E20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B5C6E2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D';
wwv_flow_api.g_varchar2_table(166) := '203129207B5C6E2020202020202020207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B5C6E20202020207D5C6E2020202020205C6E20207D2C5C6E20205F6861735461673A2066756E637469';
wwv_flow_api.g_varchar2_table(167) := '6F6E287461674E616D6529207B5C6E202020202076617220756977203D20746869733B5C6E202020202072657475726E207569772E5F76616C7565732E7461674D61705B7461674E616D655D3B5C6E20207D2C5C6E20205F73686F774469616C6F673A20';
wwv_flow_api.g_varchar2_table(168) := '66756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020206C616E675461626C652C5C6E202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F';
wwv_flow_api.g_varchar2_table(169) := '696E6465782C5C6E2020202020202020206469616C6F6748746D6C3B5C6E5C6E20202020206C616E675461626C65203D205C6E2020202020202020202020273C7461626C6520636C6173733D5C22742D5265706F72742D7265706F72745C222073756D6D';
wwv_flow_api.g_varchar2_table(170) := '6172793D5C22417661696C61626C65205472616E736C6174696F6E735C223E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D63';
wwv_flow_api.g_varchar2_table(171) := '6F6C486561645C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C48';
wwv_flow_api.g_varchar2_table(172) := '65616420752D744C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B5C6E202020202020202020202027203C2F74723E5C5C6E27202B5C6E2020202020202020202020';
wwv_flow_api.g_varchar2_table(173) := '27203C74723E5C5C6E273B5C6E5C6E2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E6465782C206C616E672029207B5C6E202020202020206C616E675461626C65202B3D5C6E2020';
wwv_flow_api.g_varchar2_table(174) := '202020202027203C74723E5C5C6E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744327202B2028637572725F6C616E673D3D696E64';
wwv_flow_api.g_varchar2_table(175) := '65783F20272073656C6563746564273A272729202B20275C223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C616E6729202B20273C2F74643E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265';
wwv_flow_api.g_varchar2_table(176) := '706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C27202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B20275C223E273B5C6E20202020202020696620287569772E';
wwv_flow_api.g_varchar2_table(177) := '6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C2229207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C696E70757420747970653D5C22746578745C2220636C6173733D5C22';
wwv_flow_api.g_varchar2_table(178) := '746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C222076616C75653D5C2227202B20617065782E7574696C2E65736361706548544D';
wwv_flow_api.g_varchar2_table(179) := '4C41747472287569772E5F686173546167286C616E672929202B20275C222073697A653D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C22206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669';
wwv_flow_api.g_varchar2_table(180) := '656C644D61784C656E677468202B20275C223E3C2F74643E273B5C6E202020202020207D5C6E20202020202020656C7365207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C746578746172656120';
wwv_flow_api.g_varchar2_table(181) := '636C6173733D5C22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C2227202B5C6E2020202020202020202020202020272063';
wwv_flow_api.g_varchar2_table(182) := '6F6C733D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C2220726F77733D5C2227202B207569772E5F76616C7565732E6669656C64526F7773202B20275C2227202B205C6E202020202020202020202020202027206D61';
wwv_flow_api.g_varchar2_table(183) := '786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C2227202B205C6E2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C4174747228756977';
wwv_flow_api.g_varchar2_table(184) := '2E5F686173546167286C616E672929202B20273C2F74657874617265613E273B5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E202020202020202027203C2F74723E5C5C6E273B5C6E20202020207D293B5C6E20';
wwv_flow_api.g_varchar2_table(185) := '202020206C616E675461626C65202B3D5C6E2020202020273C2F7461626C653E5C5C6E273B5C6E5C6E2020202020206469616C6F6748746D6C203D5C6E2020202020202020202020273C64697620636C6173733D5C226A746C6974656D2D6469616C6F67';
wwv_flow_api.g_varchar2_table(186) := '5C223E3C64697620636C6173733D5C226A746C6974656D2D636F6E7461696E65722075692D7769646765745C223E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D627574746F6E2D636F6E74';
wwv_flow_api.g_varchar2_table(187) := '61696E65725C223E5C5C6E27202B5C6E20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E5C223E27202B5C6E20202020202020202020202720';
wwv_flow_api.g_varchar2_table(188) := '2020202020203C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B5C6E20202020202020202020';
wwv_flow_api.g_varchar2_table(189) := '202F2F2027202020202020203C7370616E20636C6173733D5C2275692D69636F6E2075692D69636F6E2D636C6F73655C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E202020';
wwv_flow_api.g_varchar2_table(190) := '20202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F745C223E27202B205C6E20202020202020202020202720202020202020';
wwv_flow_api.g_varchar2_table(191) := '3C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C794368616E676573202B20273C2F7370616E3E27202B5C6E20202020202020202020202720202020';
wwv_flow_api.g_varchar2_table(192) := '2020203C7370616E20636C6173733D5C22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B5C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20';
wwv_flow_api.g_varchar2_table(193) := '202020202020202020202720203C2F6469763E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D636F6E74656E745C223E5C5C6E27202B5C6E20202020202020202020202020206C616E675461';
wwv_flow_api.g_varchar2_table(194) := '626C65202B5C6E20202020202020202020202720203C2F6469763E5C5C6E27202B5C6E2020202020202020202020273C2F6469763E3C2F6469763E5C5C6E273B5C6E5C6E2020202020207569772E5F656C656D656E74732E24626F64792E617070656E64';
wwv_flow_api.g_varchar2_table(195) := '286469616C6F6748746D6C293B5C6E5C6E2020202020207569772E5F696E6974456C656D656E747328293B5C6E5C6E20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F675C6E20202020207569772E5F656C656D65';
wwv_flow_api.g_varchar2_table(196) := '6E74732E246469616C6F672E6469616C6F67287B5C6E202020202020202020636C6F73654F6E4573636170653A20747275652C5C6E2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C65';
wwv_flow_api.g_varchar2_table(197) := '2C5C6E2020202020202020206175746F526573697A653A20202020747275652C5C6E2020202020202020206D696E57696474683A2020202020203430302C5C6E2020202020202020206D696E4865696768743A20202020203235302C5C6E202020202020';
wwv_flow_api.g_varchar2_table(198) := '20202077696474683A202020202020202020276175746F272C5C6E2020202020202020206865696768743A2020202020202020276175746F272C5C6E2020202020202020206D6F64616C3A202020202020202020747275652C5C6E202020202020202020';
wwv_flow_api.g_varchar2_table(199) := '706F736974696F6E3A2020202020207B206D793A205C226C6566745C222C2061743A205C226C6566742063656E7465725C222C206F663A207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D207D2C5C6E202020202020202020';
wwv_flow_api.g_varchar2_table(200) := '6F70656E3A2066756E6374696F6E2829207B5C6E2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B5C6E20';
wwv_flow_api.g_varchar2_table(201) := '20202020202020202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E642827696E70757427292E666972737428292E666F63757328293B5C6E2020202020202020207D2C5C6E202020202020202020636C6F73653A';
wwv_flow_api.g_varchar2_table(202) := '2066756E6374696F6E2829207B5C6E5C6E202020202020202020202020242874686973292E6469616C6F67282764657374726F7927293B5C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B';
wwv_flow_api.g_varchar2_table(203) := '5C6E2020202020202020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B5C6E5C6E202020202020202020202020696620287569772E5F76';
wwv_flow_api.g_varchar2_table(204) := '616C7565732E666F6375734F6E436C6F7365203D3D3D2027425554544F4E2729207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293B5C6E2020202020202020202020207D20';
wwv_flow_api.g_varchar2_table(205) := '656C736520696620287569772E5F76616C7565732E666F6375734F6E436C6F7365203D3D3D2027494E5055542729207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F6375732829';
wwv_flow_api.g_varchar2_table(206) := '3B5C6E2020202020202020202020207D5C6E5C6E2020202020202020202020207569772E5F76616C7565732E666F6375734F6E436C6F7365203D2027425554544F4E273B5C6E2020202020202020207D5C6E202020202020207D295C6E20202020202020';
wwv_flow_api.g_varchar2_table(207) := '2E6F6E28276B6579646F776E272C2066756E6374696F6E2865767429207B5C6E2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B5C6E20202020202020202020202020';
wwv_flow_api.g_varchar2_table(208) := '20207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B5C6E20202020202020202020207D202020202020202020202020202020205C6E20202020202020202020206576742E73746F7050726F706167617469';
wwv_flow_api.g_varchar2_table(209) := '6F6E28293B5C6E202020202020207D293B5C6E5C6E5C6E20207D2C5C6E202064697361626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64';
wwv_flow_api.g_varchar2_table(210) := '697361626C6564203D3D3D2066616C736529207B5C6E20202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075745C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B5C';
wwv_flow_api.g_varchar2_table(211) := '6E20202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E61747472282764697361626C6564272C2764697361626C656427293B5C6E5C6E20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E';
wwv_flow_api.g_varchar2_table(212) := '5C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427295C6E20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B5C6E2020202020';
wwv_flow_api.g_varchar2_table(213) := '7D5C6E5C6E20202020207569772E5F76616C7565732E64697361626C6564203D20747275653B5C6E20207D2C5C6E2020656E61626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E202020202069';
wwv_flow_api.g_varchar2_table(214) := '6620287569772E5F76616C7565732E64697361626C6564203D3D3D207472756529207B5C6E202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E72656D6F766541747472282764697361626C656427293B5C6E202020';
wwv_flow_api.g_varchar2_table(215) := '202020207569772E5F656C656D656E74732E2468696464656E496E7075742E72656D6F766541747472282764697361626C656427293B5C6E202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202020202E';
wwv_flow_api.g_varchar2_table(216) := '72656D6F766541747472282764697361626C656427295C6E202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202020207569772E5F76';
wwv_flow_api.g_varchar2_table(217) := '616C7565732E64697361626C6564203D2066616C73653B5C6E20202020207D5C6E20207D5C6E7D293B5C6E2F2F2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61705C6E225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(465097716273501121)
,p_plugin_id=>wwv_flow_api.id(1032002593386927165)
,p_file_name=>'www/dist/js/jtl_item.min.js.map'
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
