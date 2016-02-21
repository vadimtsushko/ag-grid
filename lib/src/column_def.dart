part of agGrid;

@JS()
@anonymous
class AbstractColDef {
  /** The name to render in the column header */
  external String get headerName;

  /** Whether to show the column when the group is open / closed. */
  external String get columnGroupShow;

  /** CSS class for the header
   * string | string[] | ((params: any) => string | string[])
   */
  external get headerClass;

  external factory AbstractColDef(
      {String headerName, String columnGroupShow, headerClass});
}

class ColGroupDef {
  /** The name to render in the column header */
  external String get headerName;

  /** Whether to show the column when the group is open / closed. */
  external String get columnGroupShow;

  /** CSS class for the header
   * string | string[] | ((params: any) => string | string[])
   */
  external get headerClass;

  /** Columns in this group*/
  external List<AbstractColDef> get children;
/** Group ID */
  external String get groupId;
  external factory ColGroupDef(
      {List<AbstractColDef> children,
      String groupId,
      String headerName,
      String columnGroupShow,
      headerClass});
}

@JS()
@anonymous
class ColumnDef extends AbstractColDef {
  ///   The unique ID to give the column. This is optional. If missing, the ID will default to the field.
  ///   If both field and colId are missing, a unique ID will be generated.
  ///   This ID is used to identify the column in the API for sorting, filtering etc.
  external String get colId;

  ///  If sorting by default, set it here. Set to 'asc' or 'desc'
  external String get sort;

  ///  If sorting more than one column by default, the milliseconds when this column was sorted, so we know what order to sort the columns in.
  external int get sortedAt;

  ///  The sort order, provide an array with any of the following in any order ['asc','desc',null]
  external List<String> get sortingOrder;

  ///  The field of the row to get the cells data from
  external String get field;

  /// Expression or function to get the cells value.
  /// String | Function;
  external Func1<CallbackParam, String> get headerValueGetter;

  external factory ColumnDef({
      String headerName,
      String columnGroupShow,
      headerClass,
      String colId,
      String sort,
      String field,
int sortedAt,
      List<String> sortingOrder,
  Func1<CallbackParam, String> headerValueGetter
      });
}
