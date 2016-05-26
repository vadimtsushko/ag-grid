//@JS()
//library JsSelectEditor;
//
//import 'dart:html';
//import 'package:js/js.dart';
//import 'package:func/func.dart';
//import '../interop/ag_grid.dart';
//
//@JS()
//@anonymous
//class SelectCellEditorData {
//  external set eInput(InputElement value);
//  external InputElement get eInput;
//  external factory SelectCellEditorData();
//}
//
//@JS()
//@anonymous
//class SelectCellEditorPrototype {
//  external VoidFunc1 get init;
//  external set init(VoidFunc1 value);
//  external VoidFunc0 get afterGuiAttached;
//  external set afterGuiAttached(VoidFunc0 value);
//  external Func0<HtmlElement> get getGui;
//  external set getGui(Func0<HtmlElement> value);
//  external Func0 get getValue;
//  external set getValue(Func0 value);
//  external VoidFunc0 get destroy;
//  external set destroy(VoidFunc0 value);
//  external Func0<bool> get isPopup;
//  external set isPopup(Func0<bool> value);
//  external factory SelectCellEditorPrototype(
//      {VoidFunc1 init,
//      VoidFunc0 afterGuiAttached,
//      Func0<HtmlElement> getGui,
//      Func0 getValue,
//      VoidFunc0 destroy,
//      Func0<bool> isPopup});
//}
//
//class SelectCellEditorMethods {
//  static bool isKeyPressedNumeric(KeyboardEvent event, String currentValue) {
//    var key = event.keyCode;
//    var keychar = new String.fromCharCode(key);
//    String futureValueStr = currentValue + keychar;
//    num futureValue = num.parse(futureValueStr, (_) => null);
//    return futureValue != null;
//  }
//
//  static init(SelectCellEditorData me, RendererParam params) {
//    print('init');
//    me.eInput = new InputElement();
//    me.eInput.value = params.value;
//    me.eInput.onKeyPress.listen((KeyboardEvent event) {
//      print('OnKeyPress: $event ${event.code}');
//      if (!isKeyPressedNumeric(event, me.eInput.value)) {
//        me.eInput.focus();
//        me.eInput.select();
//        event.preventDefault();
//      }
//    });
//  }
//
//  static getGui(SelectCellEditorData me) {
//    print('getGui');
//    return me.eInput;
//  }
//
//  static afterGuiAttached(SelectCellEditorData me) {
//    print('afterGuiAttached');
//    me.eInput.focus();
//    me.eInput.select();
//  }
//
//  // returns the new value after editing
//  static getValue(SelectCellEditorData me) {
//    print('getValue');
//    return me.eInput.value;
//  }
//
//  ///if true, then this editor will appear in a popup
//  static isPopup(SelectCellEditorData me) {
//    print('isPopup');
//    return false;
//  }
//  //// any cleanup we need to be done here
//  static destroy(SelectCellEditorData me) {
//    print('destroy');
//  }
//
//  static SelectCellEditorPrototype getPrototype() {
//    var result = new SelectCellEditorPrototype();
//    result.init = allowInteropCaptureThis(SelectCellEditorMethods.init);
//    result.getGui = allowInteropCaptureThis(SelectCellEditorMethods.getGui);
//    result.afterGuiAttached =
//        allowInteropCaptureThis(SelectCellEditorMethods.afterGuiAttached);
//    result.getValue =
//        allowInteropCaptureThis(SelectCellEditorMethods.getValue);
//    result.isPopup = allowInteropCaptureThis(SelectCellEditorMethods.isPopup);
//    result.destroy = allowInteropCaptureThis(SelectCellEditorMethods.destroy);
//    return result;
//  }
//}
//
//@JS('dartInterface.SelectCellEditor')
//class SelectCellEditor {
//  external factory SelectCellEditor();
//}
//
//
//
//@JS()
//external assignNumericCellEditor(ColumnDef colDef);
//
