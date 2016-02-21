@JS('agGrid')
library agGrid;

import 'dart:html';
import 'dart:js';
import "package:func/func.dart";
import "package:js/js.dart";
part 'grid_options.dart';
part 'column_def.dart';
part 'params.dart';


@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}


//class GridOptions extends _GridOptions {
//  _GridOptions _impl = new _GridOptions();
//  List<ColumnDef> get columnDefs => _impl.columnDefs;
//  set columnDefs(List<ColumnDef> v) {
//    _impl.columnDefs = v;
//  }
//
//}

