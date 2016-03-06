@JS('agGrid')
library agGrid;

import "package:func/func.dart";
import "package:js/js.dart";
part 'localizations.dart';
part 'anonymous_wrappers.dart';
part 'grid_api.dart';



@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}



class FilterType {
  static const int EQUALS = 1;
  static const int LESS_THAN = 2;
  static const int GREATER_THAN = 3;
}