@JS()
library custom_editor;

import 'package:js/js.dart';
import 'package:func/func.dart';
import 'package:ag_grid/ag_grid.dart';
import 'dart:html';


@JS()
@anonymous
class CellEditorWrapper {
  external VoidFunc1<CellEditorInitParams> get init;
  external set init(VoidFunc1<CellEditorInitParams> value);
  external Func0 get getGui;
  external set getGui(Func0 value);
  external VoidFunc0 get afterGuiAttached;
  external set afterGuiAttached(VoidFunc0 value);
  external Func0<String> get getValue;
  external set getValue(Func0<String> value);
  external VoidFunc0 get destroy;
  external set destroy(VoidFunc0 value);
  external Func0<bool> get isPopup;
  external set isPopup(Func0<bool> value);
  external factory CellEditorWrapper ({
  VoidFunc1 init,
  Func0 getGui,
  VoidFunc0 afterGuiAttached,
  Func0<String> getValue,
  VoidFunc0 destroy,
  Func0<bool> isPopup});
}


@anonymous
@JS()
abstract class CellEditorInitParams {
  external dynamic get value;
  external set value(dynamic v);
  external num get keyPress;
  external set keyPress(num v);
  external String get charPress;
  external set charPress(String v);
  external Column get column;
  external set column(Column v);
  external RowNode get node;
  external set node(RowNode v);
  external GridApi get api;
  external set api(GridApi v);
  external ColumnApi get columnApi;
  external set columnApi(ColumnApi v);
  external bool get cellStartedEdit;
  external set cellStartedEdit(bool v);
  external dynamic get context;
  external set context(dynamic v);
  external VoidFunc1<KeyboardEvent> get onKeyDown;
  external set onKeyDown(VoidFunc1<KeyboardEvent> v);
  external VoidFunc0 get stopEditing;
  external set stopEditing(VoidFunc0 v);
  external HtmlElement get eGridCell;
  external set eGridCell(HtmlElement v);
  external factory CellEditorInitParams(
      {dynamic value,
      num keyPress,
      String charPress,
      Column column,
      RowNode node,
      GridApi api,
      ColumnApi columnApi,
      bool cellStartedEdit,
      dynamic context,
      VoidFunc1<KeyboardEvent> onKeyDown,
      VoidFunc0 stopEditing,
      HtmlElement eGridCell});
}
