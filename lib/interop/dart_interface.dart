@JS()
library JsDartInterface;
import 'package:js/js.dart';
import 'package:func/func.dart';
import '../editors/checkbox.dart';
@JS()
@anonymous
class DartInterface {
  external set checkBoxEditorFactory(Func0<CheckboxCellEditorInstance> value);
  external Func0<CheckboxCellEditorInstance> get checkBoxEditorFactory;
//  external set userFactory(Func0<User2Instanse> value);
//  external Func0<User2Instanse> get userFactory;

  external factory DartInterface();
}


@JS()
external DartInterface getDartInterface();

void setupDartInterface() {
  DartInterface interface = getDartInterface();
  //interface.userFactory = allowInterop(new User2Methods().getInstance);
  interface.checkBoxEditorFactory = allowInterop(new CheckboxCellEditorMethods().getInstance);
}


