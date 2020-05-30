/*
 * JTL Item v1.1 - http://apex.world/plugins/
 *
 * Licensed under MIT License (MIT)
 * Jorge Rimblas © 2017-2020
*/

$.widget( "ui.jtlItem", {
 
  // Default options.
  options: {
     lang: "en",
     lang_codes: [],  // ["en","fr","es"]
     messages: null,
     itemName: '',
     fieldSize: 30,
     fieldRows: 5,
     fieldMaxLength: 80,
     dialogTitle: null
  },

  // Logging for "regular" text elements
  log: function() {
    var args = Array.prototype.join.call( arguments, ', ' );
    apex.debug.message(4, "jtlitem:", args);
  },
  // Enhanced log
  // accepts 2 objects for logging
  elog: function(p1,p2) {
    apex.debug.message(4, "jtlitem:", p1, p2);
  },

  _topApex: apex.util.getTopApex(),

  _initGridConfig: function () {
    var uiw = this,
        region = apex.region.findClosest(uiw._item$[0]);

    uiw.log("_initGridConfig");
    uiw.elog("uiw._item$", uiw._item$);
    uiw.elog("region", region);

    if (uiw._values.igMode) {
      // uiw._elements.$grid = region.widget().interactiveGrid("getCurrentView");
      uiw._elements.$ig = region.widget().interactiveGrid();
      uiw._elements.$grid = region.widget().interactiveGrid("getViews").grid;
      uiw.elog("_elements.$grid:", uiw._elements.$grid);

      region.widget().on("interactivegridsave", function() {
        // Would like to call clearSelection() instead, but can't figure out how.
        // Turn edit off to force a fresh load of data again.
        // Yes, this is a total hack, and would love to learn of a better approach
        uiw._elements.$grid.setEditMode(false);
      });

    }
    else {
      uiw.log("not an IG");
    }

  },


  _resetFocus: function () {
    var uiw = this;

    uiw.log("_resetFocus");

    if (uiw._values.igMode) {  // are we inside a grid?
      // find our column in the grid
      uiw.elog("uiw._elements.$grid", uiw._elements.$grid);
      uiw.elog("uiw._elements.$ig", uiw._elements.$ig);

      var recordId = uiw._elements.$grid.model.getRecordId(uiw._elements.$grid.view$.grid('getSelectedRecords')[0]);
      var column = uiw._elements.$ig.interactiveGrid('option').config.columns.filter(function (column) {
        return column.staticId === uiw.options.itemName;
      })[0];
      // go to our cell and focus it      
      uiw._elements.$grid.view$.grid('gotoCell', recordId, column.name);
      uiw._elements.$grid.focus();
    } else {
      // we are not in a grid, so focus the item that called us
      uiw._item$.trigger('focus');
    }
  },


  _createPrivateStorage: function() {
     var uiw = this;

     uiw._item$ = $('#' + uiw.options.itemName);

     uiw._values = {
        fieldSize: 30,
        fieldMaxLength: 80,
        dataJSON: {},
        curr_lang_index: 0,
        languages: {},
        tagMap: {},
        messages: JSON.parse(uiw.options.messages),
        grid: null,
        totalLanguages: 0,
        disabled: false,
        newRecord: false,
        igMode: uiw.options.igMode
     };

     uiw._elements = {
        $window: {},
        $document: {},
        $body: {},
        $itemset: {},
        $mlsButton: {},
        $ig: {},
        $dialog: {},
        $dialogContent: {},
        $saveButton: {},
        $cancelButton: {},
        $buttonContainer: {}
     };
  },



  _create: function() {
    var uiw = this,
        initJSON = {};

    // Options are already merged and stored in this.options (or uiw.options)
    uiw.log("_create");
    uiw.log(uiw.options.itemName);

    // helper function for finding the index position of our current displayed language
    function language_index (j, l) {
      var i = null,
          idx = -1;
      for (i = 0; j.length > i && idx == -1; i += 1) {
        if (j[i].l === l) {
          idx = i;
        }
      }
      return idx;
    }

    uiw._createPrivateStorage();
    uiw._initElements();
    uiw._initBaseElements();


    try {uiw._values.languages = JSON.parse(uiw.options.lang_codes);}
    catch (e) {console.error("The defined languages are not formatted correctly. See Shared Componets > Components Settings > JTL Item [Plug-in]", uiw.options.lang_codes);}
    uiw._values.totalLanguages = uiw._values.languages.length;

    if (!uiw._values.igMode || uiw.element.data("value") ) {
      // We are an not an IG column (where the value is set via displayValueFor) 
      // or we are an item with an initial value
      initJSON = uiw.element.data("value");
    }

    // set the fresh list of languages
    uiw._initDataJSON(initJSON);

    // Which position language are we using
    uiw._values.curr_lang_index = language_index(uiw._values.dataJSON, uiw.options.lang);
    
    // Sync our JSON data-value attribute with the actual value in the correct language, but
    // also during page submit to make sure we submit the correct value 
    uiw._item$
       .bind('change', {uiw: uiw}, uiw._syncJSONdata);
    uiw._elements.$document
       .bind('apexbeforepagesubmit', {uiw: uiw}, uiw._syncJSONdata);

    uiw._elements.$mlsButton
       .bind('click', {uiw: uiw}, uiw._handleOpenClick);

    // Init APEX pageitem functions
    uiw._initApexItem();

    // apex.jQuery(window).on("theme42ready", function() {
    apex.jQuery(window).on("interactivegridviewmodelcreate", function(event, ui) { // will this work for multiple IG?
      // init the grid values, but wait until the grid is ready
      uiw._initGridConfig();
    });

  },



  _initApexItem: function () {
    var uiw = this;

    uiw.log("_initApexItem", "Registering with apex.item.create for " + uiw.options.itemName);
    // Set and get value via apex functions
    apex.item.create(uiw.options.itemName, {

       setValue: function(pValue, pDisplayValue) {
          uiw.log( "apex.item.setValue", pValue, pDisplayValue);

          uiw._initDataJSON(JSON.parse(pValue || "{}"));

          if (pDisplayValue || !pValue || pValue.length === 0) {
              // empty pValue
          } else {
              // NOT empty pValue
              if (!pDisplayValue) {
                pDisplayValue = uiw._getTL(uiw.options.lang);
              }

              uiw._item$.val(pDisplayValue);
          }

       },
       getValue: function() {
          return JSON.stringify(uiw._values.dataJSON);
       },
       setFocus: function() {
          uiw._item$.trigger("focus");
       },
       enable: function() {
          uiw.enable();
       },
       disable: function() {
          uiw.disable();
       },
       displayValueFor: function (pValue) {
          var jtlJSON = {};
          // The IG calls this code to set the initial display values
          uiw.log("apex.item.displayValueFor", pValue);
          if (pValue) {
            try { // just protect us if the JSON is invalid
              jtlJSON = JSON.parse(pValue);
            }
            catch (e) {
            }


          }
          uiw._initDataJSON(jtlJSON);
          return uiw._getTL(uiw.options.lang);
       }
    });

  },


  _initElements: function() {
     var uiw = this;

     uiw._elements.$window = $(window);
     uiw._elements.$document = $(document);
     uiw._elements.$body = $(document.body);

  },


  _initDialogElements: function() {
     var uiw = this;

     uiw._elements.$dialogContent = $('div.jtlitem-content');
     uiw._elements.$saveButton = $('button.jtlitem-save-button');
     uiw._elements.$cancelButton = $('button.jtlitem-cancel-button');

  },


  _initBaseElements: function() {
     var uiw = this;

     uiw.log( "_initBaseElements");
     uiw.elog( "element", uiw.element);

     uiw._values.fieldSize = uiw.options.itemType === "TEXT"? uiw._item$.attr("size") : uiw._item$.attr("cols");
     if (uiw.options.itemType === "TEXTAREA") {
       uiw._values.fieldRows = uiw._item$.attr("rows");
     }
     uiw._values.fieldMaxLength = uiw._item$.attr("maxlength");

     // Starting with APEX 18.1 the item set is the itemWrapper class
     uiw._elements.$itemset = uiw._item$.parent();
     uiw._elements.$mlsButton = uiw._elements.$itemset.find('button.jtlitem-modal-open');
  },


  _syncLanguageMap: function() {
     var uiw = this,
         i = null,
         tags = {};

     uiw.log( "_syncLanguageMap");
     tags = uiw._values.dataJSON;

     // http://mattsnider.com/how-to-efficiently-search-a-json-array/
     uiw._values.tagMap = {};
     for (i = 0; tags.length > i; i += 1) {
         uiw._values.tagMap[tags[i].l] = tags[i].tl;
         // console.log(i, "[" + tags[i].l + "] = ", tags[i].tl)
     }
      
  },


  // get the language value for a given language code
  _getTL: function(langCode) {
     var uiw = this;
     return uiw._values.tagMap[langCode];
  },



  // expects a jtlJSON structure or an empty object
  _initDataJSON: function(jtlJSON){
     var uiw = this,
         jsonData = [],
         input_data = jtlJSON || {};

         uiw.log("_initDataJSON");
         uiw.elog({input_data});

     if (apex.jQuery.isEmptyObject(input_data)) {
        uiw.log("Initializing with empty value");

        // The record is empty so we build a 
        // build JSON with this structure to seed it:
        //  [ {"l": "us", "tl": "Project Analysis"}
        //  , {"l": "fr", "tl": "Analyse de projet"}
        //  , {"l": "es", "tl": "Analisis de projecto"}]
        uiw._values.languages.forEach(function(l) {
           jsonData.push({"l": l, "tl": ""});
        });

        uiw._values.dataJSON = jsonData;
        uiw._values.newRecord = true;
     }
     else {
       uiw._values.dataJSON = input_data;
       uiw._values.newRecord = false;
     }

     uiw._syncLanguageMap();

  },



  _syncJSONdata: function(eventObj) {
     // var uiw = eventObj.data.uiw,
     var uiw,
         lang_index;

     if (typeof eventObj != "undefined") {
        // we were call from an event
        uiw = eventObj.data.uiw;
     }
     else {
        // direct call
        uiw = this;
     }
     uiw.log("_syncJSONdata");

     lang_index = uiw._values.curr_lang_index;

     if (uiw._values.newRecord) {
        // On new record we want to save the new entered value into the ALL the
        // records in the JSON structure
        for (var i = uiw._values.totalLanguages - 1; i >= 0; i--) {
          uiw._values.dataJSON[i].tl = uiw._item$.val();
        }
     }
     else {
        // save the new text into the JSON structure for the current language
        uiw._values.dataJSON[lang_index].tl = uiw._item$.val();
     }

     uiw._syncLanguageMap();
  },



  _initDialogButtons: function() {
     var uiw = this;

     uiw._elements.$cancelButton
        .bind('click', {uiw: uiw}, uiw._handleCancelButtonClick);

     uiw._elements.$saveButton
        .bind('click', {uiw: uiw}, uiw._handleSaveButtonClick);

  },


  _handleCancelButtonClick: function(eventObj) {
     var uiw = eventObj.data.uiw;

     // if the dialog opens, we're not a new record any more
     uiw._values.newRecord = false;

     uiw._elements.$dialog.dialog('close'); // this should cascade to remove the dialog

  },



  _handleSaveButtonClick: function(eventObj) {
     var uiw = eventObj.data.uiw,
         display_value;

     uiw._elements.$dialogContent.find('.jtlitem-value').each(function(i,el){
        // loop through all dialog elements and store translations
        // back into the dataJSON structure
        uiw.log(i + "(" + el.dataset.lang + "):" + el.value);

        uiw._values.dataJSON[i].l = el.dataset.lang;
        uiw._values.dataJSON[i].tl = el.value;
        if (uiw._values.curr_lang_index == i) {
           display_value = el.value;
        }
     });

     uiw._syncLanguageMap();

     // we're done "saving" back from the dialog, clear the newRecord flag
     uiw._values.newRecord = false;

     uiw._item$.val(display_value);
     uiw._signalChange();

     uiw._elements.$dialog.dialog('close'); // this should cascade to remove the dialog
  },


  _signalChange: function() {
     var uiw = this;

     // Need to use apex.jQuery for the events to register with the DA framework
     apex.jQuery(uiw._item$[0]).trigger('change');
  },


  _handleOpenClick: function(eventObj) {
     var uiw = eventObj.data.uiw;

     uiw.log("_handleOpenClick");

     uiw._syncJSONdata(eventObj);
     uiw._showDialog();
  },


  _showDialog: function() {
     var uiw = this,
         langTable,
         curr_lang = uiw._values.curr_lang_index,
         dialogHtml;

     uiw.log("_showDialog");

     langTable = 
           '<table class="t-Report-report" summary="Available Translations">\n' +
           ' <tr>\n' +
           '  <th class="t-Report-colHead">' + uiw._values.messages.languageLabel + '</th>' +
           '  <th class="t-Report-colHead u-tL">' + uiw._values.messages.languageValue + '</th>' +
           ' </tr>\n';
           // ' <tr>\n';

     $.each(uiw._values.languages, function( index, lang ) {
       langTable +=
       ' <tr' + (curr_lang==index? ' class="selected"':'') + '>\n' +
       '  <td class="t-Report-cell t-Form-inputContainer u-tC">' + apex.util.escapeHTMLAttr(lang) + '</td>' +
       '  <td class="t-Report-cell t-Form-inputContainer u-tL">';
       if (uiw.options.itemType === "TEXT") {
         langTable +=
         '    <input type="text" class="text_field apex-item-text jtlitem-value" data-lang="' + lang + '" value="' + apex.util.escapeHTMLAttr(uiw._getTL(lang)) + '" size="' + uiw._values.fieldSize + '" maxlength="' + uiw._values.fieldMaxLength + '"></td>';
       }
       else {
         langTable +=
         '    <textarea class="textarea apex-item-textarea jtlitem-value" data-lang="' + lang + '"' +
              ' cols="' + uiw._values.fieldSize + '" rows="' + uiw._values.fieldRows + '"' + 
              ' maxlength="' + uiw._values.fieldMaxLength + '"' + 
              '>' + apex.util.escapeHTMLAttr(uiw._getTL(lang)) + '</textarea>';
       }

       langTable +=
        ' </tr>\n';
     });
     langTable +=
     '</table>\n';

      dialogHtml =
           '<div class="jtlitem-dialog"><div class="jtlitem-container ui-widget">\n' +
           '  <div class="jtlitem-button-container">\n' +
           '     <button class="jtlitem-cancel-button t-Button">' +
           '       <span class="t-Button-label">' + uiw._values.messages.cancelButton + '</span>' +
           // '       <span class="ui-icon ui-icon-close"></span>' + 
           '     </button>\n' +
           '     <button class="jtlitem-save-button t-Button t-Button--hot">' + 
           '       <span class="t-Button-label">' + uiw._values.messages.applyChanges + '</span>' +
           '       <span class="t-Icon t-Icon--right fa fa-check"></span>' + 
           '     </button>\n' +
           '  </div>\n' +
           '  <div class="jtlitem-content">\n' +
              langTable +
           '  </div>\n' +
           '</div></div>\n';

     uiw._elements.$body.append(dialogHtml);

     // ready a dialog container by creating a div
     uiw._elements.$dialog = $('div.jtlitem-dialog');

     // open created div as a dialog
     uiw._elements.$dialog.dialog({
         closeOnEscape: true,
         title:         uiw.options.dialogTitle,
         autoResize:    true,
         minWidth:      400,
         minHeight:     250,
         width:         'auto',
         height:        'auto',
         modal:         true,
         position:      { my: "left", at: "left center", of: uiw._item$[0] },
         open: function() {
            // uiw._topApex.navigation.beginFreezeScroll();
            uiw._initDialogElements();
            uiw._initDialogButtons();

            // Focus on the first value of the current language 
            uiw._elements.$dialogContent.find('tr.selected .jtlitem-value').trigger('focus');
         },
         close: function() {

            $(this).dialog('destroy');
            uiw._elements.$dialog.remove();
            uiw._elements.$document.find('div.jtlitem-dialog').remove();
            // uiw._topApex.navigation.endFreezeScroll();

            uiw._resetFocus();
         }
       })
       .on('keydown', function(evt) {
           if (evt.keyCode === $.ui.keyCode.ESCAPE) {
               uiw._elements.$dialog.dialog('close');
           }                
           evt.stopPropagation();
       });


  },


  disable: function() {
     var uiw = this;

     if (uiw._values.disabled === false) {
        uiw._item$
           .attr('disabled','disabled');

        uiw._elements.$mlsButton
           .attr('disabled','disabled')
           .unbind('click', uiw._handleOpenClick);
     }

     uiw._values.disabled = true;
  },


  enable: function() {
     var uiw = this;

     if (uiw._values.disabled === true) {
       uiw._item$.removeAttr('disabled');
       uiw._elements.$mlsButton
          .removeAttr('disabled')
          .bind('click', {uiw: uiw}, uiw._handleOpenClick);

       uiw._values.disabled = false;
     }
  }
});
