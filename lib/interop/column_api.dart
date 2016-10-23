part of agGrid;


@JS()
class ColumnApi {
  external bool setColumnState(List<ColumnDef> columnState);
  external List<ColumnDef> getColumnState();
  external void resetColumnState();
  external setColumnWidth(key, int newWidth, [bool finished]);
  external String getDisplayNameForCol(column);
  external Column getColumn(key);
}
