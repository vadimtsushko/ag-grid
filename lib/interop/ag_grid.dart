@JS('agGrid')
library agGrid;

import "package:func/func.dart";
import "package:js/js.dart";
import 'rownode.dart';

export 'rownode.dart';

part 'localizations.dart';
part 'anonymous_wrappers.dart';
part 'grid_api.dart';


@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}



class NumberFilterType {
  static const EQUALS = 1;
  static const LESS_THAN = 2;
  static const GREATER_THAN = 3;
}
class TextFilterType {
  static const CONTAINS = 1;
  static const EQUALS = 2;
  static const STARTS_WITH = 3;
  static const ENDS_WITH = 4;
}