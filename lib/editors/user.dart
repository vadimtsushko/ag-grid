@JS()
library user;

import 'package:js/js.dart';
import 'package:func/func.dart';

@JS()
@anonymous
class User2Instanse {
  external set name(String value);
  external String get name;
  external set greeting(Func0<String> value);
  external Func0<String> get greeting;
  external set initialize(VoidFunc1<String> value);
  external VoidFunc1<String> get initialize;
  external factory User2Instanse();
}

class User2Methods {
  void initialize(User2Instanse me, String name) {
    me.name = name;
  }
  String greeting(User2Instanse me) {
    return "Hello, I'm ${me.name} from User2 class";
  }
  User2Instanse getInstance(String name) {
    User2Instanse result = new User2Instanse();
    result.greeting = allowInteropCaptureThis(greeting);
    result.name = name;
    return result;
  }
}
