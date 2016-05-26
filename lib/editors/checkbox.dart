@JS()
library JsCheckboxEditor;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../interop/ag_grid.dart';
import 'prototype.dart';

@JS()
@anonymous
class CheckboxCellEditorData {
  external set checkbox(InputElement value);
  external InputElement get checkbox;
  external factory CheckboxCellEditorData();
}


class CheckboxCellEditorMethods extends CellEditorMethods{
  bool isKeyPressedNumeric(KeyboardEvent event, String currentValue) {
    var key = event.keyCode;
    var keychar = new String.fromCharCode(key);
    String futureValueStr = currentValue + keychar;
    num futureValue = num.parse(futureValueStr, (_) => null);
    return futureValue != null;
  }

  init(CheckboxCellEditorData me, RendererParam params) {
    print('init');
    me.checkbox = new CheckboxInputElement();
    me.checkbox.checked = params.value == '1';
  }

  HtmlElement getGui(CheckboxCellEditorData me) {
    print('getGui');
    return me.checkbox;
  }

  afterGuiAttached(CheckboxCellEditorData me) {
    print('afterGuiAttached');
    me.checkbox.focus();
  }

  // returns the new value after editing
  getValue(CheckboxCellEditorData me) {
    print('getValue');
    return me.checkbox.checked ? '1' : '0';
  }

  ///if true, then this editor will appear in a popup
  bool isPopup(CheckboxCellEditorData me) {
    print('isPopup');
    return false;
  }
  //// any cleanup we need to be done here
  destroy(CheckboxCellEditorData me) {
    print('destroy');
  }


}

@JS('dartInterface.CheckboxCellEditor')
class CheckboxCellEditor {
  external factory CheckboxCellEditor();
}

/*
ar SelectCellEditor = (function (_super) {
    __extends(SelectCellEditor, _super);
    function SelectCellEditor() {
        _super.call(this, '<div class="ag-cell-edit-input"><select class="ag-cell-edit-input"/></div>');
    }
    SelectCellEditor.prototype.init = function (params) {
        var eSelect = this.getGui().querySelector('select');
        if (utils_1.Utils.missing(params.values)) {
            console.log('ag-Grid: no values found for select cellEditor');
            return;
        }
        params.values.forEach(function (value) {
            var option = document.createElement('option');
            option.value = value;
            option.text = value;
            if (params.value === value) {
                option.selected = true;
            }
            eSelect.appendChild(option);
        });
        this.addDestroyableEventListener(eSelect, 'change', function () { return params.stopEditing(); });
    };
    SelectCellEditor.prototype.afterGuiAttached = function () {
        var eSelect = this.getGui().querySelector('select');
        eSelect.focus();
    };
    SelectCellEditor.prototype.getValue = function () {
        var eSelect = this.getGui().querySelector('select');
        return eSelect.value;
    };
    return SelectCellEditor;
})(component_1.Component);
exports.SelectCellEditor = SelectCellEditor;

 */