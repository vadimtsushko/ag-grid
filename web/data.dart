@JS()
library data;
import 'package:js/js.dart';


@JS()
@anonymous
class CarItem {
  external String get make;
  external set make(String value);
  external String get model;
  external set model(String value);
  external int get price;
  external set price(int value);
  external int get startDate;
  external set startDate(int value);
  external String get topSeller;
  external set topSeller(String value);
  external DateTime get makeDate;
  external set makeDate(DateTime value);
  external factory CarItem ({
  String make,
  String model,
  int price,
  int startDate,
  String topSeller,
  DateTime makeDate});
}
