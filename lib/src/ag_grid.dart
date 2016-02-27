@JS('agGrid')
library agGrid;

import "package:func/func.dart";
import "package:js/js.dart";
part 'grid_options.dart';
part 'column_def.dart';
part 'params.dart';
part 'grid_api.dart';
part 'row_node.dart';
part 'datasource.dart';
@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}
