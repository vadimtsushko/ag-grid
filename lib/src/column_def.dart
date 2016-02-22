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
  external Func1<RendererParam, String> get headerValueGetter;
  /** Set to true for this column to be hidden. Naturally you might think, it would make more sense to call this field 'visible' and mark it false to hide,
   *  however we want all default values to be false and we want columns to be visible by default. */
  external bool get hide;
  /** Whether this column is pinned or not. */
  external bool get pinned;
  /** Tooltip for the column header */
  external String get headerTooltip;
  /** Expression or function to get the cells value. */
  external String get valueGetter;
  /** To provide custom rendering to the header. */
  external Function get headerCellRenderer;
  /** To provide a template for the header.
  headerCellTemplate?: ((params: any) => string | HTMLElement) | string | HTMLElement; */
  external Func1<RendererParam, String> get headerCellTemplate;

  /** Initial width, in pixels, of the cell */
  external int get width;
  /** Min width, in pixels, of the cell */
  external int get minWidth;
  /** Max width, in pixels, of the cell */
  external int get maxWidth;

  /** Class to use for the cell. Can be string, array of strings, or function.
  cellClass?: string | string[] | ((cellClassParams: any) => string | string[]); */
  external get cellClass;
  /** An object of css values. Or a function returning an object of css values.
  cellStyle?: {} | ((params: any) => {}); */
  external get cellStyle;
  /** A function for rendering a cell.
  cellRenderer?: Function | {}; */
  external Func1<RendererParam, String> get cellRenderer;

  /** A function for rendering a floating cell.
  floatingCellRenderer?: Function | {};*/
  external Func1<RendererParam, String> get floatingCellRenderer;
  /** Name of function to use for aggregation. One of [sum,min,max]. */
  external String get aggFunc;
  /** To group by this column by default, provide an index here. */
  external int get rowGroupIndex;

  /** Comparator function for custom sorting.
  comparator?: (valueA: any, valueB: any, nodeA?: RowNode, nodeB?: RowNode, isInverted?: boolean) => number;
      */
  /**Set to true to render a selection checkbox in the column.
  checkboxSelection?: boolean | (Function);
      */
  external get checkboxSelection;
  /** Set to true if no menu should be shown for this column header. */
  external bool get suppressMenu;


  /** Set to true if no sorting should be done for this column. */

  external bool get suppressSorting;
  /** Set to true to not allow moving this column via dragging it's header */
  external bool get suppressMovable;
  /** Set to true if you want the unsorted icon to be shown when no sort is applied to this column. */
  external bool get unSortIcon;
  /** Set to true if you want this columns width to be fixed during 'size to fit' operation. */
  external bool get suppressSizeToFit;
  /** Set to true if you do not want this column to be resizable by dragging it's edge. */
  external bool get suppressResize;
  /** Set to true if you do not want this column to be auto-resizable by double clicking it's edge. */
  external bool get suppressAutoSize;

  external factory ColumnDef(
      {String headerName,
      String columnGroupShow,
      headerClass,
      String colId,
      String sort,
      String field,
      int sortedAt,
      List<String> sortingOrder,
      bool hide,
      bool pinned,
      String headerTooltip,
      String valueGetter,
      Function headerCellRenderer,
      Func1<RendererParam, String> headerCellTemplate,
      int width,
      int maxWidth,
      int minWidth,
      cellClass,
      cellStyle,
      Func1<RendererParam, String> cellRenderer,
      Func1<RendererParam, String> floatingCellRenderer,
      String aggFunc,
      int rowGroupIndex,
      bool suppressMenu,
      bool suppressSorting,
      bool suppressMovable,
      bool unSortIcon,
      bool suppressSizeToFit,
      bool suppressResize,
      bool suppressAutoSize,
      checkboxSelection,
      Func1<RendererParam, String> headerValueGetter});
}
