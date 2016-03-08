/// Warning! That file is generated. Do not edit it manually

part of agGrid;
@JS()
@anonymous
class GetRowsParam {
  external int get startRow;
  external set startRow(int value);
  external int get endRow;
  external set endRow(int value);
  external VoidFunc2<dynamic, int> get successCallback;
  external set successCallback(VoidFunc2<dynamic, int> value);
  external VoidFunc0 get failCallback;
  external set failCallback(VoidFunc0 value);
  external List<SortModelItem> get sortModel;
  external set sortModel(List<SortModelItem> value);
  external dynamic get filterModel;
  external set filterModel(dynamic value);
  external factory GetRowsParam ({
    int startRow,
    int endRow,
    VoidFunc2<dynamic, int> successCallback,
    VoidFunc0 failCallback,
    List<SortModelItem> sortModel,
    dynamic filterModel});
}

@JS()
@anonymous
class BaseParam {
  external ColumnDef get colDef;
  external set colDef(ColumnDef value);
  external GridApi get api;
  external set api(GridApi value);
  external factory BaseParam ({
    ColumnDef colDef,
    GridApi api});
}

@JS()
@anonymous
class Datasource {
  external int get pageSize;
  external set pageSize(int value);
  external int get rowCount;
  external set rowCount(int value);
  external int get overflowSize;
  external set overflowSize(int value);
  external int get maxConcurrentRequests;
  external set maxConcurrentRequests(int value);
  external int get maxPagesInCache;
  external set maxPagesInCache(int value);
  external VoidFunc1<GetRowsParam> get getRows;
  external set getRows(VoidFunc1<GetRowsParam> value);
  external factory Datasource ({
    int pageSize,
    int rowCount,
    int overflowSize,
    int maxConcurrentRequests,
    int maxPagesInCache,
    VoidFunc1<GetRowsParam> getRows});
}

@JS()
@anonymous
class FilterParams {
  external Func1<RendererParam, String> get cellRenderer;
  external set cellRenderer(Func1<RendererParam, String> value);
  external int get cellHeight;
  external set cellHeight(int value);
  external List get values;
  external set values(List value);
  external String get newRowsAction;
  external set newRowsAction(String value);
  external bool get apply;
  external set apply(bool value);
  external bool get suppressRemoveEntries;
  external set suppressRemoveEntries(bool value);
  external factory FilterParams ({
    Func1<RendererParam, String> cellRenderer,
    int cellHeight,
    List values,
    String newRowsAction,
    bool apply,
    bool suppressRemoveEntries});
}

@JS()
@anonymous
class CsvExportParams {
  external bool get skipHeader;
  external set skipHeader(bool value);
  external bool get skipFooters;
  external set skipFooters(bool value);
  external bool get skipGroups;
  external set skipGroups(bool value);
  external bool get allColumns;
  external set allColumns(bool value);
  external String get fileName;
  external set fileName(String value);
  external String get customHeader;
  external set customHeader(String value);
  external String get customFooter;
  external set customFooter(String value);
  external String get columnSeparator;
  external set columnSeparator(String value);
  external factory CsvExportParams ({
    bool skipHeader,
    bool skipFooters,
    bool skipGroups,
    bool allColumns,
    String fileName,
    String customHeader,
    String customFooter,
    String columnSeparator});
}

@JS()
@anonymous
class GridOptions {
  external GridApi get api;
  external set api(GridApi value);
  external List<ColumnDef> get columnDefs;
  external set columnDefs(List<ColumnDef> value);
  external dynamic get rowData;
  external set rowData(dynamic value);
  external bool get virtualPaging;
  external set virtualPaging(bool value);
  external bool get toolPanelSuppressGroups;
  external set toolPanelSuppressGroups(bool value);
  external bool get toolPanelSuppressValues;
  external set toolPanelSuppressValues(bool value);
  external bool get rowsAlreadyGrouped;
  external set rowsAlreadyGrouped(bool value);
  external bool get suppressRowClickSelection;
  external set suppressRowClickSelection(bool value);
  external bool get suppressMultiSort;
  external set suppressMultiSort(bool value);
  external bool get suppressCellSelection;
  external set suppressCellSelection(bool value);
  external List<String> get sortingOrder;
  external set sortingOrder(List<String> value);
  external bool get suppressHorizontalScroll;
  external set suppressHorizontalScroll(bool value);
  external bool get unSortIcon;
  external set unSortIcon(bool value);
  external int get rowBuffer;
  external set rowBuffer(int value);
  external bool get enableColResize;
  external set enableColResize(bool value);
  external bool get enableCellExpressions;
  external set enableCellExpressions(bool value);
  external bool get enableSorting;
  external set enableSorting(bool value);
  external bool get enableServerSideSorting;
  external set enableServerSideSorting(bool value);
  external bool get enableFilter;
  external set enableFilter(bool value);
  external bool get rowDeselection;
  external set rowDeselection(bool value);
  external String get rowSelection;
  external set rowSelection(String value);
  external LocaleText get localeText;
  external set localeText(LocaleText value);
  external bool get enableServerSideFilter;
  external set enableServerSideFilter(bool value);
  external StringIcons get icons;
  external set icons(StringIcons value);
  external VoidFunc1<RendererParam> get onRowClicked;
  external set onRowClicked(VoidFunc1<RendererParam> value);
  external factory GridOptions ({
    GridApi api,
    List<ColumnDef> columnDefs,
    dynamic rowData,
    bool virtualPaging,
    bool toolPanelSuppressGroups,
    bool toolPanelSuppressValues,
    bool rowsAlreadyGrouped,
    bool suppressRowClickSelection,
    bool suppressMultiSort,
    bool suppressCellSelection,
    List<String> sortingOrder,
    bool suppressHorizontalScroll,
    bool unSortIcon,
    int rowBuffer,
    bool enableColResize,
    bool enableCellExpressions,
    bool enableSorting,
    bool enableServerSideSorting,
    bool enableFilter,
    bool rowDeselection,
    String rowSelection,
    LocaleText localeText,
    bool enableServerSideFilter,
    StringIcons icons,
    VoidFunc1<RendererParam> onRowClicked});
}

@JS()
@anonymous
class RowNode {
  external int get id;
  external set id(int value);
  external dynamic get data;
  external set data(dynamic value);
  external RowNode get parent;
  external set parent(RowNode value);
  external int get level;
  external set level(int value);
  external bool get group;
  external set group(bool value);
  external bool get firstChild;
  external set firstChild(bool value);
  external bool get lastChild;
  external set lastChild(bool value);
  external int get childIndex;
  external set childIndex(int value);
  external bool get floating;
  external set floating(bool value);
  external bool get floatingTop;
  external set floatingTop(bool value);
  external bool get floatingBottom;
  external set floatingBottom(bool value);
  external String get quickFilterAggregateText;
  external set quickFilterAggregateText(String value);
  external bool get footer;
  external set footer(bool value);
  external List<RowNode> get children;
  external set children(List<RowNode> value);
  external String get field;
  external set field(String value);
  external dynamic get key;
  external set key(dynamic value);
  external List<RowNode> get childrenAfterFilter;
  external set childrenAfterFilter(List<RowNode> value);
  external List<RowNode> get childrenAfterSort;
  external set childrenAfterSort(List<RowNode> value);
  external int get allChildrenCount;
  external set allChildrenCount(int value);
  external bool get expanded;
  external set expanded(bool value);
  external RowNode get sibling;
  external set sibling(RowNode value);
  external num get rowHeight;
  external set rowHeight(num value);
  external num get rowTop;
  external set rowTop(num value);
  external factory RowNode ({
    int id,
    dynamic data,
    RowNode parent,
    int level,
    bool group,
    bool firstChild,
    bool lastChild,
    int childIndex,
    bool floating,
    bool floatingTop,
    bool floatingBottom,
    String quickFilterAggregateText,
    bool footer,
    List<RowNode> children,
    String field,
    dynamic key,
    List<RowNode> childrenAfterFilter,
    List<RowNode> childrenAfterSort,
    int allChildrenCount,
    bool expanded,
    RowNode sibling,
    num rowHeight,
    num rowTop});
}

@JS()
@anonymous
class LocaleText {
  external String get page;
  external set page(String value);
  external String get more;
  external set more(String value);
  external String get to;
  external set to(String value);
  external String get of;
  external set of(String value);
  external String get next;
  external set next(String value);
  external String get last;
  external set last(String value);
  external String get first;
  external set first(String value);
  external String get previous;
  external set previous(String value);
  external String get loadingOoo;
  external set loadingOoo(String value);
  external String get selectAll;
  external set selectAll(String value);
  external String get searchOoo;
  external set searchOoo(String value);
  external String get blanks;
  external set blanks(String value);
  external String get equals;
  external set equals(String value);
  external String get lessThan;
  external set lessThan(String value);
  external String get greaterThan;
  external set greaterThan(String value);
  external String get applyFilter;
  external set applyFilter(String value);
  external String get filterOoo;
  external set filterOoo(String value);
  external String get contains;
  external set contains(String value);
  external String get startsWith;
  external set startsWith(String value);
  external String get endsWith;
  external set endsWith(String value);
  external String get group;
  external set group(String value);
  external String get columns;
  external set columns(String value);
  external String get groupColumns;
  external set groupColumns(String value);
  external String get groupColumnsEmptyMessage;
  external set groupColumnsEmptyMessage(String value);
  external String get valueColumns;
  external set valueColumns(String value);
  external String get valueColumnsEmptyMessage;
  external set valueColumnsEmptyMessage(String value);
  external factory LocaleText ({
    String page,
    String more,
    String to,
    String of,
    String next,
    String last,
    String first,
    String previous,
    String loadingOoo,
    String selectAll,
    String searchOoo,
    String blanks,
    String equals,
    String lessThan,
    String greaterThan,
    String applyFilter,
    String filterOoo,
    String contains,
    String startsWith,
    String endsWith,
    String group,
    String columns,
    String groupColumns,
    String groupColumnsEmptyMessage,
    String valueColumns,
    String valueColumnsEmptyMessage});
}

@JS()
@anonymous
class AbstractColDef {
  external String get headerName;
  external set headerName(String value);
  external String get columnGroupShow;
  external set columnGroupShow(String value);
  external dynamic get headerClass;
  external set headerClass(dynamic value);
  external factory AbstractColDef ({
    String headerName,
    String columnGroupShow,
    dynamic headerClass});
}

@JS()
@anonymous
class SortModelItem {
  external String get colId;
  external set colId(String value);
  external String get sort;
  external set sort(String value);
  external factory SortModelItem ({
    String colId,
    String sort});
}

@JS()
@anonymous
class StringIcons {
  external String get menu;
  external set menu(String value);
  external String get filter;
  external set filter(String value);
  external String get sortAscending;
  external set sortAscending(String value);
  external String get sortDescending;
  external set sortDescending(String value);
  external String get sortUnSort;
  external set sortUnSort(String value);
  external String get groupExpanded;
  external set groupExpanded(String value);
  external String get groupContracted;
  external set groupContracted(String value);
  external String get columnGroupOpened;
  external set columnGroupOpened(String value);
  external String get columnGroupClosed;
  external set columnGroupClosed(String value);
  external String get columnVisible;
  external set columnVisible(String value);
  external String get columnHidden;
  external set columnHidden(String value);
  external String get columnRemoveFromGroup;
  external set columnRemoveFromGroup(String value);
  external factory StringIcons ({
    String menu,
    String filter,
    String sortAscending,
    String sortDescending,
    String sortUnSort,
    String groupExpanded,
    String groupContracted,
    String columnGroupOpened,
    String columnGroupClosed,
    String columnVisible,
    String columnHidden,
    String columnRemoveFromGroup});
}

@JS()
@anonymous
class GroupCellRenderer {
  external String get renderer;
  external set renderer(String value);
  external dynamic get keyMap;
  external set keyMap(dynamic value);
  external bool get suppressCount;
  external set suppressCount(bool value);
  external bool get checkbox;
  external set checkbox(bool value);
  external int get padding;
  external set padding(int value);
  external dynamic get innerRenderer;
  external set innerRenderer(dynamic value);
  external dynamic get footerValueGetter;
  external set footerValueGetter(dynamic value);
  external factory GroupCellRenderer ({
    String renderer,
    dynamic keyMap,
    bool suppressCount,
    bool checkbox,
    int padding,
    dynamic innerRenderer,
    dynamic footerValueGetter});
}

@JS()
@anonymous
class ColGroupDef {
  external List<AbstractColDef> get children;
  external set children(List<AbstractColDef> value);
  external String get groupId;
  external set groupId(String value);
  external String get headerName;
  external set headerName(String value);
  external String get columnGroupShow;
  external set columnGroupShow(String value);
  external dynamic get headerClass;
  external set headerClass(dynamic value);
  external factory ColGroupDef ({
    List<AbstractColDef> children,
    String groupId,
    String headerName,
    String columnGroupShow,
    dynamic headerClass});
}

@JS()
@anonymous
class ColumnDef {
  external String get headerName;
  external set headerName(String value);
  external String get columnGroupShow;
  external set columnGroupShow(String value);
  external dynamic get headerClass;
  external set headerClass(dynamic value);
  external String get colId;
  external set colId(String value);
  external String get sort;
  external set sort(String value);
  external String get field;
  external set field(String value);
  external int get sortedAt;
  external set sortedAt(int value);
  external List<String> get sortingOrder;
  external set sortingOrder(List<String> value);
  external bool get hide;
  external set hide(bool value);
  external bool get pinned;
  external set pinned(bool value);
  external String get headerTooltip;
  external set headerTooltip(String value);
  external String get valueGetter;
  external set valueGetter(String value);
  external Function get headerCellRenderer;
  external set headerCellRenderer(Function value);
  external Func1<RendererParam, String> get headerCellTemplate;
  external set headerCellTemplate(Func1<RendererParam, String> value);
  external int get width;
  external set width(int value);
  external int get maxWidth;
  external set maxWidth(int value);
  external int get minWidth;
  external set minWidth(int value);
  external dynamic get cellClass;
  external set cellClass(dynamic value);
  external dynamic get cellStyle;
  external set cellStyle(dynamic value);
  external dynamic get cellRenderer;
  external set cellRenderer(dynamic value);
  external Func1<RendererParam, String> get floatingCellRenderer;
  external set floatingCellRenderer(Func1<RendererParam, String> value);
  external String get aggFunc;
  external set aggFunc(String value);
  external int get rowGroupIndex;
  external set rowGroupIndex(int value);
  external bool get suppressMenu;
  external set suppressMenu(bool value);
  external bool get suppressSorting;
  external set suppressSorting(bool value);
  external bool get suppressMovable;
  external set suppressMovable(bool value);
  external bool get unSortIcon;
  external set unSortIcon(bool value);
  external bool get suppressSizeToFit;
  external set suppressSizeToFit(bool value);
  external bool get suppressResize;
  external set suppressResize(bool value);
  external bool get suppressAutoSize;
  external set suppressAutoSize(bool value);
  external dynamic get checkboxSelection;
  external set checkboxSelection(dynamic value);
  external String get filter;
  external set filter(String value);
  external FilterParams get filterParams;
  external set filterParams(FilterParams value);
  external Func1<RendererParam, String> get headerValueGetter;
  external set headerValueGetter(Func1<RendererParam, String> value);
  external factory ColumnDef ({
    String headerName,
    String columnGroupShow,
    dynamic headerClass,
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
    dynamic cellClass,
    dynamic cellStyle,
    dynamic cellRenderer,
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
    dynamic checkboxSelection,
    String filter,
    FilterParams filterParams,
    Func1<RendererParam, String> headerValueGetter});
}

@JS()
@anonymous
class RendererParam {
  external ColumnDef get colDef;
  external set colDef(ColumnDef value);
  external GridApi get api;
  external set api(GridApi value);
  external RowNode get node;
  external set node(RowNode value);
  external dynamic get data;
  external set data(dynamic value);
  external factory RendererParam ({
    ColumnDef colDef,
    GridApi api,
    RowNode node,
    dynamic data});
}

