@JS('agGrid')
library agGrid;

import 'dart:html';
import 'dart:js';
import "package:func/func.dart";
import "package:js/js.dart";


@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}

@JS()
@anonymous
class GridOptions {
  external List<ColumnDef> get columnDefs;
  external set columnDefs(List<ColumnDef> v);

  external JsObject get rowData1;
  external get rowData;
  external set rowData(JsObject v);
  external factory GridOptions();
}


//class GridOptions extends _GridOptions {
//  _GridOptions _impl = new _GridOptions();
//  List<ColumnDef> get columnDefs => _impl.columnDefs;
//  set columnDefs(List<ColumnDef> v) {
//    _impl.columnDefs = v;
//  }
//
//}

@JS()
@anonymous
class ColumnDef {
  external String get headerName;
  external String get field;
  external factory ColumnDef({String headerName, String field});
}