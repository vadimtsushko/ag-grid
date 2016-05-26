@JS()
library JsNumericEditor;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../interop/ag_grid.dart';

@JS()
@anonymous
class NumericCellEditorData {
  external set eInput(InputElement value);
  external InputElement get eInput;
  external factory NumericCellEditorData();
}

@JS()
@anonymous
class NumericCellEditorPrototype {
  external VoidFunc1 get init;
  external set init(VoidFunc1 value);
  external VoidFunc0 get afterGuiAttached;
  external set afterGuiAttached(VoidFunc0 value);
  external Func0<HtmlElement> get getGui;
  external set getGui(Func0<HtmlElement> value);
  external Func0 get getValue;
  external set getValue(Func0 value);
  external VoidFunc0 get destroy;
  external set destroy(VoidFunc0 value);
  external Func0<bool> get isPopup;
  external set isPopup(Func0<bool> value);
  external factory NumericCellEditorPrototype(
      {VoidFunc1 init,
      VoidFunc0 afterGuiAttached,
      Func0<HtmlElement> getGui,
      Func0 getValue,
      VoidFunc0 destroy,
      Func0<bool> isPopup});
}

class NumericCellEditorMethods {
  static bool isKeyPressedNumeric(KeyboardEvent event, String currentValue) {
    var key = event.keyCode;
    var keychar = new String.fromCharCode(key);
    String futureValueStr = currentValue + keychar;
    num futureValue = num.parse(futureValueStr, (_) => null);
    return futureValue != null;
  }

  static init(NumericCellEditorData me, RendererParam params) {
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

  static getGui(NumericCellEditorData me) {
    print('getGui');
    return me.eInput;
  }

  static afterGuiAttached(NumericCellEditorData me) {
    print('afterGuiAttached');
    me.eInput.focus();
    me.eInput.select();
  }

  // returns the new value after editing
  static getValue(NumericCellEditorData me) {
    print('getValue');
    return me.eInput.value;
  }

  ///if true, then this editor will appear in a popup
  static isPopup(NumericCellEditorData me) {
    print('isPopup');
    return false;
  }
  //// any cleanup we need to be done here
  static destroy(NumericCellEditorData me) {
    print('destroy');
  }

  static NumericCellEditorPrototype getPrototype() {
    var result = new NumericCellEditorPrototype();
    result.init = allowInteropCaptureThis(NumericCellEditorMethods.init);
    result.getGui = allowInteropCaptureThis(NumericCellEditorMethods.getGui);
    result.afterGuiAttached =
        allowInteropCaptureThis(NumericCellEditorMethods.afterGuiAttached);
    result.getValue =
        allowInteropCaptureThis(NumericCellEditorMethods.getValue);
    result.isPopup = allowInteropCaptureThis(NumericCellEditorMethods.isPopup);
    result.destroy = allowInteropCaptureThis(NumericCellEditorMethods.destroy);
    return result;
  }
}

@JS('dartInterface.NumericCellEditor')
class NumericCellEditor {
  external factory NumericCellEditor();
}


@JS()
external assignNumericCellEditor(ColumnDef colDef);

