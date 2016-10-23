part of agGrid;

@JS()
class FilterApi {
  external setFilter(value);
  external getFilter();
  external setType(String type);
  external String getType();
  external getModel();
  external setModel(model);


  external selectEverything();
  external selectValue(value);
  external selectNothing();
}
