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
  external set eInput(InputElement value);
  external InputElement get eInput;
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
    me.eInput = new InputElement();
    me.eInput.value = params.value;
    me.eInput.onKeyPress.listen((KeyboardEvent event) {
      print('OnKeyPress: $event ${event.code}');
      if (!isKeyPressedNumeric(event, me.eInput.value)) {
        me.eInput.focus();
        event.preventDefault();
      }
    });
  }

  HtmlElement getGui(CheckboxCellEditorData me) {
    print('getGui');
    return me.eInput;
  }

  afterGuiAttached(CheckboxCellEditorData me) {
    print('afterGuiAttached');
    me.eInput.focus();
  }

  // returns the new value after editing
  getValue(CheckboxCellEditorData me) {
    print('getValue');
    return me.eInput.value;
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

