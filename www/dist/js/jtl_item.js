/*
 * JTL Item v2.0 - http://apex.world/plugins/
 *
 * Licensed under MIT License (MIT)
 * Jorge Rimblas © 2017
*/

$.widget( "tk.jtl_item", {
 
  // Default options.
  options: {
     lang: "en",
     lang_codes: ["en","fr","es"],
     messages: null,
     fieldSize: 30,
     fieldRows: 5,
     fieldMaxLength: 80,
     dialogTitle: null
  },
  _createPrivateStorage: function() {
     var uiw = this;

     uiw._values = {
        apexItemId: '',
        controlsId: '',
        fieldSize: 30,
        fieldMaxLength: 80,
        dataJSON: {},
        curr_lang_index: 0,
        languages: {},
        tagMap: {},
        messages: $.parseJSON(uiw.options.messages),
        totalLanguages: 0,
        disabled: false,
        focusOnClose: 'BUTTON', //BUTTON or INPUT,
        newRecord: false,
        signalChange: false
     };

     uiw._elements = {
        $window: {},
        $document: {},
        $body: {},
        $hiddenInput: {},
        $displayInput: {},
        $fieldset: {},
        $mlsButton: {},
        $dialog: {},
        $dialogContent: {},
        $saveButton: {},
        $cancelButton: {},
        $buttonContainer: {}
     };
  },
  _create: function() {
    var uiw = this;

    // Options are already merged and stored in this.options (or uiw.options)

    // helper function for finding the position of our current displayed language
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
    uiw._values.apexItemId = $(uiw.element).attr('id');
    uiw._values.controlsId = uiw._values.apexItemId + '_fieldset';
    uiw._initElements();
    uiw._initBaseElements();

    uiw._values.languages = JSON.parse(uiw.options.lang_codes);
    uiw._values.totalLanguages = uiw._values.languages.length;

    // get the fresh list of languages
    uiw._initDataJSON();
    uiw._initLanguageMap();
    // Which position language are we using
    uiw._values.curr_lang_index = language_index(uiw._values.dataJSON, uiw.options.lang);
    
    // Sync our hidden field with the actual value in the correct language, but
    // also during page submit to make sure we submit the correct value 
    uiw._elements.$displayInput
       .bind('change', {uiw: uiw}, uiw._syncHiddenField);
    uiw._elements.$document
       .bind('apexbeforepagesubmit', {uiw: uiw}, uiw._syncHiddenField);

    uiw._elements.$mlsButton
       .bind('click', {uiw: uiw}, uiw._handleOpenClick);

    apex.debug.message(4,"Registering with apex.widget.initPageItem: " + uiw._elements.$displayInput.attr('id'));

    apex.widget.initPageItem(uiw._elements.$hiddenInput.attr('id'), {
       setValue: function(value, displayValue) {
          uiw._elements.$displayInput.val(displayValue);
          uiw._syncHiddenField();
       },
       getValue: function() {
          return uiw._elements.$hiddenInput.val();
       },
       setFocus: function() {
          uiw._elements.$displayInput.focus();
       },
       // show: function() {
       //    uiw.show();
       // },
       // hide: function() {
       //    uiw.hide();
       // },
       enable: function() {
          uiw.enable();
       },
       disable: function() {
          uiw.disable();
       }
    });

  },
  _initElements: function() {
     var uiw = this;

     uiw._elements.$window = $(window);
     uiw._elements.$document = $(document);
     uiw._elements.$body = $(document.body);
     uiw._elements.$dialog = $('div.jtlitem-dialog');

  },
  _initDialogElements: function() {
     var uiw = this;

     uiw._elements.$dialog = $('div.jtlitem-dialog');
     uiw._elements.$dialogContent = $('div.jtlitem-content');
     uiw._elements.$saveButton = $('button.jtlitem-save-button');
     uiw._elements.$cancelButton = $('button.jtlitem-cancel-button');

  },
  _initBaseElements: function() {
     var uiw = this;

     uiw._elements.$hiddenInput = uiw.element;
     uiw._elements.$displayInput = $('#' + uiw._values.apexItemId + '_DISPLAY');     
     uiw._values.fieldSize = uiw.options.itemType === "TEXT"? uiw._elements.$displayInput.attr("size") : uiw._elements.$displayInput.attr("cols");
     if (uiw.options.itemType === "TEXTAREA") {
       uiw._values.fieldRows = uiw._elements.$displayInput.attr("rows");
     }
     uiw._values.fieldMaxLength = uiw._elements.$displayInput.attr("maxlength");

     uiw._elements.$fieldset = $('#' + uiw._values.controlsId);
     uiw._elements.$mlsButton =
        uiw._elements.$fieldset.find('button.jtlitem-modal-open');
  },
  _initDataJSON: function(){
     var uiw = this,
         jsonData = [],
         input_data = uiw._elements.$hiddenInput.val();

     if (input_data) {
        uiw._values.dataJSON = JSON.parse(input_data);
        uiw._values.newRecord = false;
     }
     else {
        // The record is empty so we build a 
        // build JSON with this structure to seed it:
        //  [ {"l": "us", "tl": "Project Analysis"}
        //  , {"l": "fr", "tl": "Analyse de projet"}
        //  , {"l": "es", "tl": "Analisis de projecto"}]
        uiw._values.languages.forEach(function(l) {
           jsonData.push({"l": l, "tl": ""});
        });
        // Init the hidden item
        uiw._elements.$hiddenInput.val(JSON.stringify(jsonData));
        uiw._values.dataJSON = jsonData;
        uiw._values.newRecord = true;
     }

  },
  _syncHiddenField: function(eventObj) {
     // var uiw = eventObj.data.uiw,
     var uiw,
         langJSON = {},
         lang_index;

     if (typeof eventObj != "undefined") {
        // we were call from an event
        uiw = eventObj.data.uiw;
     }
     else {
        // direct call
        uiw = this;
     }

     lang_index = uiw._values.curr_lang_index;

     if (uiw._values.newRecord) {
        // save the new text into the ALL the records in the JSON structure
        for (var i = uiw._values.totalLanguages - 1; i >= 0; i--) {
          uiw._values.dataJSON[i].tl = uiw._elements.$displayInput.val();
        }
     }
     else {
        // save the new text into the JSON structure
        uiw._values.dataJSON[lang_index].tl = uiw._elements.$displayInput.val();
     }
     // place the full JSON back into the hidden item
     uiw._elements.$hiddenInput.val(JSON.stringify(uiw._values.dataJSON));
     // Keep the map fresh (only needed for the dialog)
     uiw._initLanguageMap();
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
     uiw._elements.$dialog.dialog('close'); // this should cascade to remove the dialog
  },
  _handleSaveButtonClick: function(eventObj) {
     var uiw = eventObj.data.uiw,
         display_value;

     uiw._elements.$dialogContent.find('.jtlitem-value').each(function(i,el){
        apex.debug.message(4,i + "(" + el.dataset.lang + "):" + el.value);
        uiw._values.dataJSON[i].l = el.dataset.lang;
        uiw._values.dataJSON[i].tl = el.value;
        if (uiw._values.curr_lang_index == i) {
           display_value = el.value;
        }
     });

     uiw._initLanguageMap();

     // sync the items again
     uiw._elements.$displayInput.val(display_value);
     uiw._elements.$hiddenInput.val(JSON.stringify(uiw._values.dataJSON));
     // uiw._signalChange();  // does the .val trigger a change already?
     uiw._values.newRecord = false;

     uiw._elements.$dialog.dialog('close'); // this should cascade to remove the dialog
  },
  _signalChange: function() {
     var uiw = this,
        hiddenElmt = uiw._elements.$hiddenInput[0],  // Do we use [0] or jquery object?
        displayElmt = uiw._elements.$displayInput[0];

     //Need apex.jQuery for the events to register with the DA framework
     apex.jQuery(hiddenElmt).trigger('change');
     apex.jQuery(displayElmt).trigger('change');
  },
  _handleOpenClick: function(eventObj) {
     var uiw = eventObj.data.uiw;

     uiw._syncHiddenField(eventObj);
     uiw._showDialog();
  },
  _initLanguageMap: function() {
     var uiw = this,
         i = null,
         tags = {};

     tags = uiw._values.dataJSON;

     // http://mattsnider.com/how-to-efficiently-search-a-json-array/
     uiw._values.tagMap = {};
     for (i = 0; tags.length > i; i += 1) {
         uiw._values.tagMap[tags[i].l] = tags[i].tl;
     }
      
  },
  _hasTag: function(tagName) {
     var uiw = this;
     return uiw._values.tagMap[tagName];
  },
  _showDialog: function() {
     var uiw = this,
         langTable,
         curr_lang = uiw._values.curr_lang_index,
         dialogHtml;

     langTable = 
           '<table class="t-Report-report" summary="Available Translations">\n' +
           ' <tr>\n' +
           '  <th class="t-Report-colHead">' + uiw._values.messages.languageLabel + '</th>' +
           '  <th class="t-Report-colHead u-tL">' + uiw._values.messages.languageValue + '</th>' +
           ' </tr>\n' +
           ' <tr>\n';

     $.each(uiw._values.languages, function( index, lang ) {
       langTable +=
       ' <tr>\n' +
       '  <td class="t-Report-cell t-Form-inputContainer u-tC' + (curr_lang==index? ' selected':'') + '">' + apex.util.escapeHTMLAttr(lang) + '</td>' +
       '  <td class="t-Report-cell t-Form-inputContainer u-tL' + (curr_lang==index? ' selected':'') + '">';
       if (uiw.options.itemType === "TEXT") {
         langTable +=
         '    <input type="text" class="text_field apex-item-text jtlitem-value" data-lang="' + lang + '" value="' + apex.util.escapeHTMLAttr(uiw._hasTag(lang)) + '" size="' + uiw._values.fieldSize + '" maxlength="' + uiw._values.fieldMaxLength + '"></td>';
       }
       else {
         langTable +=
         '    <textarea class="textarea apex-item-textarea jtlitem-value" data-lang="' + lang + '" cols="' + uiw._values.fieldSize + '" rows="' + uiw._values.fieldRows + '">' +
         apex.util.escapeHTMLAttr(uiw._hasTag(lang)) + '</textarea>';
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

      uiw._initElements();

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
         position:      { my: "left", at: "left center", of: uiw._elements.$displayInput[0] },
         open: function() {
            uiw._initDialogElements();
            uiw._initDialogButtons();
            uiw._elements.$dialogContent.find('input').first().focus();
         },
         close: function() {

            $(this).dialog('destroy');
            uiw._elements.$dialog.remove();
            uiw._elements.$document.find('div.jtlitem-dialog').remove();

            if (uiw._values.focusOnClose === 'BUTTON') {
               uiw._elements.$mlsButton.focus();
            } else if (uiw._values.focusOnClose === 'INPUT') {
               uiw._elements.$displayInput.focus();
            }

            uiw._values.focusOnClose = 'BUTTON';
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
        uiw._elements.$displayInput
           .attr('disabled','disabled');
        uiw._elements.$hiddenInput.attr('disabled','disabled');

        uiw._elements.$mlsButton
           .attr('disabled','disabled')
           .unbind('click', uiw._handleOpenClick);
     }

     uiw._values.disabled = true;
  },
  enable: function() {
     var uiw = this;

     if (uiw._values.disabled === true) {
       uiw._elements.$displayInput.removeAttr('disabled');
       uiw._elements.$hiddenInput.removeAttr('disabled');
       uiw._elements.$mlsButton
          .removeAttr('disabled')
          .bind('click', {uiw: uiw}, uiw._handleOpenClick);

       uiw._values.disabled = false;
     }
  }
});
//# sourceMappingURL=jtl_item.js.map
