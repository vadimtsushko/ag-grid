@JS()
library JsNumericEditor;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../interop/ag_grid.dart';
import 'prototype.dart';

@JS()
@anonymous
class NumericCellEditorData {
  external set eInput(InputElement value);
  external InputElement get eInput;
  external factory NumericCellEditorData();
}


class NumericCellEditorMethods extends CellEditorMethods{
  bool isKeyPressedNumeric(KeyboardEvent event, String currentValue) {
    var key = event.keyCode;
    var keychar = new String.fromCharCode(key);
    String futureValueStr = currentValue + keychar;
    num futureValue = num.parse(futureValueStr, (_) => null);
    return futureValue != null;
  }

  init(NumericCellEditorData me, RendererParam params) {
    print('init');
    me.eInput = new InputElement();
    me.eInput.value = params.value;
    me.eInput.onKeyPress.listen((KeyboardEvent event) {
      print('OnKeyPress: $event ${event.code}');
      if (!isKeyPressedNumeric(event, me.eInput.value)) {
        me.eInput.focus();
        me.eInput.select();
        event.preventDefault();
      }
    });
  }

  getGui(NumericCellEditorData me) {
    print('getGui');
    return me.eInput;
  }

  afterGuiAttached(NumericCellEditorData me) {
    print('afterGuiAttached');
    me.eInput.focus();
    me.eInput.select();
  }

  // returns the new value after editing
  getValue(NumericCellEditorData me) {
    print('getValue');
    return me.eInput.value;
  }

  ///if true, then this editor will appear in a popup
  isPopup(NumericCellEditorData me) {
    print('isPopup');
    return false;
  }
  //// any cleanup we need to be done here
  destroy(NumericCellEditorData me) {
    print('destroy');
  }

}

@JS('dartInterface.NumericCellEditor')
class NumericCellEditor {
  external factory NumericCellEditor();
}


@JS()
external assignNumericCellEditor(ColumnDef colDef);

