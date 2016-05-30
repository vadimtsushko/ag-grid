@JS()
library checkbox;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../interop/ag_grid.dart';

@JS()
@anonymous
class CheckboxCellEditorInstance {
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

  external set checkbox(InputElement value);
  external InputElement get checkbox;
  external factory CheckboxCellEditorInstance();
}


class CheckboxCellEditorMethods {
  CheckboxCellEditorInstance create() {
    return new CheckboxCellEditorInstance();
  }
  bool isKeyPressedNumeric(KeyboardEvent event, String currentValue) {
    var key = event.keyCode;
    var keychar = new String.fromCharCode(key);
    String futureValueStr = currentValue + keychar;
    num futureValue = num.parse(futureValueStr, (_) => null);
    return futureValue != null;
  }

  init(CheckboxCellEditorInstance me, RendererParam params) {
    me.checkbox = new CheckboxInputElement();
    me.checkbox.checked = params.value == '1';
  }

  HtmlElement getGui(CheckboxCellEditorInstance me) {
    return me.checkbox;
  }

  afterGuiAttached(CheckboxCellEditorInstance me) {
    me.checkbox.focus();
  }

  // returns the new value after editing
  getValue(CheckboxCellEditorInstance me) {
    return me.checkbox.checked ? '1' : '0';
  }

  ///if true, then this editor will appear in a popup
  bool isPopup(CheckboxCellEditorInstance me) {
    return false;
  }
  //// any cleanup we need to be done here
  destroy(CheckboxCellEditorInstance me) {
  }
  CheckboxCellEditorInstance getInstance() {
    var result = new CheckboxCellEditorInstance();
    result.init = allowInteropCaptureThis(init);
    result.getGui = allowInteropCaptureThis(getGui);
    result.afterGuiAttached = allowInteropCaptureThis(afterGuiAttached);
    result.getValue = allowInteropCaptureThis(getValue);
    result.isPopup = allowInteropCaptureThis(isPopup);
    result.destroy = allowInteropCaptureThis(destroy);
    return result;
  }


}
