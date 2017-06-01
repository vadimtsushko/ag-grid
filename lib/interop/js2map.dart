@JS()
library js2map;

import 'package:js/js.dart';
import 'package:js_util/js_util.dart' as js_util;

@JS('Object.getOwnPropertyNames')
external List<String> getOwnPropertyNames(o);

Map<String, Object> jsToMap(o) {
  var ret = new Map<String, Object>();
  var keys = getOwnPropertyNames(o);
  for (var k in keys) {
    ret[k] = js_util.getValue(o, k);
  }
  return ret;
}