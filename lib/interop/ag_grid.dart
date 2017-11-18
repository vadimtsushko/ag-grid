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
export 'custom_editor.dart';
export 'date_helper.dart';


part 'localizations.dart';
part 'anonymous_wrappers.dart';
part 'grid_api.dart';
part 'column_api.dart';
part 'filter.dart';
part 'enterprise_rowmodel.dart';

@JS()
external initialiseAgGridWithWebComponents();

@JS()
class Grid {
  external Grid(div, GridOptions gridOptions);
}

@JS('LicenseManager.setLicenseKey')
external void setLicenseKey(String licenseKey);


class FilterType {
  static const text = 'text';
  static const number = 'number';
  static const set = 'set';
}

class NumberFilterType {
  static const EQUALS = 'equals';
  static const NOT_EQUAL = 'notEqual';
  static const LESS_THAN = 'lessThan';
  static const LESS_THAN_OR_EQUAL = 'lessThanOrEqual';
  static const GREATER_THAN = 'greaterThan';
  static const GREATER_THAN_OR_EQUAL = 'greaterThanOrEqual';
}

class TextFilterType {
  static const CONTAINS = 'contains';
  static const EQUALS = 'equals';
  static const NOT_EQUALS = 'notEquals';
  static const STARTS_WITH = 'startsWith';
  static const ENDS_WITH = 'endsWith';
}

class RegisteredEditors {
  static const text = 'text';
  static const select = 'select';
  static const popupText = 'popupText';
  static const popupSelect = 'popupSelect';
  static const largeText = 'largeText';
  static const richSelect = 'richSelect';
}
