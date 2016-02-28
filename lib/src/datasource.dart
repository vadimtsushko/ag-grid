part of agGrid;


@JS()
@anonymous
class GetRowsParam {
  external int get startRow;
  external int get endRow;
  external VoidFunc2<dynamic,int> get successCallback;
  external VoidFunc0 get failCallback;
  external List<SortModelItem> get sortModel;
  external get filterModel;
}

@JS()
@anonymous
class SortModelItem {
  external String get colId;
  external String get sort;
}



@JS()
@anonymous
class Datasource {
  external int get pageSize;
  external int get rowCount;
  external int get overflowSize;
  external int get maxConcurrentRequests;
  external int get maxPagesInCache;
  external VoidFunc1<GetRowsParam> get getRows;

  external factory Datasource(
      {int pageSize,
      int rowCount,
      int overflowSize,
      int maxConcurrentRequests,
      int maxPagesInCache,
      VoidFunc1<GetRowsParam> getRows});
}
