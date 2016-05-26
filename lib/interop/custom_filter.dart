@JS()
library custom_filter;


import "package:js/js.dart";

@JS()
external assignDateFilter(colDef);


@JS('DateFilter')
class JsDateFilter {
  external factory JsDateFilter();
}

JsDateFilter dateFilterFactory() => new JsDateFilter();

