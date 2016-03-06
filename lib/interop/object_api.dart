library js_object_api;
import "package:func/func.dart";
import "package:js/js.dart";

@JS()
@anonymous
class Description {
  external get value;
  external factory Description({bool configurable, bool enumerable, value});
}

@JS('Object.defineProperty')
external void defineProperty(o, String prop, Description description);

setValue(o, String key, value) =>
    defineProperty(o, key, new Description(value: value));


@JS('Object.getOwnPropertyDescriptor')
external Description getOwnPropertyDescriptor(o, String prop);

getValue(o, String key)=> getOwnPropertyDescriptor(o,key)?.value;

@JS('Object.keys')
external List<String> keys(o);

Map toMap(o) {
  Map res = {};
  for (String key in keys(o)) {
    res[key] = getValue(o,key);
  }
  return res;
}
