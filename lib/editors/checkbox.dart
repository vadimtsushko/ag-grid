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
    me.checkbox = new CheckboxInputElement();
    me.checkbox.checked = params.value == '1';
  }

  HtmlElement getGui(CheckboxCellEditorData me) {
    return me.checkbox;
  }

  afterGuiAttached(CheckboxCellEditorData me) {
    me.checkbox.focus();
  }

  // returns the new value after editing
  getValue(CheckboxCellEditorData me) {
    return me.checkbox.checked ? '1' : '0';
  }

  ///if true, then this editor will appear in a popup
  bool isPopup(CheckboxCellEditorData me) {
    return false;
  }
  //// any cleanup we need to be done here
  destroy(CheckboxCellEditorData me) {
  }


}

@JS('dartInterface.CheckboxCellEditor')
class CheckboxCellEditor {
  external factory CheckboxCellEditor();
}

