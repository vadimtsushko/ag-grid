@JS()
library JsPrototype;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../interop/ag_grid.dart';

@JS()
@anonymous
class CellEditorPrototype {
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
  external factory CellEditorPrototype(
      {VoidFunc1 init,
      VoidFunc0 afterGuiAttached,
      Func0<HtmlElement> getGui,
      Func0 getValue,
      VoidFunc0 destroy,
      Func0<bool> isPopup});
}

abstract class CellEditorMethods {
  init(me, RendererParam params);
  HtmlElement getGui(me);
  afterGuiAttached(me);
  dynamic getValue(me);
  bool isPopup(me);
  destroy(me);

  CellEditorPrototype getPrototype() {
    var result = new CellEditorPrototype();
    result.init = allowInteropCaptureThis(init);
    result.getGui = allowInteropCaptureThis(getGui);
    result.afterGuiAttached = allowInteropCaptureThis(afterGuiAttached);
    result.getValue = allowInteropCaptureThis(getValue);
    result.isPopup = allowInteropCaptureThis(isPopup);
    result.destroy = allowInteropCaptureThis(destroy);
    return result;
  }
}
