@JS('agGrid')
library agGrid;

import "package:func/func.dart";
import "package:js/js.dart";
import 'rownode.dart';
import 'column.dart';

export 'rownode.dart';
export 'column.dart';
export 'custom_filter.dart';
export 'dart_interface.dart';

part 'localizations.dart';
part 'anonymous_wrappers.dart';
part 'grid_api.dart';
part 'column_api.dart';

@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}


class FilterType {
  static const text = 'text';
  static const number = 'number';
  static const set = 'set';
}

class NumberFilterType {
  static const EQUALS = 1;
  static const NOT_EQUAL = 2;
  static const LESS_THAN = 3;
  static const LESS_THAN_OR_EQUAL = 4;
  static const GREATER_THAN = 5;
  static const GREATER_THAN_OR_EQUAL = 6;
}
class TextFilterType {
  static const CONTAINS = 1;
  static const EQUALS = 2;
  static const NOT_EQUALS = 3;
  static const STARTS_WITH = 4;
  static const ENDS_WITH = 5;
}