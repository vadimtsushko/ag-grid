part of agGrid;

class FilterType {
  static const int EQUALS = 1;
  static const int LESS_THAN = 2;
  static const int GREATER_THAN = 3;
}

@JS()
@anonymous
class FilterParams {
  /// A function for rendering a cell.
  ///    cellRenderer?: Function | {};
  external Func1<RendererParam, String> get cellRenderer;
  external int get cellHeight;
  /// The values to display in the filter. Used oly in filter of type `set`
  external List get values;
  ///  What to do when new rows are loaded. The default is to reset the filter, as the set of values to select from can have changed. If you want to keep the selection, then set this value to 'keep'.
  external String get newRowsAction;
  ///  If true, the filter will not remove items that are no longer availabe due to other filters.
  external bool get suppressRemoveEntries;
  ///  Set to true to include an 'Apply' button with the filter and not filter automatically as the selection changes.
  external bool get apply;
  external factory FilterParams(
      {Func1<RendererParam, String> cellRenderer,
      int cellHeight,
      List values,
      String newRowsAction,
      bool apply,
      bool suppressRemoveEntries});
}
