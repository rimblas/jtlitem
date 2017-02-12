set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>1851245620250164
,p_default_application_id=>102
,p_default_owner=>'OBE'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 102 - JTL Item Translation Demo
--
-- Application Export:
--   Application:     102
--   Name:            JTL Item Translation Demo
--   Date and Time:   17:02 Sunday February 12, 2017
--   Exported By:     JRIMBLAS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.03
--   Instance ID:     113877969898541
--

-- Application Statistics:
--   Pages:                      5
--     Items:                   12
--     Validations:              1
--     Processes:                7
--     Regions:                 11
--     Buttons:                  8
--     Dynamic Actions:          2
--   Shared Components:
--     Logic:
--       Items:                  2
--       Processes:              2
--       Build Options:          1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              3
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              13
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       Shortcuts:              1
--       Plug-ins:               1
--     Globalization:
--     Reports:
--   Supporting Objects:  Included
--     Install scripts:          1

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,102)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'OBE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'JTL Item Translation Demo')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_102')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'C34545BD59D4D04C0A37C3A9864990179C78735EFCA848CFF2CAFE2F36B9E9FF'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(7875418166085176)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Translation Demo'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20170212170241'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7832863836084958)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7876602505085232)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7877133217085240)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:'
,p_parent_list_item_id=>wwv_flow_api.id(7876602505085232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,3'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7875132175085137)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8720299511917146)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Languages (&G_LANG.)'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-globe'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8720581754920893)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'English'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,en:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'en'
,p_parent_list_item_id=>wwv_flow_api.id(8720299511917146)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8721281308927908)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Français'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,fr:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'fr'
,p_parent_list_item_id=>wwv_flow_api.id(8720299511917146)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8730461517930357)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Español'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,es:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'es'
,p_parent_list_item_id=>wwv_flow_api.id(8720299511917146)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7875383681085169)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204D4C53204A534F4E204974656D2076312E31202D20687474703A2F2F617065782E6F7261636C652E636F6D2F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572202E2E2E3A203F0A2A2F0A0A2F2A0A2F2F20687474';
wwv_flow_api.g_varchar2_table(2) := '703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A736F6E2D61727261792F0A766172207461674D6170203D207B7D3B0A7661722069203D206E756C6C3B0A666F72202869203D2030';
wwv_flow_api.g_varchar2_table(3) := '3B20746167732E6C656E677468203E20693B2069202B3D203129207B0A202020207461674D61705B746167735B695D2E7461674E616D655D203D20746167735B695D3B0A7D0A200A76617220686173546167203D2066756E6374696F6E287461674E616D';
wwv_flow_api.g_varchar2_table(4) := '6529207B0A2020202072657475726E207461674D61705B7461674E616D655D3B0A7D3B0A2A2F0A0A66756E6374696F6E20636F6D5F6F6F735F6D6C735F6A746C5F6974656D202870506167654974656D4E616D652C20704F7074696F6E7329207B0A2020';
wwv_flow_api.g_varchar2_table(5) := '7661722067244D4C534974656D203D20617065782E6A5175657279282723272B70506167654974656D4E616D65292C0A202020202020672466756C6C4A534F4E203D20617065782E6A5175657279282723272B70506167654974656D4E616D652B275F48';
wwv_flow_api.g_varchar2_table(6) := '494444454E27292C0A2020202020206C616E67203D20704F7074696F6E732E6C616E672C0A2020202020206C616E675F696E646578203D206E756C6C2C0A2020202020206C616E674A534F4E203D207B7D3B0A0A202066756E6374696F6E206C616E6775';
wwv_flow_api.g_varchar2_table(7) := '6167655F696E64657820286A2C206C29207B0A202020207661722069203D206E756C6C2C0A2020202020202020696478203D206E756C6C3B0A20202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D206E756C6C';
wwv_flow_api.g_varchar2_table(8) := '3B2069202B3D203129207B0A202020202020696620286A5B695D2E6C203D3D3D206C29207B0A2020202020202020696478203D20693B0A2020202020207D0A202020207D0A2020202072657475726E206964783B0A20207D0A0A202066756E6374696F6E';
wwv_flow_api.g_varchar2_table(9) := '2073796E6348696464656E4669656C6428704C616E6729207B0A202020206C616E674A534F4E203D204A534F4E2E706172736528672466756C6C4A534F4E2E76616C2829293B0A202020206C616E674A534F4E5B6C616E675F696E6465785D2E746C3D67';
wwv_flow_api.g_varchar2_table(10) := '244D4C534974656D2E76616C28293B0A20202020672466756C6C4A534F4E2E76616C284A534F4E2E737472696E67696679286C616E674A534F4E29293B0A20207D0A0A202066756E6374696F6E20696E69742028617267756D656E7429207B0A20202020';
wwv_flow_api.g_varchar2_table(11) := '6C616E674A534F4E203D204A534F4E2E706172736528672466756C6C4A534F4E2E76616C2829293B0A202020202F2F2046696E6420746865206C616E677561676520696E6465780A202020206C616E675F696E646578203D206C616E67756167655F696E';
wwv_flow_api.g_varchar2_table(12) := '646578286C616E674A534F4E2C206C616E67293B0A20207D0A0A20202F2F20496E697469616C697A6520616C6C207661726961626C65730A2020696E697428293B0A0A0A20202F2F2053796E63206F75722068696464656E206669656C64207769746820';
wwv_flow_api.g_varchar2_table(13) := '7468652061637475616C2076616C756520696E2074686520636F7272656374206C616E67756167652C206275740A20202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D6974207468';
wwv_flow_api.g_varchar2_table(14) := '6520636F72726563742076616C7565200A2020617065782E6A5175657279282723272B70506167654974656D4E616D65292E6368616E67652873796E6348696464656E4669656C64293B0A2020617065782E6A517565727928646F63756D656E74292E62';
wwv_flow_api.g_varchar2_table(15) := '696E642827617065786265666F7265706167657375626D6974272C2073796E6348696464656E4669656C64293B0A0A20202F2F20496E697469616C697A652063616C6C6261636B7320666F7220746865207374616E646172642041504558204150497320';
wwv_flow_api.g_varchar2_table(16) := '776869636820617265206465616C696E6720776974682070616765206974656D732C0A20202F2F206265636175736520696E207468652063617365206F66204D4C53206974656D2C207468652061637475616C2076616C75652069732073746F72656420';
wwv_flow_api.g_varchar2_table(17) := '696E207468650A20202F2F20636F72726573706F6E64696E67206C616E677561676520656C656D656E74206F66207468652068696464656E206669656C642E0A2020617065782E7769646765742E696E6974506167654974656D2870506167654974656D';
wwv_flow_api.g_varchar2_table(18) := '4E616D652C207B0A2020202073657456616C75653A66756E6374696F6E287056616C7565297B0A20202020202020202020202020202067244D4C534974656D2E76616C287056616C7565293B0A20202020202020202020202020202073796E6348696464';
wwv_flow_api.g_varchar2_table(19) := '656E4669656C6428293B0A202020202020202020202020207D2C0A2020202067657456616C75653A66756E6374696F6E28297B0A20202020202020202020202020202072657475726E2067244D4C534974656D2E76616C28293B0A202020202020202020';
wwv_flow_api.g_varchar2_table(20) := '202020207D0A20207D293B0A7D3B0A0A2F2F2320736F757263654D617070696E6755524C3D636F6D5F6F6F735F6D6C735F6A746C5F6974656D2E6A732E6D61700A';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(8880494198084195)
,p_file_name=>'js/com_oos_mls_jtl_item.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204D4C53204A534F4E204974656D2076312E31202D20687474703A2F2F617065782E6F7261636C652E636F6D2F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572202E2E2E3A203F0A2A2F0A66756E6374696F6E2063';
wwv_flow_api.g_varchar2_table(2) := '6F6D5F6F6F735F6D6C735F6A746C5F6974656D28652C6E297B66756E6374696F6E206128652C6E297B76617220613D6E756C6C2C6C3D6E756C6C3B666F7228613D303B652E6C656E6774683E6126266E756C6C3D3D6C3B612B3D3129655B615D2E6C3D3D';
wwv_flow_api.g_varchar2_table(3) := '3D6E2626286C3D61293B72657475726E206C7D66756E6374696F6E206C2865297B633D4A534F4E2E706172736528722E76616C2829292C635B6F5D2E746C3D752E76616C28292C722E76616C284A534F4E2E737472696E67696679286329297D66756E63';
wwv_flow_api.g_varchar2_table(4) := '74696F6E20742865297B633D4A534F4E2E706172736528722E76616C2829292C6F3D6128632C69297D76617220753D617065782E6A5175657279282223222B65292C723D617065782E6A5175657279282223222B652B225F48494444454E22292C693D6E';
wwv_flow_api.g_varchar2_table(5) := '2E6C616E672C6F3D6E756C6C2C633D7B7D3B7428292C617065782E6A5175657279282223222B65292E6368616E6765286C292C617065782E6A517565727928646F63756D656E74292E62696E642822617065786265666F7265706167657375626D697422';
wwv_flow_api.g_varchar2_table(6) := '2C6C292C617065782E7769646765742E696E6974506167654974656D28652C7B73657456616C75653A66756E6374696F6E2865297B752E76616C2865292C6C28297D2C67657456616C75653A66756E6374696F6E28297B72657475726E20752E76616C28';
wwv_flow_api.g_varchar2_table(7) := '297D7D297D0A2F2F2320736F757263654D617070696E6755524C3D636F6D5F6F6F735F6D6C735F6A746C5F6974656D2E6D696E2E6A732E6D61700A';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(8890373540085501)
,p_file_name=>'js/com_oos_mls_jtl_item.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(7832536899084956)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(7832616157084958)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(7832790700084958)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(23571980292742668)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_JMR.MLS.JTLITEM'
,p_attribute_01=>'return ''["en","fr","es"]'';'
,p_attribute_02=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(8670591864719968)
,p_process_sequence=>-999
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OOS APEX Front-End Boost Config'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_cookie owa_cookie.cookie;',
'begin',
'    l_cookie := owa_cookie.get(''oos-apex-frontend-boost-app-images'');',
'    if l_cookie.vals.count > 0 then',
'        :G_APP_IMAGES := l_cookie.vals(1);',
'    else',
'        :G_APP_IMAGES := :APP_IMAGES;',
'    end if;',
'end;'))
,p_process_when=>'G_APP_IMAGES'
,p_process_when_type=>'ITEM_IS_NULL'
,p_required_patch=>wwv_flow_api.id(8670274230715716)
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(8700515378841453)
,p_process_sequence=>-999
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OOS APEX Front-End Boost (Not Dev)'
,p_process_sql_clob=>':G_APP_IMAGES := :APP_IMAGES;'
,p_process_when=>'G_APP_IMAGES'
,p_process_when_type=>'ITEM_IS_NULL'
,p_required_patch=>-wwv_flow_api.id(8670274230715716)
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8690467123824191)
,p_name=>'G_APP_IMAGES'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8621013600084465)
,p_name=>'G_LANG'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(7876599058085224)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7876952862085235)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7878431031085274)
,p_parent_id=>wwv_flow_api.id(7876952862085235)
,p_option_sequence=>20
,p_short_name=>'Projects'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7881457865085397)
,p_parent_id=>wwv_flow_api.id(7878431031085274)
,p_option_sequence=>30
,p_short_name=>'Maintain Project'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.'
,p_page_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7832955705084969)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833056544084978)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833101252084978)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833274733084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833373518084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833452869084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833531398084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833636289084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833796440084979)
,p_page_template_id=>wwv_flow_api.id(7832955705084969)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7833827442084986)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7833908747084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834060856084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834165161084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834278032084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834399957084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834406292084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834596143084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834678387084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834718090084987)
,p_page_template_id=>wwv_flow_api.id(7833827442084986)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7834842651084987)
,p_theme_id=>42
,p_name=>'Login'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="html-login no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="html-login no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="html-login no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7834996560084987)
,p_page_template_id=>wwv_flow_api.id(7834842651084987)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835069884084988)
,p_page_template_id=>wwv_flow_api.id(7834842651084987)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7835175392084988)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835250641084988)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835399244084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835442680084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835596154084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835614598084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835745774084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835886587084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7835938202084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836050139084989)
,p_page_template_id=>wwv_flow_api.id(7835175392084988)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7836158856084989)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836295248084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836346554084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836482893084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836526550084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836604483084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836793911084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7836845930084989)
,p_page_template_id=>wwv_flow_api.id(7836158856084989)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7836915651084989)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-wrapper">',
'    <div class="t-Dialog-header">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--standard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837029289084990)
,p_page_template_id=>wwv_flow_api.id(7836915651084989)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837149126084990)
,p_page_template_id=>wwv_flow_api.id(7836915651084989)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837238699084990)
,p_page_template_id=>wwv_flow_api.id(7836915651084989)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7837367264084990)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837465931084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837519555084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837679716084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837798847084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837829532084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7837949600084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838023621084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838183070084990)
,p_page_template_id=>wwv_flow_api.id(7837367264084990)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7838252467084990)
,p_theme_id=>42
,p_name=>'Standard'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838346701084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838443100084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838549523084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838699091084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838731380084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838890163084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7838959974084991)
,p_page_template_id=>wwv_flow_api.id(7838252467084990)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(7839027452084991)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Wizard t-Wizard--modal">',
'    <div class=" t-Wizard-steps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Wizard-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Wizard-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7839114974084991)
,p_page_template_id=>wwv_flow_api.id(7839027452084991)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7839224125084991)
,p_page_template_id=>wwv_flow_api.id(7839027452084991)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(7839354424084991)
,p_page_template_id=>wwv_flow_api.id(7839027452084991)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(7869923642085063)
,p_template_name=>'Icon'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(7870038157085067)
,p_template_name=>'Text'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(7870175529085067)
,p_template_name=>'Text with Icon'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7839473101084994)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7839562251085000)
,p_plug_template_id=>wwv_flow_api.id(7839473101084994)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7840910740085012)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7841095065085012)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7841165633085013)
,p_plug_template_id=>wwv_flow_api.id(7841095065085012)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7841287568085013)
,p_plug_template_id=>wwv_flow_api.id(7841095065085012)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7844542996085016)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-body js-regionDialog-body">',
'#BODY#',
'  </div>',
'  <div class="t-DialogRegion-buttons js-regionDialog-buttons">',
'     <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'       <div class="t-ButtonRegion-wrap">',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7844624353085016)
,p_plug_template_id=>wwv_flow_api.id(7844542996085016)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7845471949085016)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7845583852085016)
,p_plug_template_id=>wwv_flow_api.id(7845471949085016)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7845619585085016)
,p_plug_template_id=>wwv_flow_api.id(7845471949085016)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7846208252085017)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7846397141085017)
,p_plug_template_id=>wwv_flow_api.id(7846208252085017)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7846486803085017)
,p_plug_template_id=>wwv_flow_api.id(7846208252085017)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7848392361085018)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">#TITLE#</h2>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7848469967085018)
,p_plug_template_id=>wwv_flow_api.id(7848392361085018)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7848555693085018)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7848854893085019)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7848912313085019)
,p_plug_template_id=>wwv_flow_api.id(7848854893085019)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7849085884085019)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7849173002085019)
,p_plug_template_id=>wwv_flow_api.id(7849085884085019)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7849291185085019)
,p_plug_template_id=>wwv_flow_api.id(7849085884085019)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7851182407085020)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7851230072085020)
,p_plug_template_id=>wwv_flow_api.id(7851182407085020)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7851317280085021)
,p_plug_template_id=>wwv_flow_api.id(7851182407085020)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7852358316085021)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(7852890799085021)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(7852981619085021)
,p_plug_template_id=>wwv_flow_api.id(7852890799085021)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7861214866085043)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_theme_id=>42
,p_theme_class_id=>3
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_list_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7862954027085049)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2885322685880632508
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7865055025085050)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7865534696085051)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7865606068085052)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7866533981085052)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7867045922085053)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7867813975085053)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7867905997085054)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2066548068783481421
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7868873235085054)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(7868991086085055)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7853409943085023)
,p_row_template_name=>'Alerts'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7853577256085028)
,p_row_template_name=>'Badge List'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7855243842085029)
,p_row_template_name=>'Cards'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7857397754085033)
,p_row_template_name=>'Comments'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon a-MediaBlock-graphic">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body a-MediaBlock-content">',
'        <div class="t-Comments-info">',
'            #USER_NAME# &middot; <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7857770162085033)
,p_row_template_name=>'Search Results'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7857818060085034)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(7857818060085034)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7859146683085035)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7860153093085036)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(7861062044085036)
,p_row_template_name=>'Timeline'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7869476356085057)
,p_template_name=>'Hidden'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7869530099085060)
,p_template_name=>'Optional'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7869636148085060)
,p_template_name=>'Optional - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7869781796085060)
,p_template_name=>'Required'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(7869891382085060)
,p_template_name=>'Required - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(7870511613085075)
,p_name=>'Breadcrumb'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(7870725012085085)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="t-Form-field t-Form-searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(7870650698085079)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="uDay today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="uDay" headers="#DY#">'
,p_cust_weekend_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_wk_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_close_format=>'</div></td>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(7871131177085104)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(7838252467084990)
,p_default_dialog_template=>wwv_flow_api.id(7836915651084989)
,p_error_template=>wwv_flow_api.id(7834842651084987)
,p_printer_friendly_template=>wwv_flow_api.id(7838252467084990)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(7834842651084987)
,p_default_button_template=>wwv_flow_api.id(7870038157085067)
,p_default_region_template=>wwv_flow_api.id(7849085884085019)
,p_default_chart_template=>wwv_flow_api.id(7849085884085019)
,p_default_form_template=>wwv_flow_api.id(7849085884085019)
,p_default_reportr_template=>wwv_flow_api.id(7849085884085019)
,p_default_tabform_template=>wwv_flow_api.id(7849085884085019)
,p_default_wizard_template=>wwv_flow_api.id(7849085884085019)
,p_default_menur_template=>wwv_flow_api.id(7852358316085021)
,p_default_listr_template=>wwv_flow_api.id(7849085884085019)
,p_default_irr_template=>wwv_flow_api.id(7848555693085018)
,p_default_report_template=>wwv_flow_api.id(7857818060085034)
,p_default_label_template=>wwv_flow_api.id(7869530099085060)
,p_default_menu_template=>wwv_flow_api.id(7870511613085075)
,p_default_calendar_template=>wwv_flow_api.id(7870650698085079)
,p_default_list_template=>wwv_flow_api.id(7867045922085053)
,p_default_nav_list_template=>wwv_flow_api.id(7868991086085055)
,p_default_top_nav_list_temp=>wwv_flow_api.id(7868991086085055)
,p_default_side_nav_list_temp=>wwv_flow_api.id(7868873235085054)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(7845471949085016)
,p_default_dialogr_template=>wwv_flow_api.id(7840910740085012)
,p_default_option_label=>wwv_flow_api.id(7869530099085060)
,p_default_required_label=>wwv_flow_api.id(7869781796085060)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(7865534696085051)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>62
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/hammer/2.0.3/hammer#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(7870839814085090)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(7870904764085091)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(7871039575085091)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7839776196085010)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7839959751085011)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7840285125085012)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7841301616085013)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7841831253085014)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7842513172085014)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7843101126085015)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7843465316085015)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7843689598085015)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7843853916085015)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7844797334085016)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7845855836085017)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7846942125085017)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7851520129085021)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7851797060085021)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7851932843085021)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7852512420085021)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7853048551085022)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7853671058085028)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7854479130085029)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7855645918085030)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the style and design of the cards in the report.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7855876724085030)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7856249465085031)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the amount of text to display for the Card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7856650645085031)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7857495862085033)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7857900146085034)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7858195281085034)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7858524731085035)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7859268093085035)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7861376725085047)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7861526014085048)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7863382058085049)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7863568864085049)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7863938081085049)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7864382761085050)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7866090375085052)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7866634667085053)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7867592407085053)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7870226950085068)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7871268755085132)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7871455789085133)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7871670744085133)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7871827861085133)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7872002419085133)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7872415741085133)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7873153999085134)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7873542186085134)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7873786104085134)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7873976381085135)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7874193772085135)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7874451675085135)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(7874760478085135)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7839659682085004)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7839808734085011)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(7839776196085010)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840050205085011)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(7839959751085011)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840194692085011)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(7839776196085010)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840320494085012)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(7840285125085012)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840457861085012)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(7839959751085011)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840552118085012)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(7839776196085010)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840646284085012)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(7839959751085011)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840796709085012)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(7839959751085011)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7840810609085012)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7839473101084994)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(7840285125085012)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7841494846085013)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7841531633085013)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7841690991085013)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7841746920085013)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7841955449085014)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(7841831253085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842072653085014)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(7841831253085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842188138085014)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(7841831253085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842236947085014)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(7841831253085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842330474085014)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842498807085014)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842639498085014)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842752398085014)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842895139085014)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7842948189085015)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843085902085015)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843258269085015)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(7843101126085015)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843382038085015)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(7843101126085015)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843543996085015)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843756130085015)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(7843689598085015)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7843947875085015)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844028721085015)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844150379085015)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(7843689598085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844243758085015)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844315620085016)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844403669085016)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7841095065085012)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844839109085016)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(7844797334085016)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7844929991085016)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(7844797334085016)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845020005085016)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(7844797334085016)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845198207085016)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845219427085016)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845303356085016)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7844542996085016)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845710081085016)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(7845471949085016)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7845985003085017)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(7845471949085016)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(7845855836085017)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846026268085017)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(7845471949085016)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846125088085017)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(7845471949085016)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(7845855836085017)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846500951085017)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846655976085017)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846730672085017)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7846818610085017)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847087036085017)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(7846942125085017)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847182741085017)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(7846942125085017)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847253964085018)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847311491085018)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847498331085018)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847531045085018)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847623080085018)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847706087085018)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847867539085018)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7847951654085018)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7848084127085018)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7848109186085018)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7848297057085018)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7846208252085017)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7848625223085019)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7848555693085018)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7848739823085019)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7848555693085018)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849348818085019)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849465725085019)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849571276085019)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849691146085019)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(7841301616085013)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849709083085019)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849839717085019)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7849919311085019)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850088129085020)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850136793085020)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850295050085020)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(7842513172085014)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850352032085020)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850413659085020)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(7843689598085015)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850578820085020)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850661852085020)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850793122085020)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850808908085020)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(7843689598085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7850934016085020)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(7843465316085015)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7851001117085020)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7849085884085019)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(7843853916085015)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7851478596085021)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7851634418085021)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(7851520129085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7851845378085021)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(7851797060085021)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852067365085021)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(7851932843085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852149012085021)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(7851932843085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852211965085021)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7851182407085020)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(7851797060085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852417961085021)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(7852358316085021)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852656500085021)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(7852358316085021)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(7852512420085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7852764062085021)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(7852358316085021)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(7852512420085021)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853169780085022)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(7852890799085021)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(7853048551085022)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853240253085022)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7852890799085021)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(7853048551085022)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853374403085022)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(7852890799085021)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853715221085028)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853800778085028)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7853967209085028)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854015818085028)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854170881085028)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854245994085029)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854326564085029)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854552238085029)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(7854479130085029)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854693737085029)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(7854479130085029)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854740154085029)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854881314085029)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(7854479130085029)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7854972021085029)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855013564085029)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(7854479130085029)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855117821085029)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7853577256085028)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(7854479130085029)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855350267085030)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855426687085030)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855586222085030)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855701991085030)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(7855645918085030)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7855992693085030)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(7855876724085030)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856097475085031)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856112527085031)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(7855645918085030)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856307765085031)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(7856249465085031)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856426520085031)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(7856249465085031)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856541587085031)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(7856249465085031)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856756460085031)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(7856650645085031)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856845117085031)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(7856650645085031)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7856910904085031)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(7855645918085030)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7857075370085031)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7857191867085031)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(7856249465085031)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7857279033085033)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(7855243842085029)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7857534527085033)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7857397754085033)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(7857495862085033)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7857686379085033)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7857397754085033)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(7857495862085033)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858015088085034)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(7857900146085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858231915085034)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(7858195281085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858363693085034)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(7858195281085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858449721085034)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(7858195281085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858654520085035)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(7858524731085035)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858765334085035)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(7858524731085035)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858866402085035)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(7857900146085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7858983733085035)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859001800085035)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7857818060085034)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(7858195281085034)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859316507085035)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859467238085035)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859537485085035)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859678149085035)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859709990085035)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859815119085035)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7859909995085035)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860073975085036)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(7859146683085035)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860202793085036)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860381938085036)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860484562085036)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860591682085036)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860669405085036)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(7853671058085028)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860757613085036)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860867344085036)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7860930075085036)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(7860153093085036)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(7859268093085035)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861189978085036)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(7861062044085036)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(7855645918085030)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861444512085048)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(7861376725085047)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861600304085048)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861755854085048)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861858341085048)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7861994204085048)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862003532085048)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862194281085048)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862241062085048)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862339817085048)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(7861376725085047)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862415470085048)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(7861376725085047)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862589264085048)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862674321085048)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(7861376725085047)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862718235085048)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7862859965085049)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(7861214866085043)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(7861376725085047)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863052517085049)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863175689085049)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863266288085049)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863414107085049)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863639060085049)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(7863568864085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863768293085049)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7863834236085049)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864027996085049)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(7863938081085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864184889085049)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(7863938081085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864227896085050)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(7863938081085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864439637085050)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(7864382761085050)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864509844085050)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(7864382761085050)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864614616085050)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864764413085050)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864888400085050)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(7863938081085049)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7864959613085050)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(7862954027085049)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865173937085051)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(7865055025085050)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865236925085051)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7865055025085050)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865378440085051)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7865055025085050)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865400684085051)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7865055025085050)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865712061085052)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865818810085052)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(7864382761085050)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7865996692085052)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(7864382761085050)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866105422085052)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(7866090375085052)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866211816085052)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866390511085052)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866452966085052)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(7865606068085052)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(7866090375085052)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866796363085053)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7866533981085052)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(7866634667085053)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866817960085053)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7866533981085052)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(7866634667085053)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7866970387085053)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7866533981085052)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(7866634667085053)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867117574085053)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(7863382058085049)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867268134085053)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867376483085053)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867447422085053)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867624767085053)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(7867592407085053)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7867764809085053)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7867045922085053)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(7867592407085053)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868083151085054)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868119688085054)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868236143085054)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868378226085054)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868484265085054)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(7861526014085048)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868506024085054)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868625009085054)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7868734671085054)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(7867905997085054)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7869086433085055)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(7868991086085055)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7869154401085055)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(7868991086085055)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7869232649085055)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(7868991086085055)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7869320839085055)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(7868991086085055)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7870333145085068)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(7870175529085067)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(7870226950085068)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7870469682085069)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(7870175529085067)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(7870226950085068)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7871311433085133)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(7871268755085132)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7871583688085133)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(7871455789085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7871725487085133)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(7871670744085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7871978515085133)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(7871827861085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872183125085133)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(7872002419085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872299508085133)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(7871455789085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872370428085133)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(7871670744085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872529566085133)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(7872415741085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872684760085134)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(7872415741085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872759950085134)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(7872415741085133)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872861070085134)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(7871268755085132)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7872936233085134)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(7872002419085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873074143085134)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(7871827861085133)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873288116085134)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(7873153999085134)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873367457085134)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(7871268755085132)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873479686085134)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(7871268755085132)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873672799085134)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(7873542186085134)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7873831951085135)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(7873786104085134)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874052477085135)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(7873976381085135)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874231115085135)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(7874193772085135)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874376351085135)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(7874193772085135)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874532662085135)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(7874451675085135)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874649763085135)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(7873786104085134)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874812946085135)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(7874760478085135)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7874917719085135)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(7875053110085135)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(7874760478085135)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8670274230715716)
,p_build_option_name=>'DEV_ONLY'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/language
begin
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(8270533777946806)
,p_translation_flow_id=>103
,p_translation_flow_language_cd=>'fr'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(8930252922116327)
,p_translation_flow_id=>104
,p_translation_flow_language_cd=>'es'
);
end;
/
prompt --application/shared_components/globalization/translations
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8270870614952386)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>101.103
,p_translate_from_id=>101
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Login Page'
,p_translate_from_text=>'Login Page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8270996978952412)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>1.103
,p_translate_from_id=>1
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8271159306952415)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>2.103
,p_translate_from_id=>2
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8271376480952415)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>3.103
,p_translate_from_id=>3
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Maintain Project'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8271515589952420)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>101.103
,p_translate_from_id=>101
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Demo - Log In'
,p_translate_from_text=>'Translation Demo - Log In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8271769724952420)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>1.103
,p_translate_from_id=>1
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8271992958952423)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>2.103
,p_translate_from_id=>2
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8272123895952423)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>3.103
,p_translate_from_id=>3
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Maintenir projet'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8275741482952442)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>1.103
,p_translate_from_id=>1
,p_translate_column_id=>12
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8275905002952442)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>2.103
,p_translate_from_id=>2
,p_translate_column_id=>12
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8276143638952443)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>3.103
,p_translate_from_id=>3
,p_translate_column_id=>12
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8276317314952447)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881373230085395.103)
,p_translate_from_id=>wwv_flow_api.id(7881373230085395)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add New'
,p_translate_from_text=>'Add New'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8276534499952447)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879036717085350.103)
,p_translate_from_id=>wwv_flow_api.id(7879036717085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Annuler'
,p_translate_from_text=>'Cancel'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8276784536952447)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879175259085350.103)
,p_translate_from_id=>wwv_flow_api.id(7879175259085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Delete'
,p_translate_from_text=>'Delete'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8276976537952447)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879235516085350.103)
,p_translate_from_id=>wwv_flow_api.id(7879235516085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Save'
,p_translate_from_text=>'Save'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8277173469952447)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879318550085350.103)
,p_translate_from_id=>wwv_flow_api.id(7879318550085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Create'
,p_translate_from_text=>'Create'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8277346984952447)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7876071365085218.103)
,p_translate_from_id=>wwv_flow_api.id(7876071365085218)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Log In'
,p_translate_from_text=>'Log In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8277516089952451)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879690407085355.103)
,p_translate_from_id=>wwv_flow_api.id(7879690407085355)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8277741515952451)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created By'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8277940538952451)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.103)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Prénom'
,p_translate_from_text=>'Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8278106107952453)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created On'
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8278346936952453)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated By'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8278570565952453)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.103)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8278734666952453)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated On'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8278983995952454)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.103)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Actif?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8279137609952454)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Username'
,p_translate_from_text=>'Username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8279309584952455)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.103)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Password'
,p_translate_from_text=>'Password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8280975137952467)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>18
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Action Processed.'
,p_translate_from_text=>'Action Processed.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8284467392952479)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877087253085240.103)
,p_translate_from_id=>wwv_flow_api.id(7877087253085240)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8284624951952480)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877431572085255.103)
,p_translate_from_id=>wwv_flow_api.id(7877431572085255)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8284893248952480)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878551374085274.103)
,p_translate_from_id=>wwv_flow_api.id(7878551374085274)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8285030062952481)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.103)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Maintenir Projet'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8285285022952481)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881591528085397.103)
,p_translate_from_id=>wwv_flow_api.id(7881591528085397)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8285447061952481)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.103)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Audit'
,p_translate_from_text=>'Audit'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8285675125952481)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.103)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'MLS Plugin Demo'
,p_translate_from_text=>'MLS Plugin Demo'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8286015875952485)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877431572085255.103)
,p_translate_from_id=>wwv_flow_api.id(7877431572085255)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* jorge */',
'''f?p=&APP_ID.:3:'' || :APP_SESSION  link,',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
'where lang = :BROWSER_LANGUAGE',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* jorge */',
'''f?p=&APP_ID.:3:'' || :APP_SESSION  link,',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
'where lang = :BROWSER_LANGUAGE',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8295470807952518)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7876602505085232.103)
,p_translate_from_id=>wwv_flow_api.id(7876602505085232)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8295612607952518)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877133217085240.103)
,p_translate_from_id=>wwv_flow_api.id(7877133217085240)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8295813036952518)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875383681085169.103)
,p_translate_from_id=>wwv_flow_api.id(7875383681085169)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Log Out'
,p_translate_from_text=>'Log Out'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8341247664952683)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>63
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search Dialog'
,p_translate_from_text=>'Search Dialog'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8341835782952692)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>66
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_translate_from_text=>'<div class="t-PopupLOV-actions t-Form--large">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8342019871952695)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>67
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8342636422952706)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>70
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-links">'
,p_translate_from_text=>'<div class="t-PopupLOV-links">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8342878243952710)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>71
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8343087913952713)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>72
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search'
,p_translate_from_text=>'Search'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8343273039952716)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>73
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Close'
,p_translate_from_text=>'Close'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8343463471952720)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>74
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Next &gt;'
,p_translate_from_text=>'Next &gt;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8343666052952725)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>75
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&lt; Previous'
,p_translate_from_text=>'&lt; Previous'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8346240768952740)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879424836085352.103)
,p_translate_from_id=>wwv_flow_api.id(7879424836085352)
,p_translate_column_id=>79
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Would you like to perform this delete action?'
,p_translate_from_text=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8350378275952843)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7876952862085235.103)
,p_translate_from_id=>wwv_flow_api.id(7876952862085235)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8350546274952844)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878431031085274.103)
,p_translate_from_id=>wwv_flow_api.id(7878431031085274)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8350726872952844)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881457865085397.103)
,p_translate_from_id=>wwv_flow_api.id(7881457865085397)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Maintain Project'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8356454869952888)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.103)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8356835430952889)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.103)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Indicates if the record is active or inactive.'
,p_translate_from_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8357008705952889)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8357222870952889)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8357416511952889)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8357688587952889)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8357847930952893)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.103)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>112
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_translate_from_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8386521097952989)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877516194085257.103)
,p_translate_from_id=>wwv_flow_api.id(7877516194085257)
,p_translate_column_id=>146
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_translate_from_text=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8386780987952992)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877516194085257.103)
,p_translate_from_id=>wwv_flow_api.id(7877516194085257)
,p_translate_column_id=>147
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No data found.'
,p_translate_from_text=>'No data found.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8387337255953004)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.103)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8387579162953004)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name Jtl'
,p_translate_from_text=>'Name Jtl'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8387789876953004)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8387969172953004)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Active?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8388191024953005)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.103)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created By'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8388384732953005)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created On'
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8388588260953005)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated By'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8388712807953005)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated On'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8388980725953005)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901076135092904.103)
,p_translate_from_id=>wwv_flow_api.id(7901076135092904)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Lang'
,p_translate_from_text=>'Lang'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8389144275953006)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7900908118092903.103)
,p_translate_from_id=>wwv_flow_api.id(7900908118092903)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name'
,p_translate_from_text=>'Name'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8389314751953009)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.103)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8389590489953009)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name Jtl'
,p_translate_from_text=>'Name Jtl'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8389784723953010)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8389922277953010)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Active?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8390135264953010)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.103)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created By'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8390354214953010)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created On'
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8390561090953010)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated By'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8390797786953011)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated On'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8390932308953011)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901076135092904.103)
,p_translate_from_id=>wwv_flow_api.id(7901076135092904)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Lang'
,p_translate_from_text=>'Lang'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8391150904953011)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7900908118092903.103)
,p_translate_from_id=>wwv_flow_api.id(7900908118092903)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name'
,p_translate_from_text=>'Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8395366791953027)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.103)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8395576178953028)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8395768774953028)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8395969572953028)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.103)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Indicates if the record is active or inactive.'
,p_translate_from_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8396187719953028)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.103)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8396367346953028)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8396575505953029)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8396772077953029)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.103)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8453467648953380)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7970246948482343.103)
,p_translate_from_id=>wwv_flow_api.id(7970246948482343)
,p_translate_column_id=>237
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'OOSMLS Text Item'
,p_translate_from_text=>'OOSMLS Text Item'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8473960816953538)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879690407085355.103)
,p_translate_from_id=>wwv_flow_api.id(7879690407085355)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8474154520953538)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8474560354953540)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8474722635953540)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8474976217953540)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.103)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8475126538953541)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8475381643953542)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.103)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'APPLICATION'
,p_translate_from_text=>'APPLICATION'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8475508393953542)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8475729562953543)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.103)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8476115916953550)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8476380115953551)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.103)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return false;'
,p_translate_from_text=>'return false;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8476518257953551)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8476772858953552)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8476960910953552)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.103)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8477167500953552)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8477530258953553)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8477729839953554)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.103)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8480155238953563)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8480573650953564)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8480798472953564)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8480964636953565)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.103)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8481155257953565)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.103)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8481590926953565)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8482999173953570)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.103)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8483568234953570)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8495090025953602)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7876472305085223.103)
,p_translate_from_id=>wwv_flow_api.id(7876472305085223)
,p_translate_column_id=>278
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'CLEAR_CACHE_CURRENT_PAGE'
,p_translate_from_text=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8495252401953606)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>279
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'PX_PROJECTS2'
,p_translate_from_text=>'PX_PROJECTS2'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8495461171953606)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>279
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'PX_PROJECTS2'
,p_translate_from_text=>'PX_PROJECTS2'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8496463949953610)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>280
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'P3_ID'
,p_translate_from_text=>'P3_ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8496681594953610)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>280
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'P3_ID'
,p_translate_from_text=>'P3_ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8497648517953614)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>281
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'ID'
,p_translate_from_text=>'ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8497809428953615)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>281
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'ID'
,p_translate_from_text=>'ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8506020026953675)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7832790700084958.103)
,p_translate_from_id=>wwv_flow_api.id(7832790700084958)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8506388739953675)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7832536899084956.103)
,p_translate_from_id=>wwv_flow_api.id(7832536899084956)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8507161427953685)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7832790700084958.103)
,p_translate_from_id=>wwv_flow_api.id(7832790700084958)
,p_translate_column_id=>300
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8512591101953716)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.103)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8512967304953716)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.103)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8513130402953717)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.103)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8513950131953721)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.103)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8514337123953721)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.103)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8514542576953721)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.103)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8515316728953726)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.103)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8515983759953727)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.103)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8536171973953786)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.103)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>323
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'I:U:D'
,p_translate_from_text=>'I:U:D'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8568908379954054)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.103)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Username'
,p_translate_from_text=>'Username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8569128200954055)
,p_page_id=>101
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.103)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Password'
,p_translate_from_text=>'Password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8569353723954059)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7875211317085138.103)
,p_translate_from_id=>wwv_flow_api.id(7875211317085138)
,p_translate_column_id=>397
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desktop'
,p_translate_from_text=>'Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8800531758003149)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>500.103
,p_translate_from_id=>500
,p_translate_column_id=>5
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Switch Language'
,p_translate_from_text=>'Switch Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8800703548003161)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>500.103
,p_translate_from_id=>500
,p_translate_column_id=>6
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Switch Language'
,p_translate_from_text=>'Switch Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8801682899003176)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>500.103
,p_translate_from_id=>500
,p_translate_column_id=>12
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8801885083003184)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.103)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Last page'
,p_translate_from_text=>'Last page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8802414071003205)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.103)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Items'
,p_translate_from_text=>'Items'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8803295221003228)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(8720299511917146.103)
,p_translate_from_id=>wwv_flow_api.id(8720299511917146)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Languages (&G_LANG.)'
,p_translate_from_text=>'Languages (&G_LANG.)'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8803430227003228)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(8720581754920893.103)
,p_translate_from_id=>wwv_flow_api.id(8720581754920893)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'English'
,p_translate_from_text=>'English'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8803662183003229)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(8721281308927908.103)
,p_translate_from_id=>wwv_flow_api.id(8721281308927908)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Français'
,p_translate_from_text=>'Français'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8803856416003230)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(8730461517930357.103)
,p_translate_from_id=>wwv_flow_api.id(8730461517930357)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Español'
,p_translate_from_text=>'Español'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8808024243003921)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.103)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8808327972003927)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.103)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8808706841003933)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.103)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8808942242003936)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.103)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8812003715004047)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.103)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8812292751004050)
,p_page_id=>500
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.103)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8870349240045180)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901844800092912.103)
,p_translate_from_id=>wwv_flow_api.id(7901844800092912)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Environment'
,p_translate_from_text=>'Environment'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8870451553045210)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901844800092912.103)
,p_translate_from_id=>wwv_flow_api.id(7901844800092912)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8940431733119435)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>101.104
,p_translate_from_id=>101
,p_translate_column_id=>5
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Login Page'
,p_translate_from_text=>'Login Page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8940682448119436)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>1.104
,p_translate_from_id=>1
,p_translate_column_id=>5
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8940861366119437)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>2.104
,p_translate_from_id=>2
,p_translate_column_id=>5
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Projects'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8941080114119437)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>3.104
,p_translate_from_id=>3
,p_translate_column_id=>5
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Maintain Project'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8941216509119437)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>500.104
,p_translate_from_id=>500
,p_translate_column_id=>5
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Switch Language'
,p_translate_from_text=>'Switch Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8941444072119440)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>101.104
,p_translate_from_id=>101
,p_translate_column_id=>6
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Translation Demo - Log In'
,p_translate_from_text=>'Translation Demo - Log In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8941657783119440)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>1.104
,p_translate_from_id=>1
,p_translate_column_id=>6
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8941849774119441)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>2.104
,p_translate_from_id=>2
,p_translate_column_id=>6
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Proyectos'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8942041253119441)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>3.104
,p_translate_from_id=>3
,p_translate_column_id=>6
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Mantenimiento de Projecto'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8942219805119441)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>500.104
,p_translate_from_id=>500
,p_translate_column_id=>6
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Switch Language'
,p_translate_from_text=>'Switch Language'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8946649624119461)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>1.104
,p_translate_from_id=>1
,p_translate_column_id=>12
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8946807659119462)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>2.104
,p_translate_from_id=>2
,p_translate_column_id=>12
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8947005013119462)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>3.104
,p_translate_from_id=>3
,p_translate_column_id=>12
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8947270281119462)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>500.104
,p_translate_from_id=>500
,p_translate_column_id=>12
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help is available for this page.'
,p_translate_from_text=>'No help is available for this page.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8947499842119467)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881373230085395.104)
,p_translate_from_id=>wwv_flow_api.id(7881373230085395)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Add New'
,p_translate_from_text=>'Add New'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8947662254119467)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879036717085350.104)
,p_translate_from_id=>wwv_flow_api.id(7879036717085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Cancelar'
,p_translate_from_text=>'Cancel'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8947886667119468)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879175259085350.104)
,p_translate_from_id=>wwv_flow_api.id(7879175259085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Borrar'
,p_translate_from_text=>'Delete'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948051849119468)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879235516085350.104)
,p_translate_from_id=>wwv_flow_api.id(7879235516085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Guardar'
,p_translate_from_text=>'Save'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948262040119469)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879318550085350.104)
,p_translate_from_id=>wwv_flow_api.id(7879318550085350)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Crear'
,p_translate_from_text=>'Create'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948453441119469)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7876071365085218.104)
,p_translate_from_id=>wwv_flow_api.id(7876071365085218)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Log In'
,p_translate_from_text=>'Log In'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948618303119473)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879690407085355.104)
,p_translate_from_id=>wwv_flow_api.id(7879690407085355)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948705833119473)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Creado Por'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8948991325119473)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.104)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Nombre'
,p_translate_from_text=>'Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8949166792119474)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Creado '
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8949316987119474)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Actualizado Por'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8949589358119474)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.104)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8949776945119474)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Actualizado'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8949959918119475)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.104)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Activo?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8950136433119475)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Username'
,p_translate_from_text=>'Username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8950325509119475)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.104)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Password'
,p_translate_from_text=>'Password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8950557339119475)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.104)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Last page'
,p_translate_from_text=>'Last page'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8952365229119488)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>18
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Action Processed.'
,p_translate_from_text=>'Action Processed.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8956173163119504)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877087253085240.104)
,p_translate_from_id=>wwv_flow_api.id(7877087253085240)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8956383276119505)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901844800092912.104)
,p_translate_from_id=>wwv_flow_api.id(7901844800092912)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Environment'
,p_translate_from_text=>'Environment'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8956551499119505)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877431572085255.104)
,p_translate_from_id=>wwv_flow_api.id(7877431572085255)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Proyectos'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8956709586119505)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878551374085274.104)
,p_translate_from_id=>wwv_flow_api.id(7878551374085274)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8956921553119505)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.104)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Mantenimiento de Projecto'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8957165597119505)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881591528085397.104)
,p_translate_from_id=>wwv_flow_api.id(7881591528085397)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Breadcrumbs'
,p_translate_from_text=>'Breadcrumbs'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8957379216119506)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.104)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Auditoria'
,p_translate_from_text=>'Audit'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8957579667119506)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.104)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'MLS Plugin Demo'
,p_translate_from_text=>'MLS Plugin Demo'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8957714736119506)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.104)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'Items'
,p_translate_from_text=>'Items'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8958128073119511)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901844800092912.104)
,p_translate_from_id=>wwv_flow_api.id(7901844800092912)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8958313204119511)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877431572085255.104)
,p_translate_from_id=>wwv_flow_api.id(7877431572085255)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* jorge */',
'''f?p=&APP_ID.:3:'' || :APP_SESSION  link,',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
'where lang = :BROWSER_LANGUAGE',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* jorge */',
'''f?p=&APP_ID.:3:'' || :APP_SESSION  link,',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
'where lang = :BROWSER_LANGUAGE',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8968745375119548)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7876602505085232.104)
,p_translate_from_id=>wwv_flow_api.id(7876602505085232)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8968914148119549)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877133217085240.104)
,p_translate_from_id=>wwv_flow_api.id(7877133217085240)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Proyectos'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8969150829119549)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875383681085169.104)
,p_translate_from_id=>wwv_flow_api.id(7875383681085169)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Log Out'
,p_translate_from_text=>'Log Out'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8969322047119549)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(8720299511917146.104)
,p_translate_from_id=>wwv_flow_api.id(8720299511917146)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Languages (&G_LANG.)'
,p_translate_from_text=>'Languages (&G_LANG.)'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8969545857119549)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(8720581754920893.104)
,p_translate_from_id=>wwv_flow_api.id(8720581754920893)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'English'
,p_translate_from_text=>'English'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8969760342119549)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(8721281308927908.104)
,p_translate_from_id=>wwv_flow_api.id(8721281308927908)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Français'
,p_translate_from_text=>'Français'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(8969970974119550)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(8730461517930357.104)
,p_translate_from_id=>wwv_flow_api.id(8730461517930357)
,p_translate_column_id=>28
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Español'
,p_translate_from_text=>'Español'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9017008709119707)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>63
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search Dialog'
,p_translate_from_text=>'Search Dialog'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9017609286119716)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>66
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_translate_from_text=>'<div class="t-PopupLOV-actions t-Form--large">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9017805411119719)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>67
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9018494185119729)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>70
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-links">'
,p_translate_from_text=>'<div class="t-PopupLOV-links">'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9018603910119732)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>71
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'</div>'
,p_translate_from_text=>'</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9018840169119735)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>72
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Search'
,p_translate_from_text=>'Search'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9019046875119738)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>73
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Close'
,p_translate_from_text=>'Close'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9019294018119741)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>74
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Next &gt;'
,p_translate_from_text=>'Next &gt;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9019425944119744)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>75
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'&lt; Previous'
,p_translate_from_text=>'&lt; Previous'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9022270770119760)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879424836085352.104)
,p_translate_from_id=>wwv_flow_api.id(7879424836085352)
,p_translate_column_id=>79
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Would you like to perform this delete action?'
,p_translate_from_text=>'Would you like to perform this delete action?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9026365214119835)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7876952862085235.104)
,p_translate_from_id=>wwv_flow_api.id(7876952862085235)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Home'
,p_translate_from_text=>'Home'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9026583502119835)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878431031085274.104)
,p_translate_from_id=>wwv_flow_api.id(7878431031085274)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Proyectos'
,p_translate_from_text=>'Projects'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9026750840119835)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881457865085397.104)
,p_translate_from_id=>wwv_flow_api.id(7881457865085397)
,p_translate_column_id=>100
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Maintain Project'
,p_translate_from_text=>'Maintain Project'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9033444557119875)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.104)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9033820757119875)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.104)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Indicates if the record is active or inactive.'
,p_translate_from_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9034073286119876)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9034240527119876)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9034465952119876)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9034639052119876)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9034849932119880)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7870725012085085.104)
,p_translate_from_id=>wwv_flow_api.id(7870725012085085)
,p_translate_column_id=>112
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_translate_from_text=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9065023482119973)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877516194085257.104)
,p_translate_from_id=>wwv_flow_api.id(7877516194085257)
,p_translate_column_id=>146
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_translate_from_text=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9065219807119977)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877516194085257.104)
,p_translate_from_id=>wwv_flow_api.id(7877516194085257)
,p_translate_column_id=>147
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No data found.'
,p_translate_from_text=>'No data found.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9065815399119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.104)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9066011606119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name Jtl'
,p_translate_from_text=>'Name Jtl'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9066208732119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9066449926119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Active?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9066655356119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.104)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created By'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9066898297119988)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created On'
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9067006849119989)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated By'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9067298614119989)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated On'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9067480952119989)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901076135092904.104)
,p_translate_from_id=>wwv_flow_api.id(7901076135092904)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Lang'
,p_translate_from_text=>'Lang'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9067611500119989)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7900908118092903.104)
,p_translate_from_id=>wwv_flow_api.id(7900908118092903)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name'
,p_translate_from_text=>'Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9067896919119993)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.104)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Id'
,p_translate_from_text=>'Id'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9068017011119993)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name Jtl'
,p_translate_from_text=>'Name Jtl'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9068240005119994)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Alias'
,p_translate_from_text=>'Alias'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9068419037119994)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Active?'
,p_translate_from_text=>'Active?'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9068687636119994)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.104)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created By'
,p_translate_from_text=>'Created By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9068859792119994)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Created On'
,p_translate_from_text=>'Created On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9069046973119994)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated By'
,p_translate_from_text=>'Updated By'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9069280669119995)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Updated On'
,p_translate_from_text=>'Updated On'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9069431926119995)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901076135092904.104)
,p_translate_from_id=>wwv_flow_api.id(7901076135092904)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Lang'
,p_translate_from_text=>'Lang'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9069644469119995)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7900908118092903.104)
,p_translate_from_id=>wwv_flow_api.id(7900908118092903)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Name'
,p_translate_from_text=>'Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9073867961120009)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877639161085266.104)
,p_translate_from_id=>wwv_flow_api.id(7877639161085266)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9074035934120009)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877787256085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877787256085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9074259924120010)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877876993085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877876993085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9074478821120010)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7877945149085271.104)
,p_translate_from_id=>wwv_flow_api.id(7877945149085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Indicates if the record is active or inactive.'
,p_translate_from_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9074698815120010)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878000870085271.104)
,p_translate_from_id=>wwv_flow_api.id(7878000870085271)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9074801582120010)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878176866085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878176866085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9075060435120010)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878209287085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878209287085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9075261696120011)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878367758085272.104)
,p_translate_from_id=>wwv_flow_api.id(7878367758085272)
,p_translate_column_id=>152
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'No help available for this page item.'
,p_translate_from_text=>'No help available for this page item.'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9132023807120370)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7970246948482343.104)
,p_translate_from_id=>wwv_flow_api.id(7970246948482343)
,p_translate_column_id=>237
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'OOSMLS Text Item'
,p_translate_from_text=>'OOSMLS Text Item'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9154471615120516)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879690407085355.104)
,p_translate_from_id=>wwv_flow_api.id(7879690407085355)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9154608740120516)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9155027658120517)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9155295653120517)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9155406829120517)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.104)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9155636660120518)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9155868329120518)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880147142085386.104)
,p_translate_from_id=>wwv_flow_api.id(7880147142085386)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'APPLICATION'
,p_translate_from_text=>'APPLICATION'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9156054784120518)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9156202048120518)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.104)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9156439555120519)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.104)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>268
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9156805164120525)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9157063629120525)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879720848085356.104)
,p_translate_from_id=>wwv_flow_api.id(7879720848085356)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return false;'
,p_translate_from_text=>'return false;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9157257838120525)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9157486751120525)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9157688198120526)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.104)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9157883411120526)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'VALUE'
,p_translate_from_text=>'VALUE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9158281448120527)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9158456849120527)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.104)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9158638286120527)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.104)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9161269459120540)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880327795085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880327795085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9161651582120540)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880569037085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880569037085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9161844006120541)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880739727085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880739727085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9162066472120541)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.104)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9162288902120541)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7880955837085387.104)
,p_translate_from_id=>wwv_flow_api.id(7880955837085387)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9162695786120542)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9163038335120542)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.104)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>271
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9164271076120550)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7879908955085386.104)
,p_translate_from_id=>wwv_flow_api.id(7879908955085386)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9164861333120551)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'NONE'
,p_translate_from_text=>'NONE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9165252672120551)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901667549092910.104)
,p_translate_from_id=>wwv_flow_api.id(7901667549092910)
,p_translate_column_id=>272
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'BOTH'
,p_translate_from_text=>'BOTH'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9177357626120589)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7876472305085223.104)
,p_translate_from_id=>wwv_flow_api.id(7876472305085223)
,p_translate_column_id=>278
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'CLEAR_CACHE_CURRENT_PAGE'
,p_translate_from_text=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9177726398120592)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>279
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'PX_PROJECTS2'
,p_translate_from_text=>'PX_PROJECTS2'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9177917358120593)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>279
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'PX_PROJECTS2'
,p_translate_from_text=>'PX_PROJECTS2'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9179167360120597)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>280
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'P3_ID'
,p_translate_from_text=>'P3_ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9179323632120597)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>280
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'P3_ID'
,p_translate_from_text=>'P3_ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9180583194120602)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881104910085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881104910085390)
,p_translate_column_id=>281
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'ID'
,p_translate_from_text=>'ID'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9180777768120602)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>281
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'ID'
,p_translate_from_text=>'ID'
);
end;
/
begin
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9190335329120673)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7832790700084958.104)
,p_translate_from_id=>wwv_flow_api.id(7832790700084958)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9190691413120673)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7832536899084956.104)
,p_translate_from_id=>wwv_flow_api.id(7832536899084956)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9191424555120681)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7832790700084958.104)
,p_translate_from_id=>wwv_flow_api.id(7832790700084958)
,p_translate_column_id=>300
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9197014581120718)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.104)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9197495165120718)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.104)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9197652828120718)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.104)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9197801813120719)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.104)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9198836686120724)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.104)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9199260037120724)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901121793092905.104)
,p_translate_from_id=>wwv_flow_api.id(7901121793092905)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9199412133120724)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.104)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'TEXT'
,p_translate_from_text=>'TEXT'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9199689709120725)
,p_page_id=>500
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901596769092909.104)
,p_translate_from_id=>wwv_flow_api.id(7901596769092909)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9200631201120729)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7878969186085350.104)
,p_translate_from_id=>wwv_flow_api.id(7878969186085350)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9201232047120730)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875749274085200.104)
,p_translate_from_id=>wwv_flow_api.id(7875749274085200)
,p_translate_column_id=>310
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Y'
,p_translate_from_text=>'Y'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9225373780120815)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7881276861085390.104)
,p_translate_from_id=>wwv_flow_api.id(7881276861085390)
,p_translate_column_id=>323
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'I:U:D'
,p_translate_from_text=>'I:U:D'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9277868808121168)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875893220085211.104)
,p_translate_from_id=>wwv_flow_api.id(7875893220085211)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Username'
,p_translate_from_text=>'Username'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9278009848121168)
,p_page_id=>101
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875984057085217.104)
,p_translate_from_id=>wwv_flow_api.id(7875984057085217)
,p_translate_column_id=>396
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Password'
,p_translate_from_text=>'Password'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9278497839121179)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7875211317085138.104)
,p_translate_from_id=>wwv_flow_api.id(7875211317085138)
,p_translate_column_id=>397
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desktop'
,p_translate_from_text=>'Desktop'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9690443806296470)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(9520501966061584.103)
,p_translate_from_id=>wwv_flow_api.id(9520501966061584)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return ''["en","fr","es"]'';'
,p_translate_from_text=>'return ''["en","fr","es"]'';'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9690539382296481)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(9520501966061584.103)
,p_translate_from_id=>wwv_flow_api.id(9520501966061584)
,p_translate_column_id=>299
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9693212001297928)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(9520501966061584.104)
,p_translate_from_id=>wwv_flow_api.id(9520501966061584)
,p_translate_column_id=>298
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return ''["en","fr","es"]'';'
,p_translate_from_text=>'return ''["en","fr","es"]'';'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9693387893297931)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(9520501966061584.104)
,p_translate_from_id=>wwv_flow_api.id(9520501966061584)
,p_translate_column_id=>299
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9940112633547313)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.103)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9940749635547688)
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.103)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9941104021547757)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901957678092913.103)
,p_translate_from_id=>wwv_flow_api.id(7901957678092913)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9941358544547762)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7901957678092913.103)
,p_translate_from_id=>wwv_flow_api.id(7901957678092913)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9944145302548105)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.103)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return true;'
,p_translate_from_text=>'return true;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9947319593548658)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.104)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>14
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9947610289548960)
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.104)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>111
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9947938975549029)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901957678092913.104)
,p_translate_from_id=>wwv_flow_api.id(7901957678092913)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9948159312549032)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7901957678092913.104)
,p_translate_from_id=>wwv_flow_api.id(7901957678092913)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Description'
,p_translate_from_text=>'Description'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(9951011893549366)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902018207092914.104)
,p_translate_from_id=>wwv_flow_api.id(7902018207092914)
,p_translate_column_id=>269
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'return true;'
,p_translate_from_text=>'return true;'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10680100668181098)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902182938092915.103)
,p_translate_from_id=>wwv_flow_api.id(7902182938092915)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Disable Name'
,p_translate_from_text=>'Disable Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10680232450181125)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902449360092918.103)
,p_translate_from_id=>wwv_flow_api.id(7902449360092918)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Enable Name'
,p_translate_from_text=>'Enable Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10686356072182503)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902182938092915.104)
,p_translate_from_id=>wwv_flow_api.id(7902182938092915)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Desabilitar Nombre'
,p_translate_from_text=>'Disable Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10686421958182503)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902449360092918.104)
,p_translate_from_id=>wwv_flow_api.id(7902449360092918)
,p_translate_column_id=>13
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Abilitar Nombre'
,p_translate_from_text=>'Enable Name'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10837702557167571)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.103)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'About'
,p_translate_from_text=>'About'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10837897060167604)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.103)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This demo uses a single table with two columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This demo uses a single table with two columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10840554567168439)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.103)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10840621914168442)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.103)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10845200296168872)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.104)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'About'
,p_translate_from_text=>'About'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10845378148168875)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.104)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This demo uses a single table with two columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This demo uses a single table with two columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10847559244169619)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.104)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>308
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'N'
,p_translate_from_text=>'N'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(10847645350169622)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(10832058580104201.104)
,p_translate_from_id=>wwv_flow_api.id(10832058580104201)
,p_translate_column_id=>309
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'HTML'
,p_translate_from_text=>'HTML'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(11480147397390900)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902711185092921.103)
,p_translate_from_id=>wwv_flow_api.id(7902711185092921)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Link'
,p_translate_from_text=>'Link'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(11480296958390931)
,p_page_id=>2
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(7902711185092921.103)
,p_translate_from_id=>wwv_flow_api.id(7902711185092921)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Link'
,p_translate_from_text=>'Link'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(11480969059392125)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902711185092921.104)
,p_translate_from_id=>wwv_flow_api.id(7902711185092921)
,p_translate_column_id=>148
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Link'
,p_translate_from_text=>'Link'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(11481021746392154)
,p_page_id=>2
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(7902711185092921.104)
,p_translate_from_id=>wwv_flow_api.id(7902711185092921)
,p_translate_column_id=>149
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'Link'
,p_translate_from_text=>'Link'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22710172704113479)
,p_page_id=>3
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(13150904191473505.103)
,p_translate_from_id=>wwv_flow_api.id(13150904191473505)
,p_translate_column_id=>16
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'The name is required'
,p_translate_from_text=>'The name is required'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22710252972113526)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(13153139186473527.103)
,p_translate_from_id=>wwv_flow_api.id(13153139186473527)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_translate_from_text=>'APEX.PAGE_ITEM_IS_REQUIRED'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22710353950113530)
,p_page_id=>1
,p_translated_flow_id=>103
,p_translate_to_id=>wwv_flow_api.id(13153139186473527.103)
,p_translate_from_id=>wwv_flow_api.id(13153139186473527)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'fr'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22717297503114921)
,p_page_id=>3
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(13150904191473505.104)
,p_translate_from_id=>wwv_flow_api.id(13150904191473505)
,p_translate_column_id=>16
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>'The name is required'
,p_translate_from_text=>'The name is required'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22717334974114938)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(13153139186473527.104)
,p_translate_from_id=>wwv_flow_api.id(13153139186473527)
,p_translate_column_id=>20
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'Y'
,p_translate_to_text=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_translate_from_text=>'APEX.PAGE_ITEM_IS_REQUIRED'
);
wwv_flow_api.create_translation(
 p_id=>wwv_flow_api.id(22717529773114941)
,p_page_id=>1
,p_translated_flow_id=>104
,p_translate_to_id=>wwv_flow_api.id(13153139186473527.104)
,p_translate_from_id=>wwv_flow_api.id(13153139186473527)
,p_translate_column_id=>21
,p_translate_to_lang_code=>'es'
,p_translation_specific_to_item=>'NO'
,p_template_translatable=>'N'
,p_translate_to_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
,p_translate_from_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7879424836085352)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(7875418166085176)
,p_name=>'APEX'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'procedure post_auth',
'is',
'begin',
'  apex_util.set_session_lang(''en'');',
'  :G_LANG := ''en'';',
'end;',
''))
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'post_auth'
,p_cookie_name=>'INSUM'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/jmr_mls_jtlitem
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(47042147073940200)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'JMR.MLS.JTLITEM'
,p_display_name=>'JTL Item'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','JMR.MLS.JTLITEM'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'subtype gt_string is varchar2(32767);',
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
'',
'  l_default_language        gt_string;',
'  l_language                gt_string;',
'  l_edit_languages          boolean := false;',
'  l_languages_list          gt_string;',
'  l_dialog_title            gt_string := p_item.plain_label;',
'  l_messages                gt_string := p_plugin.attribute_02; -- for MLS messages',
'',
'  l_postfix           varchar2(8);',
'  l_idx               number;',
'  l_count             number;',
'  l_found             boolean := false;',
'',
'  l_name              varchar2(255);',
'  l_display_value     gt_string;',
'',
'  l_onload_code       gt_string;',
'  l_item_jq           gt_string := apex_plugin_util.page_item_names_to_jquery(p_item.name);',
'  l_item_display      gt_string := p_item.name ||''_DISPLAY'';',
'  -- l_item_display_jq   gt_string := apex_plugin_util.page_item_names_to_jquery(l_item_display);',
'',
'  l_render_result     apex_plugin.t_page_item_render_result;',
'',
'  l_crlf              char(2) := chr(13)||chr(10);',
'',
'begin',
'  apex_debug.message(''BEGIN'');',
'',
'  l_default_language := coalesce(apex_plugin_util.replace_substitutions(p_item.attribute_01)',
'                               , apex_util.get_session_lang);',
'  l_edit_languages := apex_plugin_util.get_plsql_func_result_boolean(p_item.attribute_02);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attribute_01); -- Enabled Language List',
'',
'  apex_debug.message(''p_item.attribute_02: %s'', p_item.attribute_02);',
'',
'  if (apex_application.g_debug) then',
'    apex_plugin_util.debug_page_item(p_plugin, p_item, p_value, p_is_readonly, p_is_printer_friendly);',
'    apex_debug.message(''l_default_language: %s'', l_default_language);',
'  end if;',
'  -- Tell APEX that this field is navigable',
'  l_render_result.is_navigable := true;',
'',
'',
'  -- get the value for the language',
'  apex_json.parse(p_value);',
'  apex_debug.message(''parsing: %s'', p_value);',
'  l_count := apex_json.get_count(p_path => ''.'');',
'  apex_debug.message(''lagunages count: %s'', l_count);',
'',
'  l_idx := 1;',
'  l_found := false;',
'  while not l_found and l_idx <= nvl(l_count,0) loop',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => l_idx);',
'    apex_debug.message(''language: %s'', l_language);',
'',
'    if l_language = l_default_language then',
'      l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => l_idx);',
'      apex_debug.message(''Translation: %s'', l_display_value);',
'      l_found := true;',
'    end if;',
'    l_idx := l_idx + 1;',
'    ',
'  end loop;',
'',
'  -- If we didn''t find a language match, default to the first entry',
'  if not l_found then',
'    -- l_language := l_default_language;',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => 1);',
'    l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => 1);',
'    apex_debug.message(''Didn''''t find a language match, using the 1st language: %s'', l_language);',
'  end if;',
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
'/*',
'    if (apex_application.g_debug) then',
'      -- Using a textarea when debugging allows you to see the hidden item value',
'      sys.htp.prn (',
'        ''<textarea id="'' || p_item.name ||''" ''',
'               || ''name="'' ||l_name || ''" rows="2" cols="80">''',
'               || p_value',
'               ||''</textarea>'');',
'    else',
'*/',
'      sys.htp.p(''',
'        <input type="hidden" ''',
'           || ''id="'' || p_item.name || ''" ''',
'           || ''name="'' || l_name || ''" ''',
'           || ''value="'' || apex_plugin_util.escape(p_value => p_value, p_escape => p_item.escape_output) || ''" ''',
'           || ''/>'');',
'    -- end if;',
'',
'    sys.htp.p (',
'        ''<fieldset id="'' || p_item.name || ''_fieldset" class="jtlitem-controls">'');',
'    sys.htp.prn (',
'        ''<input type="text" id="'' || l_item_display || ''" ''',
'             || ''value="''|| apex_plugin_util.escape(p_value => l_display_value, p_escape => p_item.escape_output) || ''" ''',
'             || ''size="'' || p_item.element_width||''" ''',
'             || ''maxlength="''||p_item.element_max_length||''" ''',
'             || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'             || ''class="text_field jtlitem '' || p_item.element_css_classes || ''"''',
'             || p_item.element_attributes ||'' />'' );',
'    if l_edit_languages then',
'      sys.htp.p (',
'                  ''    <button type="button" class="jtlitem-modal-open t-Button">'' || l_crlf',
'               || ''      <span class="t-Icon fa fa-globe"></span>'' || l_crlf',
'               || ''    </button>'' || l_crlf',
'               );',
'    end if;',
'    sys.htp.p (',
'        '' </fieldset>'');',
'    ',
'  end if;',
'',
'  apex_css.add_file(',
'      p_name      => ''jtl_item''',
'    , p_directory => p_plugin.file_prefix',
'  );',
'',
'  apex_javascript.add_library(',
'      p_name      => ''jtl_item''',
'    , p_directory => p_plugin.file_prefix',
'    , p_check_to_add_minified => true',
'  );',
'',
'  apex_javascript.add_onload_code (',
'      p_code => ''$("'' || l_item_jq || ''").jtl_item({'' || l_crlf',
'                      || apex_javascript.add_attribute(''lang'', l_language, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang_codes'', l_languages_list, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''messages'', l_messages, false, true) || l_crlf',
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
''))
,p_render_function=>'render'
,p_validation_function=>'validate'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:PLACEHOLDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Plugin for storing multi-language translations (MLS) in a JSON column.'
,p_version_identifier=>'0.1'
,p_about_url=>'https://github.com/rimblas/jtlitem'
,p_files_version=>48
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47042339765941918)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Enabled Language List'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_default_value=>'return ''["en","fr","es"]'';'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The Enabled Language List must be a JavaScript array with the supported application languages. The sort order matters and the first language should be the Application''s Primary Language.<br> ',
'It is recommended that when new languages are enabled for the applicating that the JSON columns be updated to include the new language.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47042602390942039)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Messages'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_default_value=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
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
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(47043338508942064)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Session Language'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'This is the language code for the current session. If empty, the plugin will use "apex_util.get_session_lang". Substitution Strings are also supported, for example &BROWSER_LANGUAGE.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47042922397942052)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Edit Languages'
,p_attribute_type=>'PLSQL FUNCTION BODY BOOLEAN'
,p_is_required=>true
,p_default_value=>'return false;'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Return true or false. When true a button to edit all the languages will be present. The button will open a dialog that will allow the user to edit all the languages specified in the "Language List" parameter.<br>',
'When false and a new record is created the "Installed Languages" Application plugin attribute will be used to seed all available languages.'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076302E31202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572202E2E2E3A203F0A2A2F0A242E7769646765742822746B2E6A746C5F697465';
wwv_flow_api.g_varchar2_table(2) := '6D222C7B6F7074696F6E733A7B6C616E673A22656E222C6C616E675F636F6465733A5B22656E222C226672222C226573225D2C6D657373616765733A6E756C6C2C6669656C6453697A653A33302C6669656C644D61784C656E6774683A38302C6469616C';
wwv_flow_api.g_varchar2_table(3) := '6F675469746C653A6E756C6C7D2C5F6372656174655072697661746553746F726167653A66756E6374696F6E28297B76617220653D746869733B652E5F76616C7565733D7B617065784974656D49643A22222C636F6E74726F6C7349643A22222C666965';
wwv_flow_api.g_varchar2_table(4) := '6C6453697A653A33302C6669656C644D61784C656E6774683A38302C646174614A534F4E3A7B7D2C637572725F6C616E675F696E6465783A302C6C616E6775616765733A7B7D2C7461674D61703A7B7D2C6D657373616765733A242E70617273654A534F';
wwv_flow_api.g_varchar2_table(5) := '4E28652E6F7074696F6E732E6D65737361676573292C746F74616C4C616E6775616765733A302C64697361626C65643A21312C666F6375734F6E436C6F73653A22425554544F4E222C6E65775265636F72643A21312C7369676E616C4368616E67653A21';
wwv_flow_api.g_varchar2_table(6) := '317D2C652E5F656C656D656E74733D7B2477696E646F773A7B7D2C24646F63756D656E743A7B7D2C24626F64793A7B7D2C2468696464656E496E7075743A7B7D2C24646973706C6179496E7075743A7B7D2C246669656C647365743A7B7D2C246D6C7342';
wwv_flow_api.g_varchar2_table(7) := '7574746F6E3A7B7D2C246469616C6F673A7B7D2C246469616C6F67436F6E74656E743A7B7D2C2473617665427574746F6E3A7B7D2C2463616E63656C427574746F6E3A7B7D2C24627574746F6E436F6E7461696E65723A7B7D7D7D2C5F6372656174653A';
wwv_flow_api.g_varchar2_table(8) := '66756E6374696F6E28297B66756E6374696F6E206528652C74297B766172206E3D6E756C6C2C613D2D313B666F72286E3D303B652E6C656E6774683E6E2626613D3D2D313B6E2B3D3129655B6E5D2E6C3D3D3D74262628613D6E293B72657475726E2061';
wwv_flow_api.g_varchar2_table(9) := '7D76617220743D746869733B742E5F6372656174655072697661746553746F7261676528292C742E5F76616C7565732E617065784974656D49643D2428742E656C656D656E74292E617474722822696422292C742E5F76616C7565732E636F6E74726F6C';
wwv_flow_api.g_varchar2_table(10) := '7349643D742E5F76616C7565732E617065784974656D49642B225F6669656C64736574222C742E5F696E6974456C656D656E747328292C742E5F696E697442617365456C656D656E747328292C742E5F76616C7565732E6C616E6775616765733D4A534F';
wwv_flow_api.g_varchar2_table(11) := '4E2E706172736528742E6F7074696F6E732E6C616E675F636F646573292C742E5F76616C7565732E746F74616C4C616E6775616765733D742E5F76616C7565732E6C616E6775616765732E6C656E6774682C742E5F696E6974446174614A534F4E28292C';
wwv_flow_api.g_varchar2_table(12) := '742E5F696E69744C616E67756167654D617028292C742E5F76616C7565732E637572725F6C616E675F696E6465783D6528742E5F76616C7565732E646174614A534F4E2C742E6F7074696F6E732E6C616E67292C742E5F656C656D656E74732E24646973';
wwv_flow_api.g_varchar2_table(13) := '706C6179496E7075742E62696E6428226368616E6765222C7B7569773A747D2C742E5F73796E6348696464656E4669656C64292C742E5F656C656D656E74732E24646F63756D656E742E62696E642822617065786265666F7265706167657375626D6974';
wwv_flow_api.g_varchar2_table(14) := '222C7B7569773A747D2C742E5F73796E6348696464656E4669656C64292C742E5F656C656D656E74732E246D6C73427574746F6E2E62696E642822636C69636B222C7B7569773A747D2C742E5F68616E646C654F70656E436C69636B292C617065782E64';
wwv_flow_api.g_varchar2_table(15) := '656275672E6D65737361676528342C225265676973746572696E67207769746820617065782E7769646765742E696E6974506167654974656D3A20222B742E5F656C656D656E74732E24646973706C6179496E7075742E61747472282269642229292C61';
wwv_flow_api.g_varchar2_table(16) := '7065782E7769646765742E696E6974506167654974656D28742E5F656C656D656E74732E2468696464656E496E7075742E617474722822696422292C7B73657456616C75653A66756E6374696F6E28652C6E297B742E5F656C656D656E74732E24646973';
wwv_flow_api.g_varchar2_table(17) := '706C6179496E7075742E76616C286E292C742E5F73796E6348696464656E4669656C6428297D2C67657456616C75653A66756E6374696F6E28297B72657475726E20742E5F656C656D656E74732E2468696464656E496E7075742E76616C28297D2C7365';
wwv_flow_api.g_varchar2_table(18) := '74466F6375733A66756E6374696F6E28297B742E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328297D2C656E61626C653A66756E6374696F6E28297B742E656E61626C6528297D2C64697361626C653A66756E6374696F6E28';
wwv_flow_api.g_varchar2_table(19) := '297B742E64697361626C6528297D7D297D2C5F696E6974456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E2477696E646F773D242877696E646F77292C652E5F656C656D656E74732E24646F63';
wwv_flow_api.g_varchar2_table(20) := '756D656E743D2428646F63756D656E74292C652E5F656C656D656E74732E24626F64793D2428646F63756D656E742E626F6479292C652E5F656C656D656E74732E246469616C6F673D2428226469762E6A746C6974656D2D6469616C6F6722297D2C5F69';
wwv_flow_api.g_varchar2_table(21) := '6E69744469616C6F67456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E246469616C6F673D2428226469762E6A746C6974656D2D6469616C6F6722292C652E5F656C656D656E74732E24646961';
wwv_flow_api.g_varchar2_table(22) := '6C6F67436F6E74656E743D2428226469762E6A746C6974656D2D636F6E74656E7422292C652E5F656C656D656E74732E2473617665427574746F6E3D242822627574746F6E2E6A746C6974656D2D736176652D627574746F6E22292C652E5F656C656D65';
wwv_flow_api.g_varchar2_table(23) := '6E74732E2463616E63656C427574746F6E3D242822627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E22297D2C5F696E697442617365456C656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D';
wwv_flow_api.g_varchar2_table(24) := '656E74732E2468696464656E496E7075743D652E656C656D656E742C652E5F656C656D656E74732E24646973706C6179496E7075743D24282223222B652E5F76616C7565732E617065784974656D49642B225F444953504C415922292C652E5F76616C75';
wwv_flow_api.g_varchar2_table(25) := '65732E6669656C6453697A653D652E5F656C656D656E74732E24646973706C6179496E7075742E61747472282273697A6522292C652E5F76616C7565732E6669656C644D61784C656E6774683D652E5F656C656D656E74732E24646973706C6179496E70';
wwv_flow_api.g_varchar2_table(26) := '75742E6174747228226D61786C656E67746822292C652E5F656C656D656E74732E246669656C647365743D24282223222B652E5F76616C7565732E636F6E74726F6C734964292C652E5F656C656D656E74732E246D6C73427574746F6E3D652E5F656C65';
wwv_flow_api.g_varchar2_table(27) := '6D656E74732E246669656C647365742E66696E642822627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E22297D2C5F696E6974446174614A534F4E3A66756E6374696F6E28297B76617220653D746869732C743D5B5D2C6E3D652E5F656C65';
wwv_flow_api.g_varchar2_table(28) := '6D656E74732E2468696464656E496E7075742E76616C28293B6E3F28652E5F76616C7565732E646174614A534F4E3D4A534F4E2E7061727365286E292C652E5F76616C7565732E6E65775265636F72643D2131293A28652E5F76616C7565732E6C616E67';
wwv_flow_api.g_varchar2_table(29) := '75616765732E666F72456163682866756E6374696F6E2865297B742E70757368287B6C3A652C746C3A22227D297D292C652E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287429292C652E5F76';
wwv_flow_api.g_varchar2_table(30) := '616C7565732E646174614A534F4E3D742C652E5F76616C7565732E6E65775265636F72643D2130297D2C5F73796E6348696464656E4669656C643A66756E6374696F6E2865297B76617220742C6E3B696628743D22756E646566696E656422213D747970';
wwv_flow_api.g_varchar2_table(31) := '656F6620653F652E646174612E7569773A746869732C6E3D742E5F76616C7565732E637572725F6C616E675F696E6465782C742E5F76616C7565732E6E65775265636F726429666F722876617220613D742E5F76616C7565732E746F74616C4C616E6775';
wwv_flow_api.g_varchar2_table(32) := '616765732D313B613E3D303B612D2D29742E5F76616C7565732E646174614A534F4E5B615D2E746C3D742E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B656C736520742E5F76616C7565732E646174614A534F4E5B6E5D2E';
wwv_flow_api.g_varchar2_table(33) := '746C3D742E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B742E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E6769667928742E5F76616C7565732E646174614A534F4E29292C';
wwv_flow_api.g_varchar2_table(34) := '742E5F696E69744C616E67756167654D617028297D2C5F696E69744469616C6F67427574746F6E733A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E2463616E63656C427574746F6E2E62696E642822636C69636B';
wwv_flow_api.g_varchar2_table(35) := '222C7B7569773A657D2C652E5F68616E646C6543616E63656C427574746F6E436C69636B292C652E5F656C656D656E74732E2473617665427574746F6E2E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C655361766542757474';
wwv_flow_api.g_varchar2_table(36) := '6F6E436C69636B297D2C5F68616E646C6543616E63656C427574746F6E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D';
wwv_flow_api.g_varchar2_table(37) := '2C5F68616E646C6553617665427574746F6E436C69636B3A66756E6374696F6E2865297B76617220742C6E3D652E646174612E7569773B6E2E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E642822696E70757422292E65616368';
wwv_flow_api.g_varchar2_table(38) := '2866756E6374696F6E28652C61297B617065782E64656275672E6D65737361676528342C652B2228222B612E646174617365742E6C616E672B22293A222B612E76616C7565292C6E2E5F76616C7565732E646174614A534F4E5B655D2E6C3D612E646174';
wwv_flow_api.g_varchar2_table(39) := '617365742E6C616E672C6E2E5F76616C7565732E646174614A534F4E5B655D2E746C3D612E76616C75652C6E2E5F76616C7565732E637572725F6C616E675F696E6465783D3D65262628743D612E76616C7565297D292C6E2E5F696E69744C616E677561';
wwv_flow_api.g_varchar2_table(40) := '67654D617028292C6E2E5F656C656D656E74732E24646973706C6179496E7075742E76616C2874292C6E2E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679286E2E5F76616C7565732E646174614A';
wwv_flow_api.g_varchar2_table(41) := '534F4E29292C6E2E5F76616C7565732E6E65775265636F72643D21312C6E2E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F7369676E616C4368616E67653A66756E6374696F6E28297B76617220653D746869';
wwv_flow_api.g_varchar2_table(42) := '732C743D652E5F656C656D656E74732E2468696464656E496E7075745B305D2C6E3D652E5F656C656D656E74732E24646973706C6179496E7075745B305D3B617065782E6A51756572792874292E7472696767657228226368616E676522292C61706578';
wwv_flow_api.g_varchar2_table(43) := '2E6A5175657279286E292E7472696767657228226368616E676522297D2C5F68616E646C654F70656E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E5F73796E6348696464656E4669656C642865292C742E';
wwv_flow_api.g_varchar2_table(44) := '5F73686F774469616C6F6728297D2C5F696E69744C616E67756167654D61703A66756E6374696F6E28297B76617220653D746869732C743D6E756C6C2C6E3D7B7D3B666F72286E3D652E5F76616C7565732E646174614A534F4E2C652E5F76616C756573';
wwv_flow_api.g_varchar2_table(45) := '2E7461674D61703D7B7D2C743D303B6E2E6C656E6774683E743B742B3D3129652E5F76616C7565732E7461674D61705B6E5B745D2E6C5D3D6E5B745D2E746C7D2C5F6861735461673A66756E6374696F6E2865297B76617220743D746869733B72657475';
wwv_flow_api.g_varchar2_table(46) := '726E20742E5F76616C7565732E7461674D61705B655D7D2C5F73686F774469616C6F673A66756E6374696F6E28297B76617220652C742C6E3D746869732C613D6E2E5F76616C7565732E637572725F6C616E675F696E6465783B653D273C7461626C6520';
wwv_flow_api.g_varchar2_table(47) := '636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E203C74723E5C6E20203C746820636C6173733D22742D5265706F72742D636F6C48656164223E272B6E';
wwv_flow_api.g_varchar2_table(48) := '2E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C2B273C2F74683E20203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E272B6E2E5F76616C7565732E6D657373616765732E6C616E6775';
wwv_flow_api.g_varchar2_table(49) := '61676556616C75652B223C2F74683E203C2F74723E5C6E203C74723E5C6E222C242E65616368286E2E5F76616C7565732E6C616E6775616765732C66756E6374696F6E28742C6C297B652B3D27203C74723E5C6E20203C746420636C6173733D22742D52';
wwv_flow_api.g_varchar2_table(50) := '65706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443272B28613D3D743F222073656C6563746564223A2222292B27223E272B617065782E7574696C2E65736361706548544D4C41747472286C292B273C2F74643E';
wwv_flow_api.g_varchar2_table(51) := '20203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C272B28613D3D743F222073656C6563746564223A2222292B27223E202020203C696E70757420747970653D22746578';
wwv_flow_api.g_varchar2_table(52) := '742220636C6173733D22746578745F6669656C642220646174612D6C616E673D22272B6C2B27222076616C75653D22272B617065782E7574696C2E65736361706548544D4C41747472286E2E5F686173546167286C29292B27222073697A653D22272B6E';
wwv_flow_api.g_varchar2_table(53) := '2E5F76616C7565732E6669656C6453697A652B2722206D61786C656E6774683D22272B6E2E5F76616C7565732E6669656C644D61784C656E6774682B27223E3C2F74643E203C2F74723E5C6E277D292C652B3D223C2F7461626C653E5C6E222C743D273C';
wwv_flow_api.g_varchar2_table(54) := '64697620636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E20203C64697620636C6173733D226A746C6974656D2D627574746F6E2D63';
wwv_flow_api.g_varchar2_table(55) := '6F6E7461696E6572223E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E';
wwv_flow_api.g_varchar2_table(56) := '272B6E2E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E2B273C2F7370616E3E20202020203C2F627574746F6E3E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D';
wwv_flow_api.g_varchar2_table(57) := '427574746F6E20742D427574746F6E2D2D686F74223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B6E2E5F76616C7565732E6D657373616765732E6170706C794368616E6765732B273C2F7370616E3E';
wwv_flow_api.g_varchar2_table(58) := '202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D';
wwv_flow_api.g_varchar2_table(59) := '226A746C6974656D2D636F6E74656E74223E5C6E272B652B2220203C2F6469763E5C6E3C2F6469763E3C2F6469763E5C6E222C6E2E5F656C656D656E74732E24626F64792E617070656E642874292C6E2E5F696E6974456C656D656E747328292C6E2E5F';
wwv_flow_api.g_varchar2_table(60) := '656C656D656E74732E246469616C6F672E6469616C6F67287B636C6F73654F6E4573636170653A21302C7469746C653A6E2E6F7074696F6E732E6469616C6F675469746C652C6175746F526573697A653A21302C6D696E57696474683A3430302C6D696E';
wwv_flow_api.g_varchar2_table(61) := '4865696768743A3235302C77696474683A226175746F222C6865696768743A226175746F222C6D6F64616C3A21302C706F736974696F6E3A7B6D793A226C656674222C61743A226C6566742063656E746572222C6F663A6E2E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(62) := '646973706C6179496E7075745B305D7D2C6F70656E3A66756E6374696F6E28297B6E2E5F696E69744469616C6F67456C656D656E747328292C6E2E5F696E69744469616C6F67427574746F6E7328292C6E2E5F656C656D656E74732E246469616C6F6743';
wwv_flow_api.g_varchar2_table(63) := '6F6E74656E742E66696E642822696E70757422292E666972737428292E666F63757328297D2C636C6F73653A66756E6374696F6E28297B242874686973292E6469616C6F67282264657374726F7922292C6E2E5F656C656D656E74732E246469616C6F67';
wwv_flow_api.g_varchar2_table(64) := '2E72656D6F766528292C6E2E5F656C656D656E74732E24646F63756D656E742E66696E6428226469762E6A746C6974656D2D6469616C6F6722292E72656D6F766528292C22425554544F4E223D3D3D6E2E5F76616C7565732E666F6375734F6E436C6F73';
wwv_flow_api.g_varchar2_table(65) := '653F6E2E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293A22494E505554223D3D3D6E2E5F76616C7565732E666F6375734F6E436C6F736526266E2E5F656C656D656E74732E24646973706C6179496E7075742E666F6375732829';
wwv_flow_api.g_varchar2_table(66) := '2C6E2E5F76616C7565732E666F6375734F6E436C6F73653D22425554544F4E227D7D292E6F6E28226B6579646F776E222C66756E6374696F6E2865297B652E6B6579436F64653D3D3D242E75692E6B6579436F64652E45534341504526266E2E5F656C65';
wwv_flow_api.g_varchar2_table(67) := '6D656E74732E246469616C6F672E6469616C6F672822636C6F736522292C652E73746F7050726F7061676174696F6E28297D297D2C64697361626C653A66756E6374696F6E28297B76617220653D746869733B652E5F76616C7565732E64697361626C65';
wwv_flow_api.g_varchar2_table(68) := '643D3D3D2131262628652E5F656C656D656E74732E24646973706C6179496E7075742E61747472282264697361626C6564222C2264697361626C656422292C652E5F656C656D656E74732E2468696464656E496E7075742E61747472282264697361626C';
wwv_flow_api.g_varchar2_table(69) := '6564222C2264697361626C656422292C652E5F656C656D656E74732E246D6C73427574746F6E2E61747472282264697361626C6564222C2264697361626C656422292E756E62696E642822636C69636B222C652E5F68616E646C654F70656E436C69636B';
wwv_flow_api.g_varchar2_table(70) := '29292C652E5F76616C7565732E64697361626C65643D21307D2C656E61626C653A66756E6374696F6E28297B76617220653D746869733B652E5F76616C7565732E64697361626C65643D3D3D2130262628652E5F656C656D656E74732E24646973706C61';
wwv_flow_api.g_varchar2_table(71) := '79496E7075742E72656D6F766541747472282264697361626C656422292C652E5F656C656D656E74732E2468696464656E496E7075742E72656D6F766541747472282264697361626C656422292C652E5F656C656D656E74732E246D6C73427574746F6E';
wwv_flow_api.g_varchar2_table(72) := '2E72656D6F766541747472282264697361626C656422292E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C652E5F76616C7565732E64697361626C65643D2131297D7D293B0A2F2F2320736F7572';
wwv_flow_api.g_varchar2_table(73) := '63654D617070696E6755524C3D6A746C5F6974656D2E6D696E2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(47102272989358958)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_file_name=>'jtl_item.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076302E31202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572202E2E2E3A203F0A2A2F0A0A242E776964676574282022746B2E6A746C5F69';
wwv_flow_api.g_varchar2_table(2) := '74656D222C207B0A200A20202F2F2044656661756C74206F7074696F6E732E0A20206F7074696F6E733A207B0A20202020206C616E673A2022656E222C0A20202020206C616E675F636F6465733A205B22656E222C226672222C226573225D2C0A202020';
wwv_flow_api.g_varchar2_table(3) := '20206D657373616765733A206E756C6C2C0A20202020206669656C6453697A653A2033302C0A20202020206669656C644D61784C656E6774683A2038302C0A20202020206469616C6F675469746C653A206E756C6C0A20207D2C0A20205F637265617465';
wwv_flow_api.g_varchar2_table(4) := '5072697661746553746F726167653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F76616C756573203D207B0A2020202020202020617065784974656D49643A2027272C0A20202020';
wwv_flow_api.g_varchar2_table(5) := '20202020636F6E74726F6C7349643A2027272C0A20202020202020206669656C6453697A653A2033302C0A20202020202020206669656C644D61784C656E6774683A2038302C0A2020202020202020646174614A534F4E3A207B7D2C0A20202020202020';
wwv_flow_api.g_varchar2_table(6) := '20637572725F6C616E675F696E6465783A20302C0A20202020202020206C616E6775616765733A207B7D2C0A20202020202020207461674D61703A207B7D2C0A20202020202020206D657373616765733A20242E70617273654A534F4E287569772E6F70';
wwv_flow_api.g_varchar2_table(7) := '74696F6E732E6D65737361676573292C0A2020202020202020746F74616C4C616E6775616765733A20302C0A202020202020202064697361626C65643A2066616C73652C0A2020202020202020666F6375734F6E436C6F73653A2027425554544F4E272C';
wwv_flow_api.g_varchar2_table(8) := '202F2F425554544F4E206F7220494E5055542C0A20202020202020206E65775265636F72643A2066616C73652C0A20202020202020207369676E616C4368616E67653A2066616C73650A20202020207D3B0A0A20202020207569772E5F656C656D656E74';
wwv_flow_api.g_varchar2_table(9) := '73203D207B0A20202020202020202477696E646F773A207B7D2C0A202020202020202024646F63756D656E743A207B7D2C0A202020202020202024626F64793A207B7D2C0A20202020202020202468696464656E496E7075743A207B7D2C0A2020202020';
wwv_flow_api.g_varchar2_table(10) := '20202024646973706C6179496E7075743A207B7D2C0A2020202020202020246669656C647365743A207B7D2C0A2020202020202020246D6C73427574746F6E3A207B7D2C0A2020202020202020246469616C6F673A207B7D2C0A20202020202020202464';
wwv_flow_api.g_varchar2_table(11) := '69616C6F67436F6E74656E743A207B7D2C0A20202020202020202473617665427574746F6E3A207B7D2C0A20202020202020202463616E63656C427574746F6E3A207B7D2C0A202020202020202024627574746F6E436F6E7461696E65723A207B7D0A20';
wwv_flow_api.g_varchar2_table(12) := '202020207D3B0A20207D2C0A20205F6372656174653A2066756E6374696F6E2829207B0A2020202076617220756977203D20746869733B0A0A202020202F2F204F7074696F6E732061726520616C7265616479206D657267656420616E642073746F7265';
wwv_flow_api.g_varchar2_table(13) := '6420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73290A0A202020202F2F2068656C7065722066756E6374696F6E20666F722066696E64696E672074686520706F736974696F6E206F66206F75722063757272656E742064';
wwv_flow_api.g_varchar2_table(14) := '6973706C61796564206C616E67756167650A2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B0A2020202020207661722069203D206E756C6C2C0A20202020202020202020696478203D202D313B0A2020202020';
wwv_flow_api.g_varchar2_table(15) := '20666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B0A2020202020202020696620286A5B695D2E6C203D3D3D206C29207B0A20202020202020202020696478203D20693B0A202020';
wwv_flow_api.g_varchar2_table(16) := '20202020207D0A2020202020207D0A20202020202072657475726E206964783B0A202020207D0A0A202020207569772E5F6372656174655072697661746553746F7261676528293B0A202020207569772E5F76616C7565732E617065784974656D496420';
wwv_flow_api.g_varchar2_table(17) := '3D2024287569772E656C656D656E74292E617474722827696427293B0A202020207569772E5F76616C7565732E636F6E74726F6C734964203D207569772E5F76616C7565732E617065784974656D4964202B20275F6669656C64736574273B0A20202020';
wwv_flow_api.g_varchar2_table(18) := '7569772E5F696E6974456C656D656E747328293B0A202020207569772E5F696E697442617365456C656D656E747328293B0A0A202020207569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061727365287569772E6F7074696F6E';
wwv_flow_api.g_varchar2_table(19) := '732E6C616E675F636F646573293B0A202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B0A0A202020202F2F206765742074686520667265736820';
wwv_flow_api.g_varchar2_table(20) := '6C697374206F66206C616E6775616765730A202020207569772E5F696E6974446174614A534F4E28293B0A202020207569772E5F696E69744C616E67756167654D617028293B0A202020202F2F20576869636820706F736974696F6E206C616E67756167';
wwv_flow_api.g_varchar2_table(21) := '6520617265207765207573696E670A202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D206C616E67756167655F696E646578287569772E5F76616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C61';
wwv_flow_api.g_varchar2_table(22) := '6E67293B0A202020200A202020202F2F2053796E63206F75722068696464656E206669656C642077697468207468652061637475616C2076616C756520696E2074686520636F7272656374206C616E67756167652C206275740A202020202F2F20616C73';
wwv_flow_api.g_varchar2_table(23) := '6F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C7565200A202020207569772E5F656C656D656E74732E24646973706C6179496E7075740A2020202020';
wwv_flow_api.g_varchar2_table(24) := '20202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E6348696464656E4669656C64293B0A202020207569772E5F656C656D656E74732E24646F63756D656E740A202020202020202E62696E6428276170657862';
wwv_flow_api.g_varchar2_table(25) := '65666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E6348696464656E4669656C64293B0A0A202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202E62696E642827636C69';
wwv_flow_api.g_varchar2_table(26) := '636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A20202020617065782E64656275672E6D65737361676528342C225265676973746572696E67207769746820617065782E7769646765742E696E6974';
wwv_flow_api.g_varchar2_table(27) := '506167654974656D3A2022202B207569772E5F656C656D656E74732E24646973706C6179496E7075742E61747472282769642729293B0A0A20202020617065782E7769646765742E696E6974506167654974656D287569772E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(28) := '68696464656E496E7075742E617474722827696427292C207B0A2020202020202073657456616C75653A2066756E6374696F6E2876616C75652C20646973706C617956616C756529207B0A202020202020202020207569772E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(29) := '646973706C6179496E7075742E76616C28646973706C617956616C7565293B0A202020202020202020207569772E5F73796E6348696464656E4669656C6428293B0A202020202020207D2C0A2020202020202067657456616C75653A2066756E6374696F';
wwv_flow_api.g_varchar2_table(30) := '6E2829207B0A2020202020202020202072657475726E207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28293B0A202020202020207D2C0A20202020202020736574466F6375733A2066756E6374696F6E2829207B0A202020';
wwv_flow_api.g_varchar2_table(31) := '202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F63757328293B0A202020202020207D2C0A202020202020202F2F2073686F773A2066756E6374696F6E2829207B0A202020202020202F2F202020207569772E';
wwv_flow_api.g_varchar2_table(32) := '73686F7728293B0A202020202020202F2F207D2C0A202020202020202F2F20686964653A2066756E6374696F6E2829207B0A202020202020202F2F202020207569772E6869646528293B0A202020202020202F2F207D2C0A20202020202020656E61626C';
wwv_flow_api.g_varchar2_table(33) := '653A2066756E6374696F6E2829207B0A202020202020202020207569772E656E61626C6528293B0A202020202020207D2C0A2020202020202064697361626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E64697361626C65';
wwv_flow_api.g_varchar2_table(34) := '28293B0A202020202020207D0A202020207D293B0A0A20207D2C0A20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2477';
wwv_flow_api.g_varchar2_table(35) := '696E646F77203D20242877696E646F77293B0A20202020207569772E5F656C656D656E74732E24646F63756D656E74203D202428646F63756D656E74293B0A20202020207569772E5F656C656D656E74732E24626F6479203D202428646F63756D656E74';
wwv_flow_api.g_varchar2_table(36) := '2E626F6479293B0A20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B0A0A20207D2C0A20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E28';
wwv_flow_api.g_varchar2_table(37) := '29207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67203D202428276469762E6A746C6974656D2D6469616C6F6727293B0A20202020207569772E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(38) := '6469616C6F67436F6E74656E74203D202428276469762E6A746C6974656D2D636F6E74656E7427293B0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D20242827627574746F6E2E6A746C6974656D2D736176652D6275';
wwv_flow_api.g_varchar2_table(39) := '74746F6E27293B0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D20242827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B0A0A20207D2C0A20205F696E697442617365456C656D65';
wwv_flow_api.g_varchar2_table(40) := '6E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2468696464656E496E707574203D207569772E656C656D656E743B0A20202020207569772E5F656C65';
wwv_flow_api.g_varchar2_table(41) := '6D656E74732E24646973706C6179496E707574203D202428272327202B207569772E5F76616C7565732E617065784974656D4964202B20275F444953504C415927293B0A20202020207569772E5F76616C7565732E6669656C6453697A65203D20756977';
wwv_flow_api.g_varchar2_table(42) := '2E5F656C656D656E74732E24646973706C6179496E7075742E61747472282273697A6522293B0A20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F656C656D656E74732E24646973706C6179496E707574';
wwv_flow_api.g_varchar2_table(43) := '2E6174747228226D61786C656E67746822293B0A0A20202020207569772E5F656C656D656E74732E246669656C64736574203D202428272327202B207569772E5F76616C7565732E636F6E74726F6C734964293B0A20202020207569772E5F656C656D65';
wwv_flow_api.g_varchar2_table(44) := '6E74732E246D6C73427574746F6E203D0A20202020202020207569772E5F656C656D656E74732E246669656C647365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B0A20207D2C0A20205F696E697444617461';
wwv_flow_api.g_varchar2_table(45) := '4A534F4E3A2066756E6374696F6E28297B0A202020202076617220756977203D20746869732C0A2020202020202020206A736F6E44617461203D205B5D2C0A202020202020202020696E7075745F64617461203D207569772E5F656C656D656E74732E24';
wwv_flow_api.g_varchar2_table(46) := '68696464656E496E7075742E76616C28293B0A0A202020202069662028696E7075745F6461746129207B0A20202020202020207569772E5F76616C7565732E646174614A534F4E203D204A534F4E2E706172736528696E7075745F64617461293B0A2020';
wwv_flow_api.g_varchar2_table(47) := '2020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F20546865207265636F726420697320656D70747920736F207765206275696C642061';
wwv_flow_api.g_varchar2_table(48) := '200A20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A0A20202020202020202F2F20205B207B226C223A20227573222C2022746C223A202250726F6A65637420416E61';
wwv_flow_api.g_varchar2_table(49) := '6C79736973227D0A20202020202020202F2F20202C207B226C223A20226672222C2022746C223A2022416E616C7973652064652070726F6A6574227D0A20202020202020202F2F20202C207B226C223A20226573222C2022746C223A2022416E616C6973';
wwv_flow_api.g_varchar2_table(50) := '69732064652070726F6A6563746F227D5D0A20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E286C29207B0A20202020202020202020206A736F6E446174612E70757368287B226C223A';
wwv_flow_api.g_varchar2_table(51) := '206C2C2022746C223A2022227D293B0A20202020202020207D293B0A20202020202020202F2F20496E6974207468652068696464656E206974656D0A20202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A';
wwv_flow_api.g_varchar2_table(52) := '534F4E2E737472696E67696679286A736F6E4461746129293B0A20202020202020207569772E5F76616C7565732E646174614A534F4E203D206A736F6E446174613B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D2074';
wwv_flow_api.g_varchar2_table(53) := '7275653B0A20202020207D0A0A20207D2C0A20205F73796E6348696464656E4669656C643A2066756E6374696F6E286576656E744F626A29207B0A20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C0A20202020';
wwv_flow_api.g_varchar2_table(54) := '20766172207569772C0A2020202020202020206C616E674A534F4E203D207B7D2C0A2020202020202020206C616E675F696E6465783B0A0A202020202069662028747970656F66206576656E744F626A20213D2022756E646566696E65642229207B0A20';
wwv_flow_api.g_varchar2_table(55) := '202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E740A2020202020202020756977203D206576656E744F626A2E646174612E7569773B0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F20';
wwv_flow_api.g_varchar2_table(56) := '6469726563742063616C6C0A2020202020202020756977203D20746869733B0A20202020207D0A0A20202020206C616E675F696E646578203D207569772E5F76616C7565732E637572725F6C616E675F696E6465783B0A0A202020202069662028756977';
wwv_flow_api.g_varchar2_table(57) := '2E5F76616C7565732E6E65775265636F726429207B0A20202020202020202F2F207361766520746865206E6577207465787420696E746F2074686520414C4C20746865207265636F72647320696E20746865204A534F4E207374727563747572650A2020';
wwv_flow_api.g_varchar2_table(58) := '202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B0A202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E';
wwv_flow_api.g_varchar2_table(59) := '746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28293B0A20202020202020207D0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F207361766520746865206E6577207465787420696E';
wwv_flow_api.g_varchar2_table(60) := '746F20746865204A534F4E207374727563747572650A20202020202020207569772E5F76616C7565732E646174614A534F4E5B6C616E675F696E6465785D2E746C203D207569772E5F656C656D656E74732E24646973706C6179496E7075742E76616C28';
wwv_flow_api.g_varchar2_table(61) := '293B0A20202020207D0A20202020202F2F20706C616365207468652066756C6C204A534F4E206261636B20696E746F207468652068696464656E206974656D0A20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C28';
wwv_flow_api.g_varchar2_table(62) := '4A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E29293B0A20202020202F2F204B65657020746865206D617020667265736820286F6E6C79206E656564656420666F7220746865206469616C6F67290A2020202020';
wwv_flow_api.g_varchar2_table(63) := '7569772E5F696E69744C616E67756167654D617028293B0A20207D2C0A20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D';
wwv_flow_api.g_varchar2_table(64) := '656E74732E2463616E63656C427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C69636B293B0A0A20202020207569772E5F656C656D';
wwv_flow_api.g_varchar2_table(65) := '656E74732E2473617665427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69636B293B0A0A20207D2C0A20205F68616E646C6543616E63';
wwv_flow_api.g_varchar2_table(66) := '656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A20202020207569772E5F656C656D656E74732E246469616C6F672E646961';
wwv_flow_api.g_varchar2_table(67) := '6C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A20207D2C0A20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576';
wwv_flow_api.g_varchar2_table(68) := '656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569772C0A202020202020202020646973706C61795F76616C75653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E7465';
wwv_flow_api.g_varchar2_table(69) := '6E742E66696E642827696E70757427292E656163682866756E6374696F6E28692C656C297B0A2020202020202020617065782E64656275672E6D65737361676528342C69202B20222822202B20656C2E646174617365742E6C616E67202B2022293A2220';
wwv_flow_api.g_varchar2_table(70) := '2B20656C2E76616C7565293B0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E6C616E673B0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C';
wwv_flow_api.g_varchar2_table(71) := '203D20656C2E76616C75653B0A2020202020202020696620287569772E5F76616C7565732E637572725F6C616E675F696E646578203D3D206929207B0A2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B0A2020';
wwv_flow_api.g_varchar2_table(72) := '2020202020207D0A20202020207D293B0A0A20202020207569772E5F696E69744C616E67756167654D617028293B0A0A20202020202F2F2073796E6320746865206974656D7320616761696E0A20202020207569772E5F656C656D656E74732E24646973';
wwv_flow_api.g_varchar2_table(73) := '706C6179496E7075742E76616C28646973706C61795F76616C7565293B0A20202020207569772E5F656C656D656E74732E2468696464656E496E7075742E76616C284A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F';
wwv_flow_api.g_varchar2_table(74) := '4E29293B0A20202020202F2F207569772E5F7369676E616C4368616E676528293B20202F2F20646F657320746865202E76616C20747269676765722061206368616E676520616C72656164793F0A20202020207569772E5F76616C7565732E6E65775265';
wwv_flow_api.g_varchar2_table(75) := '636F7264203D2066616C73653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C';
wwv_flow_api.g_varchar2_table(76) := '6F670A20207D2C0A20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A202020202020202068696464656E456C6D74203D207569772E5F656C656D656E74732E246869646465';
wwv_flow_api.g_varchar2_table(77) := '6E496E7075745B305D2C20202F2F20446F20776520757365205B305D206F72206A7175657279206F626A6563743F0A2020202020202020646973706C6179456C6D74203D207569772E5F656C656D656E74732E24646973706C6179496E7075745B305D3B';
wwv_flow_api.g_varchar2_table(78) := '0A0A20202020202F2F4E65656420617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B0A2020202020617065782E6A51756572792868696464656E456C';
wwv_flow_api.g_varchar2_table(79) := '6D74292E7472696767657228276368616E676527293B0A2020202020617065782E6A517565727928646973706C6179456C6D74292E7472696767657228276368616E676527293B0A20207D2C0A20205F68616E646C654F70656E436C69636B3A2066756E';
wwv_flow_api.g_varchar2_table(80) := '6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A0A20202020207569772E5F73796E6348696464656E4669656C64286576656E744F626A293B0A20202020207569772E5F';
wwv_flow_api.g_varchar2_table(81) := '73686F774469616C6F6728293B0A20207D2C0A20205F696E69744C616E67756167654D61703A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A20202020202020202069203D206E756C6C2C0A2020202020202020';
wwv_flow_api.g_varchar2_table(82) := '2074616773203D207B7D3B0A0A202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B0A0A20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D736561';
wwv_flow_api.g_varchar2_table(83) := '7263682D612D6A736F6E2D61727261792F0A20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B0A2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(84) := '207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B0A20202020207D0A2020202020200A20207D2C0A20205F6861735461673A2066756E6374696F6E287461674E616D6529207B0A2020202020';
wwv_flow_api.g_varchar2_table(85) := '76617220756977203D20746869733B0A202020202072657475726E207569772E5F76616C7565732E7461674D61705B7461674E616D655D3B0A20207D2C0A20205F73686F774469616C6F673A2066756E6374696F6E2829207B0A20202020207661722075';
wwv_flow_api.g_varchar2_table(86) := '6977203D20746869732C0A2020202020202020206C616E675461626C652C0A202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F696E6465782C0A2020202020202020206469616C6F6748746D6C';
wwv_flow_api.g_varchar2_table(87) := '3B0A0A20202020206C616E675461626C65203D200A2020202020202020202020273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E27';
wwv_flow_api.g_varchar2_table(88) := '202B0A202020202020202020202027203C74723E5C6E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C48656164223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561';
wwv_flow_api.g_varchar2_table(89) := '67654C6162656C202B20273C2F74683E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167';
wwv_flow_api.g_varchar2_table(90) := '6556616C7565202B20273C2F74683E27202B0A202020202020202020202027203C2F74723E5C6E27202B0A202020202020202020202027203C74723E5C6E273B0A0A2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C';
wwv_flow_api.g_varchar2_table(91) := '2066756E6374696F6E2820696E6465782C206C616E672029207B0A202020202020206C616E675461626C65202B3D0A2020202020202027203C74723E5C6E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C';
wwv_flow_api.g_varchar2_table(92) := '20742D466F726D2D696E707574436F6E7461696E657220752D744327202B2028637572725F6C616E673D3D696E6465783F20272073656C6563746564273A272729202B2027223E27202B20617065782E7574696C2E65736361706548544D4C4174747228';
wwv_flow_api.g_varchar2_table(93) := '6C616E6729202B20273C2F74643E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C27202B2028637572725F6C616E673D3D696E646578';
wwv_flow_api.g_varchar2_table(94) := '3F20272073656C6563746564273A272729202B2027223E27202B200A2020202020202027202020203C696E70757420747970653D22746578742220636C6173733D22746578745F6669656C642220646174612D6C616E673D2227202B206C616E67202B20';
wwv_flow_api.g_varchar2_table(95) := '27222076616C75653D2227202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F686173546167286C616E672929202B2027222073697A653D2227202B207569772E5F76616C7565732E6669656C6453697A65202B20272220';
wwv_flow_api.g_varchar2_table(96) := '6D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B2027223E3C2F74643E27202B0A2020202020202027203C2F74723E5C6E273B0A20202020207D293B0A20202020206C616E675461626C65202B';
wwv_flow_api.g_varchar2_table(97) := '3D0A2020202020273C2F7461626C653E5C6E273B0A0A2020202020206469616C6F6748746D6C203D0A2020202020202020202020273C64697620636C6173733D226A746C6974656D2D6469616C6F67223E3C64697620636C6173733D226A746C6974656D';
wwv_flow_api.g_varchar2_table(98) := '2D636F6E7461696E65722075692D776964676574223E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E27202B0A2020202020202020202020272020';
wwv_flow_api.g_varchar2_table(99) := '2020203C627574746F6E20636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C';
wwv_flow_api.g_varchar2_table(100) := '223E27202B207569772E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B0A20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D2275692D69636F6E2075692D';
wwv_flow_api.g_varchar2_table(101) := '69636F6E2D636C6F7365223E3C2F7370616E3E27202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D2D73617665';
wwv_flow_api.g_varchar2_table(102) := '2D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F74223E27202B200A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C756573';
wwv_flow_api.g_varchar2_table(103) := '2E6D657373616765732E6170706C794368616E676573202B20273C2F7370616E3E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D63686563';
wwv_flow_api.g_varchar2_table(104) := '6B223E3C2F7370616E3E27202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A';
wwv_flow_api.g_varchar2_table(105) := '746C6974656D2D636F6E74656E74223E5C6E27202B0A20202020202020202020202020206C616E675461626C65202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A2020202020202020202020273C2F6469763E3C2F6469763E5C6E';
wwv_flow_api.g_varchar2_table(106) := '273B0A0A2020202020207569772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B0A0A2020202020207569772E5F696E6974456C656D656E747328293B0A0A20202020202F2F206F70656E206372656174656420';
wwv_flow_api.g_varchar2_table(107) := '6469762061732061206469616C6F670A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B0A202020202020202020636C6F73654F6E4573636170653A20747275652C0A2020202020202020207469746C653A202020';
wwv_flow_api.g_varchar2_table(108) := '2020202020207569772E6F7074696F6E732E6469616C6F675469746C652C0A2020202020202020206175746F526573697A653A20202020747275652C0A2020202020202020206D696E57696474683A2020202020203430302C0A2020202020202020206D';
wwv_flow_api.g_varchar2_table(109) := '696E4865696768743A20202020203235302C0A20202020202020202077696474683A202020202020202020276175746F272C0A2020202020202020206865696768743A2020202020202020276175746F272C0A2020202020202020206D6F64616C3A2020';
wwv_flow_api.g_varchar2_table(110) := '20202020202020747275652C0A202020202020202020706F736974696F6E3A2020202020207B206D793A20226C656674222C2061743A20226C6566742063656E746572222C206F663A207569772E5F656C656D656E74732E24646973706C6179496E7075';
wwv_flow_api.g_varchar2_table(111) := '745B305D207D2C0A2020202020202020206F70656E3A2066756E6374696F6E2829207B0A2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B0A2020202020202020202020207569772E5F696E69744469616C';
wwv_flow_api.g_varchar2_table(112) := '6F67427574746F6E7328293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E642827696E70757427292E666972737428292E666F63757328293B0A2020202020202020207D2C0A202020';
wwv_flow_api.g_varchar2_table(113) := '202020202020636C6F73653A2066756E6374696F6E2829207B0A0A202020202020202020202020242874686973292E6469616C6F67282764657374726F7927293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E';
wwv_flow_api.g_varchar2_table(114) := '72656D6F766528293B0A2020202020202020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E6428276469762E6A746C6974656D2D6469616C6F6727292E72656D6F766528293B0A0A20202020202020202020202069662028';
wwv_flow_api.g_varchar2_table(115) := '7569772E5F76616C7565732E666F6375734F6E436C6F7365203D3D3D2027425554544F4E2729207B0A2020202020202020202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E2E666F63757328293B0A20202020202020202020';
wwv_flow_api.g_varchar2_table(116) := '20207D20656C736520696620287569772E5F76616C7565732E666F6375734F6E436C6F7365203D3D3D2027494E5055542729207B0A2020202020202020202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E666F6375';
wwv_flow_api.g_varchar2_table(117) := '7328293B0A2020202020202020202020207D0A0A2020202020202020202020207569772E5F76616C7565732E666F6375734F6E436C6F7365203D2027425554544F4E273B0A2020202020202020207D0A202020202020207D290A202020202020202E6F6E';
wwv_flow_api.g_varchar2_table(118) := '28276B6579646F776E272C2066756E6374696F6E2865767429207B0A2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B0A202020202020202020202020202020756977';
wwv_flow_api.g_varchar2_table(119) := '2E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B0A20202020202020202020207D202020202020202020202020202020200A20202020202020202020206576742E73746F7050726F7061676174696F6E28293B0A20';
wwv_flow_api.g_varchar2_table(120) := '2020202020207D293B0A0A0A20207D2C0A202064697361626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C';
wwv_flow_api.g_varchar2_table(121) := '736529207B0A20202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075740A20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B0A20202020202020207569772E5F656C656D';
wwv_flow_api.g_varchar2_table(122) := '656E74732E2468696464656E496E7075742E61747472282764697361626C6564272C2764697361626C656427293B0A0A20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A20202020202020202020202E61747472282764';
wwv_flow_api.g_varchar2_table(123) := '697361626C6564272C2764697361626C656427290A20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B0A20202020207D0A0A20202020207569772E5F76616C7565732E646973';
wwv_flow_api.g_varchar2_table(124) := '61626C6564203D20747275653B0A20207D2C0A2020656E61626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D207472';
wwv_flow_api.g_varchar2_table(125) := '756529207B0A202020202020207569772E5F656C656D656E74732E24646973706C6179496E7075742E72656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E2468696464656E496E7075742E72';
wwv_flow_api.g_varchar2_table(126) := '656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202020202E72656D6F766541747472282764697361626C656427290A202020202020202020202E';
wwv_flow_api.g_varchar2_table(127) := '62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202020207569772E5F76616C7565732E64697361626C6564203D2066616C73653B0A20202020207D0A20207D0A7D29';
wwv_flow_api.g_varchar2_table(128) := '3B0A2F2F2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(47102698876360842)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_file_name=>'jtl_item.js'
,p_mime_type=>'application/javascript'
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
 p_id=>wwv_flow_api.id(47103104885362083)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_file_name=>'jtl_item.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
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
 p_id=>wwv_flow_api.id(47103510003362630)
,p_plugin_id=>wwv_flow_api.id(47042147073940200)
,p_file_name=>'jtl_item.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(7875211317085138)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_navigation_list_id=>wwv_flow_api.id(7832863836084958)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(7868873235085054)
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(7875132175085137)
,p_nav_bar_list_template_id=>wwv_flow_api.id(7865534696085051)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(7875211317085138)
,p_name=>'Home'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20161019132929'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7877087253085240)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7852358316085021)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(7876599058085224)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(7870511613085075)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7901844800092912)
,p_plug_name=>'Environment'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7849085884085019)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10832058580104201)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(7849085884085019)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This demo uses a single table with two columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13153139186473527)
,p_plug_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7849085884085019)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(7875211317085138)
,p_name=>'Projects'
,p_page_mode=>'NORMAL'
,p_step_title=>'Projects'
,p_step_sub_title=>'Projects'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20160925110204'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7877431572085255)
,p_plug_name=>'Projects'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7848555693085018)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select /* jorge */',
'''f?p=&APP_ID.:3:'' || :APP_SESSION  link,',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
'where lang = :BROWSER_LANGUAGE',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7877516194085257)
,p_name=>'Projects'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:3:#APP_SESSION#::::P3_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_internal_uid=>7877516194085257
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7877639161085266)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7877787256085271)
,p_db_column_name=>'NAME_JTL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name Jtl'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7877876993085271)
,p_db_column_name=>'ALIAS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Alias'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7877945149085271)
,p_db_column_name=>'ACTIVE_IND'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Active?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_help_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7878000870085271)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7878176866085272)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7878209287085272)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7878367758085272)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated On'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7900908118092903)
,p_db_column_name=>'NAME'
,p_display_order=>18
,p_column_identifier=>'K'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7901076135092904)
,p_db_column_name=>'LANG'
,p_display_order=>28
,p_column_identifier=>'L'
,p_column_label=>'Lang'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7901957678092913)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>38
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7902711185092921)
,p_db_column_name=>'LINK'
,p_display_order=>48
,p_column_identifier=>'N'
,p_column_label=>'Link'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7900180361089728)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'79002'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'NAME:DESCRIPTION:LANG:ALIAS:ACTIVE_IND::LINK'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7878551374085274)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7852358316085021)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(7876599058085224)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(7870511613085075)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7881373230085395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7877431572085255)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:3'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(7875211317085138)
,p_name=>'Maintain Project'
,p_page_mode=>'NORMAL'
,p_step_title=>'Maintain Project'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_file_urls=>'https://dl.dropboxusercontent.com/u/82641814/dist/js/oos_item_json_mls.js'
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_page_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'For developement:',
'https://dl.dropboxusercontent.com/u/82641814/dist/js/oos_item_json_mls.js',
'https://dl.dropboxusercontent.com/u/82641814/dist/css/oos_item_json_mls.css'))
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20170212165238'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7878969186085350)
,p_plug_name=>'Maintain Project'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(7849085884085019)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7901121793092905)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_api.id(7878969186085350)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(7846208252085017)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P3_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7881591528085397)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7852358316085021)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(7876599058085224)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(7870511613085075)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7879036717085350)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7879235516085350)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(7870175529085067)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7879318550085350)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7879175259085350)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7902182938092915)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'DISABLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_image_alt=>'Disable Name'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7902449360092918)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7878969186085350)
,p_button_name=>'ENABLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_image_alt=>'Enable Name'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7879586882085354)
,p_branch_action=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7879690407085355)
,p_name=>'P3_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7878969186085350)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7879720848085356)
,p_name=>'P3_NAME_JTL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7878969186085350)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>60
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_attribute_02=>'return true;'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7879908955085386)
,p_name=>'P3_ALIAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7878969186085350)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alias'
,p_source=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7880147142085386)
,p_name=>'P3_ACTIVE_IND'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7878969186085350)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicates if the record is active or inactive.'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7880327795085387)
,p_name=>'P3_CREATED_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7901121793092905)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7880569037085387)
,p_name=>'P3_CREATED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7901121793092905)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7880739727085387)
,p_name=>'P3_UPDATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7901121793092905)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7880955837085387)
,p_name=>'P3_UPDATED_ON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7901121793092905)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7902018207092914)
,p_name=>'P3_DESCRIPTION_JTL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7878969186085350)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>80
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_attribute_02=>'return true;'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13150904191473505)
,p_validation_name=>'P3_NAME_JTL is not null'
,p_validation_sequence=>10
,p_validation=>'tk_jtl_plugin.get_tl(:P3_NAME_JTL, :BROWSER_LANGUAGE) is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'The name is required'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(7879720848085356)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7902295544092916)
,p_name=>'Disable Button'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7902182938092915)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7902327483092917)
,p_event_id=>wwv_flow_api.id(7902295544092916)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7902542488092919)
,p_name=>'Enable Name'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7902449360092918)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7902616998092920)
,p_event_id=>wwv_flow_api.id(7902542488092919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7881104910085390)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PX_PROJECTS'
,p_attribute_02=>'PX_PROJECTS2'
,p_attribute_03=>'P3_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7881276861085390)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PX_PROJECTS2'
,p_attribute_02=>'PX_PROJECTS2'
,p_attribute_03=>'P3_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(7875211317085138)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Translation Demo - Log In'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.t-Login-logo.fa.appIcon {',
'font-size: 50px;',
'}',
'.appIcon {',
'-webkit-border-radius: 4px;',
'-moz-border-radius: 4px;',
'border-radius: 4px;',
'-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'-moz-box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'}',
''))
,p_step_template=>wwv_flow_api.id(7834842651084987)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20170212162048'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7875749274085200)
,p_plug_name=>'JTL Item Plugin Demo'
,p_icon_css_classes=>'appIcon fa-globe'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7848854893085019)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7876071365085218)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7875749274085200)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(7870038157085067)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7875893220085211)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7875749274085200)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(7869476356085057)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7875984057085217)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7875749274085200)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(7869476356085057)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7876227489085223)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7876173446085220)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7876472305085223)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7876393177085223)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/pages/page_00500
begin
wwv_flow_api.create_page(
 p_id=>500
,p_user_interface_id=>wwv_flow_api.id(7875211317085138)
,p_name=>'Switch Language'
,p_page_mode=>'NORMAL'
,p_step_title=>'Switch Language'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20160920183047'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7901596769092909)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(7849085884085019)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7901773382092911)
,p_branch_name=>'Return to page'
,p_branch_action=>'f?p=&APP_ID.:&P500_LAST_PAGE.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7901667549092910)
,p_name=>'P500_LAST_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7901596769092909)
,p_prompt=>'Last page'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(7869530099085060)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7901428573092908)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Switch Language'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.set_session_lang(:G_LANG);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(10290124517126729)
,p_deinstall_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'drop view px_projects2_vl;',
'drop table px_projects2;',
''))
);
end;
/
prompt --application/deployment/install
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(10300239352133674)
,p_install_id=>wwv_flow_api.id(10290124517126729)
,p_name=>'All Objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create table px_projects2 (',
'    id            number        generated by default on null as identity (start with 1) primary key not null',
'  , name_jtl      varchar2(500)   not null constraint px_projects2_name_tl_ck CHECK (name_jtl is json(strict))',
'  , description_jtl varchar2(500) not null constraint px_projects2_desc_tl_ck CHECK (description_jtl is json(strict))',
'  , alias         varchar2(32)',
'  , active_ind    varchar2(1)   not null',
'  , created_by    varchar2(60) default ',
'                    coalesce(',
'                        sys_context(''APEX$SESSION'',''app_user'')',
'                      , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')',
'                      , sys_context(''userenv'',''session_user'')',
'                    )',
'                    not null',
'  , created_on    date         default sysdate not null',
'  , updated_by    varchar2(60)',
'  , updated_on    date',
'  , constraint px_projects2_ck_active check (active_ind in (''Y'', ''N''))',
')',
'enable primary key using index',
'/',
'',
'comment on column px_projects2.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'comment on column px_projects2.description_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'',
'create or replace trigger px_projects2_u',
'before update',
'on px_projects2',
'referencing old as old new as new',
'for each row',
'begin',
'  :new.updated_on := sysdate;',
'  :new.updated_by := coalesce(',
'                         sys_context(''APEX$SESSION'',''app_user'')',
'                       , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')',
'                       , sys_context(''userenv'',''session_user'')',
'                     );',
'end;',
'/',
'',
'insert into PX_PROJECTS2 (NAME_JTL,DESCRIPTION_JTL,ALIAS,ACTIVE_IND) values (''[{"l":"en","tl":"Name 1 - English"},{"l":"fr","tl":"Nom 1 - Français"},{"l":"es","tl":"Nombre 1 - Español"}]'',''[{"l":"en","tl":"Desc 1 - English"},{"l":"fr","tl":"Desc 1 - '
||'Français"},{"l":"es","tl":"Desc 1 - Español"}]'',''Nom 1'',''Y'');',
'insert into PX_PROJECTS2 (NAME_JTL,DESCRIPTION_JTL,ALIAS,ACTIVE_IND) values (''[{"l":"en","tl":"Nom 2- English"},{"l":"fr","tl":"Nom 2 - Français"},{"l":"es","tl":"Nom 2 - Español"}]'',''[{"l":"en","tl":"Desc 2 - English"},{"l":"fr","tl":"Desc 2 - Franç'
||'ais"},{"l":"es","tl":"Desc 2 - Español"}]'',''Nom 2'',''Y'');',
'',
'create or replace view px_projects2_vl',
'as',
'with n_tl as (',
'  select /*+ no_merge */ p.id',
'       , t.lang',
'       , t.tl',
'    from px_projects2 p',
'       , xmltable(''/json/row'' passing apex_json.to_xmltype(p.name_jtl)',
'          columns',
'               lang  varchar2(10 char) path ''l''',
'             , tl    varchar2(50 char) path ''tl''',
'        ) t',
'),',
'd_tl as (',
'  select /*+ no_merge */ p.id',
'       , t.lang',
'       , t.tl',
'    from px_projects2 p',
'       , json_table(p.description_jtl, ''$[*]''',
'          columns (',
'                   lang varchar2(10) path ''$.l''',
'                 , tl   varchar2(1000 char) path ''$.tl''',
'                  )',
'        ) t',
')',
'select p.id',
'     , p.name_jtl',
'     , p.description_jtl',
'     , n_tl.lang',
'     , n_tl.tl   name',
'     , d_tl.tl   description',
'     , p.alias',
'     , p.active_ind',
'     , p.created_by',
'     , p.created_on',
'     , p.updated_by',
'     , p.updated_on',
'  from px_projects2 p',
'     , n_tl',
'     , d_tl',
' where p.id = n_tl.id',
'   and p.id = d_tl.id',
'   and n_tl.lang = d_tl.lang',
'   and n_tl.lang = (select nvl(apex_util.get_session_lang,''en'') from dual)',
'/',
''))
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
