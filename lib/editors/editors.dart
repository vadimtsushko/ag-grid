
import 'numeric.dart';

import '../interop/dart_interface.dart';
import 'select.dart';
import 'checkbox.dart';

export 'numeric.dart';

selectCellEditorFactory() => new SelectCellEditor();
numericCellEditorFactory() => new NumericCellEditor();
checkboxCellEditorFactory() => new CheckboxCellEditor();

initEditors() {
  createClass('NumericCellEditor', NumericCellEditorMethods.getPrototype());
  createClass('SelectCellEditor', SelectCellEditorMethods.getPrototype());
  createClass('CheckboxCellEditor', new CheckboxCellEditorMethods().getPrototype());
}
