@JS()
library date_cell_editor;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';

@JS()
@anonymous
class DateCellEditor {
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

  external set input(DateInputElement value);
  external DateInputElement get input;
  external factory DateCellEditor();
}