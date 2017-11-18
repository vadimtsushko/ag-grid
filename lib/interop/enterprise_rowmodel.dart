part of agGrid;

@JS()
@anonymous
class ColumnVO {
  external String get id;
  external String get displayName;
  external String get field;
  external String get aggFunc;
}

@JS()
@anonymous
class IEnterpriseGetRowsRequest {
  external List<ColumnVO> get rowGroupCols;
  external List<ColumnVO> get valueCols;
  external List<ColumnVO> get pivotCols;
  external bool get pivotMode;
  external List<String> get groupKeys;
  external dynamic get filterModel;
  external List<SortModelItem> get sortModel;
  external int get startRow;
  external int get endRow;
}

@JS()
class IEnterpriseGetRowsParams {
  // details for the request
  IEnterpriseGetRowsRequest request;
  // success callback, pass the rows back the grid asked for.
  // if the total row count is known, provide it via lastRow, so the
  // grid can adjust the scrollbar accordingly.
  external void successCallback(List rows, int lastRow);
  // fail callback, tell the grid the call failed so it can adjust its state
  external void  failCallback();
}

@JS()
@anonymous
class IEnterpriseDatasource {
  external VoidFunc1<IEnterpriseGetRowsParams> get getRows;
  external set getRows(VoidFunc1<IEnterpriseGetRowsParams> value);
  external factory IEnterpriseDatasource ({
    VoidFunc1<IEnterpriseGetRowsParams> getRows});
}
