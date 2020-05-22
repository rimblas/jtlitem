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
 
prompt APPLICATION 107 - JTL Item Translation Demo
--
-- Application Export:
--   Application:     107
--   Name:            JTL Item Translation Demo
--   Date and Time:   21:33 Thursday May 21, 2020
--   Exported By:     JMR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218264457696061
--

-- Application Statistics:
--   Pages:                      7
--     Items:                   20
--     Validations:              1
--     Processes:               10
--     Regions:                 16
--     Buttons:                 13
--     Dynamic Actions:          2
--   Shared Components:
--     Logic:
--       Items:                  2
--       Processes:              1
--       Build Options:          1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              5
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
--     Install scripts:          2

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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,107)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'JMR')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'JTL Item Translation Demo')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_102107')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'C34545BD59D4D04C0A37C3A9864990179C78735EFCA848CFF2CAFE2F36B9E9FF'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en-ca'
,p_flow_language_derived_from=>'SESSION'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(472602324063671634)
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
,p_substitution_string_01=>'EDIT_BUTTON'
,p_substitution_value_01=>'<i class="fa fa-pencil-square-o fa-2x"></i>'
,p_last_updated_by=>'JORGE@RIMBLAS.COM'
,p_last_upd_yyyymmddhh24miss=>'20200521210341'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(472559769733671416)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(472603508402671690)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(472604039114671698)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:'
,p_parent_list_item_id=>wwv_flow_api.id(472603508402671690)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(464942753404022548)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'JTL with CLOB'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(472603508402671690)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,5'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(472602038072671595)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(473447205409503604)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Languages (&G_LANG.)'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-globe'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(473447487652507351)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'English'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,en-ca:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'en'
,p_parent_list_item_id=>wwv_flow_api.id(473447205409503604)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(473448187206514366)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Français'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,fr:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'fr'
,p_parent_list_item_id=>wwv_flow_api.id(473447205409503604)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(473457367415516815)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Español'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,es:'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'es'
,p_parent_list_item_id=>wwv_flow_api.id(473447205409503604)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(472602289578671627)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21065537988938490)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21065693963938491)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'classic'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(21065903282938492)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'LEGACY'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(472559442796671414)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(472559522054671416)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(472559696597671416)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SELECT_LIST'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(488298886190329126)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_JMR.MLS.JTLITEM'
,p_attribute_01=>'return ''["en-ca","fr","es"]'';'
,p_attribute_02=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(473397497762306426)
,p_process_sequence=>-999
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'APEX Nitro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- apex_application.g_flow_images := owa_util.get_cgi_env(''APEX-Nitro'');',
':G_APEX_NITRO_IMAGES := owa_util.get_cgi_env(''APEX-Nitro'');'))
,p_process_when=>'owa_util.get_cgi_env(''APEX-Nitro'') is not null'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_required_patch=>wwv_flow_api.id(473397180128302174)
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(473417373021410649)
,p_name=>'G_APEX_NITRO_IMAGES'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(473347919497670923)
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
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(472603504955671682)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(464947770928022615)
,p_parent_id=>wwv_flow_api.id(472603858759671693)
,p_short_name=>'JTL with CLOB'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(464948928223022627)
,p_parent_id=>wwv_flow_api.id(464947770928022615)
,p_short_name=>'Maintain JTL with CLOB'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(472603858759671693)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(472605336928671732)
,p_parent_id=>wwv_flow_api.id(472603858759671693)
,p_option_sequence=>20
,p_short_name=>'Projects'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(472608363762671855)
,p_parent_id=>wwv_flow_api.id(472605336928671732)
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
 p_id=>wwv_flow_api.id(472559861602671427)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472559962441671436)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560007149671436)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560180630671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560279415671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560358766671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560437295671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560542186671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560702337671437)
,p_page_template_id=>wwv_flow_api.id(472559861602671427)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472560733339671444)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472560814644671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472560966753671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561071058671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561183929671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561305854671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561312189671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561502040671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561584284671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561623987671445)
,p_page_template_id=>wwv_flow_api.id(472560733339671444)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472561748548671445)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472561902457671445)
,p_page_template_id=>wwv_flow_api.id(472561748548671445)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472561975781671446)
,p_page_template_id=>wwv_flow_api.id(472561748548671445)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472562081289671446)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472562156538671446)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562305141671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562348577671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562502051671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562520495671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562651671671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562792484671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562844099671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472562956036671447)
,p_page_template_id=>wwv_flow_api.id(472562081289671446)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472563064753671447)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472563201145671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563252451671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563388790671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563432447671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563510380671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563699808671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472563751827671447)
,p_page_template_id=>wwv_flow_api.id(472563064753671447)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472563821548671447)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472563935186671448)
,p_page_template_id=>wwv_flow_api.id(472563821548671447)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564055023671448)
,p_page_template_id=>wwv_flow_api.id(472563821548671447)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564144596671448)
,p_page_template_id=>wwv_flow_api.id(472563821548671447)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472564273161671448)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472564371828671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564425452671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564585613671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564704744671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564735429671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564855497671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472564929518671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565088967671448)
,p_page_template_id=>wwv_flow_api.id(472564273161671448)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472565158364671448)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472565252598671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565348997671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565455420671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565604988671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565637277671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565796060671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472565865871671449)
,p_page_template_id=>wwv_flow_api.id(472565158364671448)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(472565933349671449)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472566020871671449)
,p_page_template_id=>wwv_flow_api.id(472565933349671449)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472566130022671449)
,p_page_template_id=>wwv_flow_api.id(472565933349671449)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(472566260321671449)
,p_page_template_id=>wwv_flow_api.id(472565933349671449)
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
 p_id=>wwv_flow_api.id(472596829539671521)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
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
 p_id=>wwv_flow_api.id(472596944054671525)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(472597081426671525)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
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
 p_id=>wwv_flow_api.id(472566378998671452)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'ALERT'
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
 p_id=>wwv_flow_api.id(472566468148671458)
,p_plug_template_id=>wwv_flow_api.id(472566378998671452)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472567816637671470)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472568000962671470)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
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
 p_id=>wwv_flow_api.id(472568071530671471)
,p_plug_template_id=>wwv_flow_api.id(472568000962671470)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472568193465671471)
,p_plug_template_id=>wwv_flow_api.id(472568000962671470)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472571448893671474)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'INLINE_DIALOG'
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
 p_id=>wwv_flow_api.id(472571530250671474)
,p_plug_template_id=>wwv_flow_api.id(472571448893671474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472572377846671474)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'BUTTONS_CONTAINER'
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
 p_id=>wwv_flow_api.id(472572489749671474)
,p_plug_template_id=>wwv_flow_api.id(472572377846671474)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472572525482671474)
,p_plug_template_id=>wwv_flow_api.id(472572377846671474)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472573114149671475)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'COLLAPSIBLE'
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
 p_id=>wwv_flow_api.id(472573303038671475)
,p_plug_template_id=>wwv_flow_api.id(472573114149671475)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472573392700671475)
,p_plug_template_id=>wwv_flow_api.id(472573114149671475)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472575298258671476)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472575375864671476)
,p_plug_template_id=>wwv_flow_api.id(472575298258671476)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472575461590671476)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472575760790671477)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472575818210671477)
,p_plug_template_id=>wwv_flow_api.id(472575760790671477)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472575991781671477)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'STANDARD'
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
 p_id=>wwv_flow_api.id(472576078899671477)
,p_plug_template_id=>wwv_flow_api.id(472575991781671477)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472576197082671477)
,p_plug_template_id=>wwv_flow_api.id(472575991781671477)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472578088304671478)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472578135969671478)
,p_plug_template_id=>wwv_flow_api.id(472578088304671478)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472578223177671479)
,p_plug_template_id=>wwv_flow_api.id(472578088304671478)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(472579264213671479)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'TITLE_BAR'
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
 p_id=>wwv_flow_api.id(472579796696671479)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(472579887516671479)
,p_plug_template_id=>wwv_flow_api.id(472579796696671479)
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
 p_id=>wwv_flow_api.id(472588120763671501)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
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
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(472589859924671507)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'CARDS'
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
 p_id=>wwv_flow_api.id(472591960922671508)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472592440593671509)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472592511965671510)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(472593439878671510)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(472593951819671511)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
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
 p_id=>wwv_flow_api.id(472594719872671511)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472594811894671512)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_internal_name=>'MEDIA_LIST'
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
 p_id=>wwv_flow_api.id(472595779132671512)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472595896983671513)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472580315840671481)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(472580483153671486)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472582149739671487)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472584303651671491)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472584676059671491)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472584723957671492)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472584723957671492)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(472586052580671493)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472587058990671494)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472587967941671494)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472596382253671515)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472596435996671518)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472596542045671518)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472596687693671518)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472596797279671518)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472597417510671533)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
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
 p_id=>wwv_flow_api.id(472597630909671543)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472597556595671537)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_cust_weekend_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_api.id(472598037074671562)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(472565158364671448)
,p_default_dialog_template=>wwv_flow_api.id(472563821548671447)
,p_error_template=>wwv_flow_api.id(472561748548671445)
,p_printer_friendly_template=>wwv_flow_api.id(472565158364671448)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(472561748548671445)
,p_default_button_template=>wwv_flow_api.id(472596944054671525)
,p_default_region_template=>wwv_flow_api.id(472575991781671477)
,p_default_chart_template=>wwv_flow_api.id(472575991781671477)
,p_default_form_template=>wwv_flow_api.id(472575991781671477)
,p_default_reportr_template=>wwv_flow_api.id(472575991781671477)
,p_default_tabform_template=>wwv_flow_api.id(472575991781671477)
,p_default_wizard_template=>wwv_flow_api.id(472575991781671477)
,p_default_menur_template=>wwv_flow_api.id(472579264213671479)
,p_default_listr_template=>wwv_flow_api.id(472575991781671477)
,p_default_irr_template=>wwv_flow_api.id(472575461590671476)
,p_default_report_template=>wwv_flow_api.id(472584723957671492)
,p_default_label_template=>wwv_flow_api.id(472596435996671518)
,p_default_menu_template=>wwv_flow_api.id(472597417510671533)
,p_default_calendar_template=>wwv_flow_api.id(472597556595671537)
,p_default_list_template=>wwv_flow_api.id(472593951819671511)
,p_default_nav_list_template=>wwv_flow_api.id(472595896983671513)
,p_default_top_nav_list_temp=>wwv_flow_api.id(472595896983671513)
,p_default_side_nav_list_temp=>wwv_flow_api.id(472595779132671512)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(472572377846671474)
,p_default_dialogr_template=>wwv_flow_api.id(472567816637671470)
,p_default_option_label=>wwv_flow_api.id(472596435996671518)
,p_default_required_label=>wwv_flow_api.id(472596687693671518)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(472592440593671509)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>62
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#HAMMERJS_URL#',
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
 p_id=>wwv_flow_api.id(472597745711671548)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(472597810661671549)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(472597945472671549)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>true
,p_is_public=>false
,p_is_accessible=>false
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
 p_id=>wwv_flow_api.id(472566682093671468)
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
 p_id=>wwv_flow_api.id(472566865648671469)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472567191022671470)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472568207513671471)
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
 p_id=>wwv_flow_api.id(472568737150671472)
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
 p_id=>wwv_flow_api.id(472569419069671472)
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
 p_id=>wwv_flow_api.id(472570007023671473)
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
 p_id=>wwv_flow_api.id(472570371213671473)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472570595495671473)
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
 p_id=>wwv_flow_api.id(472570759813671473)
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
 p_id=>wwv_flow_api.id(472571703231671474)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472572761733671475)
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
 p_id=>wwv_flow_api.id(472573848022671475)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472578426026671479)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472578702957671479)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472578838740671479)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472579418317671479)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472579954448671480)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472580576955671486)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472581385027671487)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472582551815671488)
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
 p_id=>wwv_flow_api.id(472582782621671488)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472583155362671489)
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
 p_id=>wwv_flow_api.id(472583556542671489)
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
 p_id=>wwv_flow_api.id(472584401759671491)
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
 p_id=>wwv_flow_api.id(472584806043671492)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472585101178671492)
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
 p_id=>wwv_flow_api.id(472585430628671493)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472586173990671493)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472588282622671505)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472588431911671506)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472590287955671507)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472590474761671507)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472590843978671507)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472591288658671508)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472592996272671510)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472593540564671511)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472594498304671511)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472597132847671526)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472598174652671590)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(472598361686671591)
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
 p_id=>wwv_flow_api.id(472598576641671591)
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
 p_id=>wwv_flow_api.id(472598733758671591)
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
 p_id=>wwv_flow_api.id(472598908316671591)
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
 p_id=>wwv_flow_api.id(472599321638671591)
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
 p_id=>wwv_flow_api.id(472600059896671592)
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
 p_id=>wwv_flow_api.id(472600448083671592)
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
 p_id=>wwv_flow_api.id(472600692001671592)
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
 p_id=>wwv_flow_api.id(472600882278671593)
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
 p_id=>wwv_flow_api.id(472601099669671593)
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
 p_id=>wwv_flow_api.id(472601357572671593)
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
 p_id=>wwv_flow_api.id(472601666375671593)
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
 p_id=>wwv_flow_api.id(472566565579671462)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472566714631671469)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(472566682093671468)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472566956102671469)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(472566865648671469)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567100589671469)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(472566682093671468)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567226391671470)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(472567191022671470)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567363758671470)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(472566865648671469)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567458015671470)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(472566682093671468)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567552181671470)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(472566865648671469)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567702606671470)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(472566865648671469)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472567716506671470)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472566378998671452)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(472567191022671470)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568400743671471)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568437530671471)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568596888671471)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568652817671471)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568861346671472)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(472568737150671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472568978550671472)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(472568737150671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569094035671472)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(472568737150671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569142844671472)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(472568737150671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569236371671472)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569404704671472)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569545395671472)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569658295671472)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569801036671472)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569854086671473)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472569991799671473)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570164166671473)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(472570007023671473)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570287935671473)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(472570007023671473)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570449893671473)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570662027671473)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(472570595495671473)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570853772671473)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472570934618671473)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571056276671473)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(472570595495671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571149655671473)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571221517671474)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571309566671474)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472568000962671470)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571745006671474)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(472571703231671474)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571835888671474)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(472571703231671474)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472571925902671474)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(472571703231671474)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572104104671474)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572125324671474)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572209253671474)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472571448893671474)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572615978671474)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(472572377846671474)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572890900671475)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(472572377846671474)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(472572761733671475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472572932165671475)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(472572377846671474)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573030985671475)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(472572377846671474)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(472572761733671475)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573406848671475)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573561873671475)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573636569671475)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573724507671475)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472573992933671475)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(472573848022671475)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574088638671475)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(472573848022671475)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574159861671476)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574217388671476)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574404228671476)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574436942671476)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574528977671476)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574611984671476)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574773436671476)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574857551671476)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472574990024671476)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472575015083671476)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472575202954671476)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472573114149671475)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472575531120671477)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575461590671476)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472575645720671477)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575461590671476)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576254715671477)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576371622671477)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576477173671477)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576597043671477)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(472568207513671471)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576614980671477)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576745614671477)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576825208671477)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472576994026671478)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577042690671478)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577200947671478)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(472569419069671472)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577257929671478)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577319556671478)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(472570595495671473)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577484717671478)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577567749671478)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577699019671478)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577714805671478)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(472570595495671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577839913671478)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(472570371213671473)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472577907014671478)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472575991781671477)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(472570759813671473)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472578384493671479)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472578540315671479)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(472578426026671479)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472578751275671479)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(472578702957671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472578973262671479)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(472578838740671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472579054909671479)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(472578838740671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472579117862671479)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472578088304671478)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(472578702957671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472579323858671479)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(472579264213671479)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472579562397671479)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(472579264213671479)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(472579418317671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472579669959671479)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(472579264213671479)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(472579418317671479)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580075677671480)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(472579796696671479)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(472579954448671480)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580146150671480)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472579796696671479)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(472579954448671480)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580280300671480)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(472579796696671479)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580621118671486)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580706675671486)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580873106671486)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472580921715671486)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581076778671486)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581151891671487)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581232461671487)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581458135671487)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(472581385027671487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581599634671487)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(472581385027671487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581646051671487)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581787211671487)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(472581385027671487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581877918671487)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472581919461671487)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(472581385027671487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582023718671487)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472580483153671486)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(472581385027671487)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582256164671488)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582332584671488)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582492119671488)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582607888671488)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(472582551815671488)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472582898590671488)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(472582782621671488)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583003372671489)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583018424671489)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(472582551815671488)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583213662671489)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(472583155362671489)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583332417671489)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(472583155362671489)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583447484671489)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(472583155362671489)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583662357671489)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(472583556542671489)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583751014671489)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(472583556542671489)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583816801671489)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(472582551815671488)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472583981267671489)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472584097764671489)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(472583155362671489)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472584184930671491)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(472582149739671487)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472584440424671491)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472584303651671491)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(472584401759671491)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472584592276671491)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472584303651671491)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(472584401759671491)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472584920985671492)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(472584806043671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585137812671492)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(472585101178671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585269590671492)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(472585101178671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585355618671492)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(472585101178671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585560417671493)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(472585430628671493)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585671231671493)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(472585430628671493)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585772299671493)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(472584806043671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585889630671493)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472585907697671493)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472584723957671492)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(472585101178671492)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586222404671493)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586373135671493)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586443382671493)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586584046671493)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586615887671493)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586721016671493)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586815892671493)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472586979872671494)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(472586052580671493)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587108690671494)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587287835671494)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587390459671494)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587497579671494)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587575302671494)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(472580576955671486)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587663510671494)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587773241671494)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472587835972671494)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(472587058990671494)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(472586173990671493)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588095875671494)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(472587967941671494)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(472582551815671488)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588350409671506)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(472588282622671505)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588506201671506)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588661751671506)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588764238671506)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588900101671506)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472588909429671506)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589100178671506)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589146959671506)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589245714671506)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(472588282622671505)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589321367671506)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(472588282622671505)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589495161671506)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589580218671506)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(472588282622671505)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589624132671506)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589765862671507)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(472588120763671501)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(472588282622671505)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472589958414671507)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590081586671507)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590172185671507)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590320004671507)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590544957671507)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(472590474761671507)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590674190671507)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590740133671507)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472590933893671507)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(472590843978671507)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591090786671507)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(472590843978671507)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591133793671508)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(472590843978671507)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591345534671508)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(472591288658671508)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591415741671508)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(472591288658671508)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591520513671508)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591670310671508)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591794297671508)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(472590843978671507)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472591865510671508)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(472589859924671507)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592079834671509)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(472591960922671508)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592142822671509)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472591960922671508)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592284337671509)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472591960922671508)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592306581671509)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472591960922671508)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592617958671510)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592724707671510)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(472591288658671508)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472592902589671510)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(472591288658671508)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593011319671510)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(472592996272671510)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593117713671510)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593296408671510)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593358863671510)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(472592511965671510)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(472592996272671510)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593702260671511)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472593439878671510)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(472593540564671511)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593723857671511)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472593439878671510)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(472593540564671511)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472593876284671511)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472593439878671510)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(472593540564671511)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594023471671511)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(472590287955671507)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594174031671511)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594282380671511)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594353319671511)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594530664671511)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(472594498304671511)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594670706671511)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472593951819671511)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(472594498304671511)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472594989048671512)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595025585671512)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595142040671512)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595284123671512)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595390162671512)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(472588431911671506)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595411921671512)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595530906671512)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595640568671512)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(472594811894671512)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472595992330671513)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(472595896983671513)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472596060298671513)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(472595896983671513)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472596138546671513)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(472595896983671513)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472596226736671513)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(472595896983671513)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472597239042671526)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(472597132847671526)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472597375579671527)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(472597132847671526)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472598217330671591)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(472598174652671590)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472598489585671591)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(472598361686671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472598631384671591)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(472598576641671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472598884412671591)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(472598733758671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599089022671591)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(472598908316671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599205405671591)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(472598361686671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599276325671591)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(472598576641671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599435463671591)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(472599321638671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599590657671592)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(472599321638671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599665847671592)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(472599321638671591)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599766967671592)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(472598174652671590)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599842130671592)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(472598908316671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472599980040671592)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(472598733758671591)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600194013671592)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(472600059896671592)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600273354671592)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(472598174652671590)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600385583671592)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(472598174652671590)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600578696671592)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(472600448083671592)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600737848671593)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(472600692001671592)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472600958374671593)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(472600882278671593)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601137012671593)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(472601099669671593)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601282248671593)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(472601099669671593)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601438559671593)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(472601357572671593)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601555660671593)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(472600692001671592)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601718843671593)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(472601666375671593)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601823616671593)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(472601959007671593)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(472601666375671593)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(473397180128302174)
,p_build_option_name=>'DEV_ONLY'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/language
begin
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(472997439675533264)
,p_translation_flow_id=>109
,p_translation_flow_language_cd=>'fr'
,p_direction_right_to_left=>'N'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(473657158819702785)
,p_translation_flow_id=>111
,p_translation_flow_language_cd=>'es'
,p_direction_right_to_left=>'N'
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
 p_id=>wwv_flow_api.id(472606330733671810)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(472602324063671634)
,p_name=>'APEX'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
prompt --application/shared_components/plugins/item_type/jmr_mls_jtlitem
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1032002593386927165)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'JMR.MLS.JTLITEM'
,p_display_name=>'JTL Item'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','JMR.MLS.JTLITEM'),'&G_APEX_NITRO_IMAGES.')
,p_javascript_file_urls=>'#PLUGIN_FILES#www/dist/js/jtl_item#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#www/dist/css/jtl_item#MIN#.css'
,p_api_version=>1
,p_render_function=>'tk_jtl_plugin.render'
,p_validation_function=>'tk_jtl_plugin.validate'
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
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(472602117214671596)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_navigation_list_id=>wwv_flow_api.id(472559769733671416)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(472595779132671512)
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(472602038072671595)
,p_nav_bar_list_template_id=>wwv_flow_api.id(472592440593671509)
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
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Home'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
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
 p_id=>wwv_flow_api.id(472603993150671698)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472579264213671479)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(472603504955671682)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(472597417510671533)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472628750697679370)
,p_plug_name=>'Environment'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(475558964477690659)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(477880045084059985)
,p_plug_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Projects'
,p_page_mode=>'NORMAL'
,p_step_title=>'Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Projects'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20180201215520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472604337469671713)
,p_plug_name=>'Projects'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472575461590671476)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
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
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(472604422091671715)
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
,p_detail_link_text=>'&EDIT_BUTTON.'
,p_internal_uid=>7877516194085257
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472604545058671724)
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
 p_id=>wwv_flow_api.id(472604693153671729)
,p_db_column_name=>'NAME_JTL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name Jtl'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472604782890671729)
,p_db_column_name=>'ALIAS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Alias'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472604851046671729)
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
 p_id=>wwv_flow_api.id(472604906767671729)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472605082763671730)
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
 p_id=>wwv_flow_api.id(472605115184671730)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472605273655671730)
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
 p_id=>wwv_flow_api.id(472627814015679361)
,p_db_column_name=>'NAME'
,p_display_order=>18
,p_column_identifier=>'K'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472627982032679362)
,p_db_column_name=>'LANG'
,p_display_order=>28
,p_column_identifier=>'L'
,p_column_label=>'Lang'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(472628863575679371)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>38
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_html_expression=>'<pre>#DESCRIPTION#</pre>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(472627086258676186)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'79002'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'NAME:DESCRIPTION:LANG:ALIAS:ACTIVE_IND'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472605457271671732)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472579264213671479)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(472603504955671682)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(472597417510671533)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472608279127671853)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(472604337469671713)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:3'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Maintain Project'
,p_page_mode=>'NORMAL'
,p_step_title=>'Maintain Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JORGE@RIMBLAS.COM'
,p_last_upd_yyyymmddhh24miss=>'20200521210341'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472605875083671808)
,p_plug_name=>'Maintain Project'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472628027690679363)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_api.id(472605875083671808)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472573114149671475)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P3_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472608497425671855)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472579264213671479)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(472603504955671682)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(472597417510671533)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472605942614671808)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472606141413671808)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472606224447671808)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472606081156671808)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472629088835679373)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'DISABLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Disable Name'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(472629355257679376)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(472605875083671808)
,p_button_name=>'ENABLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Enable Name'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(472606492779671812)
,p_branch_action=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472606596304671813)
,p_name=>'P3_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(472605875083671808)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472606626745671814)
,p_name=>'P3_NAME_JTL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(472605875083671808)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>60
,p_field_template=>wwv_flow_api.id(472596687693671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_attribute_03=>'TEXT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472606814852671844)
,p_name=>'P3_ALIAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(472605875083671808)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alias'
,p_source=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472607053039671844)
,p_name=>'P3_ACTIVE_IND'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(472605875083671808)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicates if the record is active or inactive.'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472607233692671845)
,p_name=>'P3_CREATED_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(472628027690679363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472607474934671845)
,p_name=>'P3_CREATED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(472628027690679363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472607645624671845)
,p_name=>'P3_UPDATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(472628027690679363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472607861734671845)
,p_name=>'P3_UPDATED_ON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(472628027690679363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472628924104679372)
,p_name=>'P3_DESCRIPTION_JTL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(472605875083671808)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>70
,p_cMaxlength=>400
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(472596687693671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_attribute_03=>'TEXTAREA'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(477877810089059963)
,p_validation_name=>'P3_NAME_JTL is not null'
,p_validation_sequence=>10
,p_validation=>'tk_jtl_plugin.get_tl_value(:P3_NAME_JTL) is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'The name is required'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(472606626745671814)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(472629201441679374)
,p_name=>'Disable Button'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(472629088835679373)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(472629233380679375)
,p_event_id=>wwv_flow_api.id(472629201441679374)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(472629448385679377)
,p_name=>'Enable Name'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(472629355257679376)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(472629522895679378)
,p_event_id=>wwv_flow_api.id(472629448385679377)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472608010807671848)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PX_PROJECTS'
,p_attribute_02=>'PX_PROJECTS2'
,p_attribute_03=>'P3_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472608182758671848)
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
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'JTL with Blob'
,p_page_mode=>'NORMAL'
,p_step_title=>'JTL with CLOB'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20180201231435'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464943708428022588)
,p_plug_name=>'JTL with CLOB'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472575461590671476)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id',
'     , name',
'     , decode(sign(length(description)-150)',
'       , null, null',
'       , -1, description',
'       , substr(description,1,150) ||''…'') description',
'     , active_ind',
'     , created_by',
'     , created_on',
'     , updated_by',
'     , updated_on',
'from px_jtl_with_clob_vl',
'  ',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(464944065060022590)
,p_name=>'JTL with Blob'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:5:&APP_SESSION.::::P5_ID:#ID#'
,p_detail_link_text=>'&EDIT_BUTTON.'
,p_owner=>'JRIMBLAS'
,p_internal_uid=>443878911454084626
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464944242819022599)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464157646781768973)
,p_db_column_name=>'NAME'
,p_display_order=>11
,p_column_identifier=>'I'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464157733785768974)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>21
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_html_expression=>'<pre>#DESCRIPTION#</pre>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464945385648022612)
,p_db_column_name=>'ACTIVE_IND'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Active?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_help_text=>'Indicates is the record is enabled.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464945838913022612)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464946222077022613)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>51
,p_column_identifier=>'F'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464946632444022614)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>61
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(464947026077022614)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>71
,p_column_identifier=>'H'
,p_column_label=>'Updated On'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(464959828245044285)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4438947'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'NAME:DESCRIPTION:ACTIVE_IND:CREATED_BY:CREATED_ON:UPDATED_BY:UPDATED_ON'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464947960059022620)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472579264213671479)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(472603504955671682)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(472597417510671533)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(464947431227022615)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(464943708428022588)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Maintain JTL with Clob'
,p_page_mode=>'NORMAL'
,p_step_title=>'Maintain JTL with Clob'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JORGE@RIMBLAS.COM'
,p_last_upd_yyyymmddhh24miss=>'20200521210341'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464937108454022264)
,p_plug_name=>'Maintain JTL with Clob'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464948595414022626)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472579264213671479)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(472603504955671682)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(472597417510671533)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464961204782050353)
,p_plug_name=>'Audit'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472573114149671475)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(464937605646022271)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(464937108454022264)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(464937810805022272)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(464937108454022264)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(464937499350022271)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(464937108454022264)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(472597081426671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(464937685838022271)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(464937108454022264)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(464939366063022289)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464939760895022478)
,p_name=>'P5_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(464937108454022264)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464940083535022517)
,p_name=>'P5_NAME_JTL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(464937108454022264)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(472596687693671518)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'return true;'
,p_attribute_03=>'TEXT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464940472812022525)
,p_name=>'P5_DESCRIPTION_JTL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(464937108454022264)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>60
,p_cMaxlength=>3000
,p_cHeight=>2
,p_field_template=>wwv_flow_api.id(472596687693671518)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'return true;'
,p_attribute_03=>'TEXTAREA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464960518287048794)
,p_name=>'P5_ACTIVE_IND'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(464937108454022264)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicates if the record is active or inactive.'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464961524413050368)
,p_name=>'P5_CREATED_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(464961204782050353)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464962401508050370)
,p_name=>'P5_CREATED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(464961204782050353)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464963293585050372)
,p_name=>'P5_UPDATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(464961204782050353)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464964228925050373)
,p_name=>'P5_UPDATED_ON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(464961204782050353)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(464941209250022531)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PX_JTL_WITH_CLOB'
,p_attribute_02=>'PX_JTL_WITH_CLOB'
,p_attribute_03=>'P5_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(464941598088022534)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PX_JTL_WITH_CLOB'
,p_attribute_02=>'PX_JTL_WITH_CLOB'
,p_attribute_03=>'P5_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(464942041638022536)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(464937685838022271)
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Translation Demo - Log In'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_step_template=>wwv_flow_api.id(472561748548671445)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JRIMBLAS'
,p_last_upd_yyyymmddhh24miss=>'20170212162048'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(472602655171671658)
,p_plug_name=>'JTL Item Plugin Demo'
,p_icon_css_classes=>'appIcon fa-globe'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(472575760790671477)
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
 p_id=>wwv_flow_api.id(472602977262671676)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(472602655171671658)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(472596944054671525)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472602799117671669)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(472602655171671658)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(472596382253671515)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472602889954671675)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(472602655171671658)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(472596382253671515)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472603133386671681)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472603079343671678)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472603378202671681)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472603299074671681)
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
,p_user_interface_id=>wwv_flow_api.id(472602117214671596)
,p_name=>'Switch Language'
,p_page_mode=>'NORMAL'
,p_step_title=>'Switch Language'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
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
 p_id=>wwv_flow_api.id(472628502666679367)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(472575991781671477)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(472628679279679369)
,p_branch_name=>'Return to page'
,p_branch_action=>'f?p=&APP_ID.:&P500_LAST_PAGE.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(472628573446679368)
,p_name=>'P500_LAST_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(472628502666679367)
,p_prompt=>'Last page'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(472596435996671518)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(472628334470679366)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Switch Language'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_session_lang(:G_LANG);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(475017030414713187)
,p_get_version_sql_query=>'SELECT OBJECT_NAME FROM SYS.USER_OBJECTS WHERE OBJECT_NAME = ''PX_PROJECTS2'''
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop view px_projects2_vl;',
'drop table px_projects2;',
'',
'drop view px_jtl_with_clob_vl;',
'drop table px_jtl_with_clob;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
end;
/
prompt --application/deployment/install
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(475027145249720132)
,p_install_id=>wwv_flow_api.id(475017030414713187)
,p_name=>'All Objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table px_projects2 (',
'    id            number        generated by default on null as identity (start with 1) primary key not null',
'  , name_jtl      varchar2(500)   not null constraint px_projects2_name_tl_ck CHECK (name_jtl is json(strict))',
'  , description_jtl varchar2(4000) not null constraint px_projects2_desc_tl_ck CHECK (description_jtl is json(strict))',
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
'',
'create table px_jtl_with_clob (',
'    id            number        generated by default on null as identity (start with 1) primary key not null',
'  , name_jtl      varchar2(500)   not null constraint px_jtl_with_clob_name_tl_ck CHECK (name_jtl is json(strict))',
'  , description_jtl clob not null constraint px_jtl_with_clob_desc_tl_ck CHECK (description_jtl is json(strict))',
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
'  , constraint px_jtl_with_clob_ck_active',
'      check (active_ind in (''Y'', ''N''))',
')',
'enable primary key using index',
'/',
'',
'comment on table px_jtl_with_clob is ''Demo table to test clobs'';',
'',
'comment on column px_jtl_with_clob.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'comment on column px_jtl_with_clob.description_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'comment on column px_jtl_with_clob.active_ind is ''Is the record enabled Y/N?'';',
'comment on column px_jtl_with_clob.created_by is ''User that created this record'';',
'comment on column px_jtl_with_clob.created_on is ''Date the record was first created'';',
'comment on column px_jtl_with_clob.updated_by is ''User that last modified this record'';',
'comment on column px_jtl_with_clob.updated_on is ''Date the record was last modified'';',
'',
'',
'--------------------------------------------------------',
'--  DDL for Trigger px_jtl_with_clob_u',
'--------------------------------------------------------',
'create or replace trigger px_jtl_with_clob_u',
'before update',
'on px_jtl_with_clob',
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
'create or replace view px_jtl_with_clob_vl',
'as',
'with n_tl as (',
'  select /*+ no_merge */ p.id',
'       , t.lang',
'       , t.tl',
'    from px_jtl_with_clob p',
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
'    from px_jtl_with_clob p',
'       , json_table(p.description_jtl, ''$[*]''',
'          columns (',
'                   lang varchar2(10) path ''$.l''',
'                 , tl   varchar2(4000) path ''$.tl''',
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
'  from px_jtl_with_clob p',
'     , n_tl',
'     , d_tl',
' where p.id = n_tl.id',
'   and p.id = d_tl.id',
'   and n_tl.lang = d_tl.lang',
'   and n_tl.lang = (select nvl(apex_util.get_session_lang,''en'') from dual)',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(465127124359606098)
,p_install_id=>wwv_flow_api.id(475017030414713187)
,p_name=>'New CLOB table'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table px_projects2 modify description_jtl varchar2(4000);',
'',
'create table px_jtl_with_clob (',
'    id            number        generated by default on null as identity (start with 1) primary key not null',
'  , name_jtl      varchar2(500)   not null constraint px_jtl_with_clob_name_tl_ck CHECK (name_jtl is json(strict))',
'  , description_jtl clob not null constraint px_jtl_with_clob_desc_tl_ck CHECK (description_jtl is json(strict))',
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
'  , constraint px_jtl_with_clob_ck_active',
'      check (active_ind in (''Y'', ''N''))',
')',
'enable primary key using index',
'/',
'',
'comment on table px_jtl_with_clob is ''Demo table to test clobs'';',
'',
'comment on column px_jtl_with_clob.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'comment on column px_jtl_with_clob.description_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';',
'comment on column px_jtl_with_clob.active_ind is ''Is the record enabled Y/N?'';',
'comment on column px_jtl_with_clob.created_by is ''User that created this record'';',
'comment on column px_jtl_with_clob.created_on is ''Date the record was first created'';',
'comment on column px_jtl_with_clob.updated_by is ''User that last modified this record'';',
'comment on column px_jtl_with_clob.updated_on is ''Date the record was last modified'';',
'',
'',
'--------------------------------------------------------',
'--  DDL for Trigger px_jtl_with_clob_u',
'--------------------------------------------------------',
'create or replace trigger px_jtl_with_clob_u',
'before update',
'on px_jtl_with_clob',
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
'create or replace view px_jtl_with_clob_vl',
'as',
'with n_tl as (',
'  select /*+ no_merge */ p.id',
'       , t.lang',
'       , t.tl',
'    from px_jtl_with_clob p',
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
'    from px_jtl_with_clob p',
'       , json_table(p.description_jtl, ''$[*]''',
'          columns (',
'                   lang varchar2(10) path ''$.l''',
'                 , tl   varchar2(4000) path ''$.tl''',
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
'  from px_jtl_with_clob p',
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
