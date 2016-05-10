/// Warning! That file is generated. Do not edit it manually

part of agGrid;
@JS()
@anonymous
class MenuItem {
  external String get name;
  external set name(String value);
  external bool get disabled;
  external set disabled(bool value);
  external String get shortcut;
  external set shortcut(String value);
  external VoidFunc0 get action;
  external set action(VoidFunc0 value);
  external bool get checked;
  external set checked(bool value);
  external dynamic get icon;
  external set icon(dynamic value);
  external factory MenuItem ({
    String name,
    bool disabled,
    String shortcut,
    VoidFunc0 action,
    bool checked,
    dynamic icon});
}

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
class getNodeChildDetailsResult {
  external bool get group;
  external set group(bool value);
  external List get children;
  external set children(List value);
  external bool get expanded;
  external set expanded(bool value);
  external String get field;
  external set field(String value);
  external String get key;
  external set key(String value);
  external factory getNodeChildDetailsResult ({
    bool group,
    List children,
    bool expanded,
    String field,
    String key});
}

@JS()
@anonymous
class GridOptions {
  external GridApi get api;
  external set api(GridApi value);
  external ColumnApi get columnApi;
  external set columnApi(ColumnApi value);
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
  external bool get singleClickEdit;
  external set singleClickEdit(bool value);
  external int get headerHeight;
  external set headerHeight(int value);
  external String get rowSelection;
  external set rowSelection(String value);
  external LocaleText get localeText;
  external set localeText(LocaleText value);
  external bool get enableServerSideFilter;
  external set enableServerSideFilter(bool value);
  external StringIcons get icons;
  external set icons(StringIcons value);
  external bool get suppressMenuFilterPanel;
  external set suppressMenuFilterPanel(bool value);
  external bool get suppressMenuMainPanel;
  external set suppressMenuMainPanel(bool value);
  external bool get suppressMenuColumnPanel;
  external set suppressMenuColumnPanel(bool value);
  external Function get getNodeChildDetails;
  external set getNodeChildDetails(Function value);
  external Function get getContextMenuItems;
  external set getContextMenuItems(Function value);
  external String get rowModelType;
  external set rowModelType(String value);
  external VoidFunc1<RendererParam> get onCellClicked;
  external set onCellClicked(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onCellDoubleClicked;
  external set onCellDoubleClicked(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onCellContextMenu;
  external set onCellContextMenu(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onCellValueChanged;
  external set onCellValueChanged(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onCellFocused;
  external set onCellFocused(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onRowClicked;
  external set onRowClicked(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onRowDoubleClicked;
  external set onRowDoubleClicked(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onRowSelected;
  external set onRowSelected(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onRowDeselected;
  external set onRowDeselected(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onGridReady;
  external set onGridReady(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onVirtualRowRemoved;
  external set onVirtualRowRemoved(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onGridSizeChanged;
  external set onGridSizeChanged(VoidFunc1<RendererParam> value);
  external VoidFunc0 get onModelUpdated;
  external set onModelUpdated(VoidFunc0 value);
  external VoidFunc0 get onSelectionChanged;
  external set onSelectionChanged(VoidFunc0 value);
  external VoidFunc1 get onBeforeFilterChanged;
  external set onBeforeFilterChanged(VoidFunc1 value);
  external VoidFunc0 get onAfterFilterChanged;
  external set onAfterFilterChanged(VoidFunc0 value);
  external VoidFunc0 get onFilterModified;
  external set onFilterModified(VoidFunc0 value);
  external VoidFunc0 get onBeforeSortChanged;
  external set onBeforeSortChanged(VoidFunc0 value);
  external VoidFunc0 get onAfterSortChanged;
  external set onAfterSortChanged(VoidFunc0 value);
  external Func0<bool> get isExternalFilterPresent;
  external set isExternalFilterPresent(Func0<bool> value);
  external Func1<RowNode, bool> get doesExternalFilterPass;
  external set doesExternalFilterPass(Func1<RowNode, bool> value);
  external factory GridOptions ({
    GridApi api,
    ColumnApi columnApi,
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
    bool singleClickEdit,
    int headerHeight,
    String rowSelection,
    LocaleText localeText,
    bool enableServerSideFilter,
    StringIcons icons,
    bool suppressMenuFilterPanel,
    bool suppressMenuMainPanel,
    bool suppressMenuColumnPanel,
    Function getNodeChildDetails,
    Function getContextMenuItems,
    String rowModelType,
    VoidFunc1<RendererParam> onCellClicked,
    VoidFunc1<RendererParam> onCellDoubleClicked,
    VoidFunc1<RendererParam> onCellContextMenu,
    VoidFunc1<RendererParam> onCellValueChanged,
    VoidFunc1<RendererParam> onCellFocused,
    VoidFunc1<RendererParam> onRowClicked,
    VoidFunc1<RendererParam> onRowDoubleClicked,
    VoidFunc1<RendererParam> onRowSelected,
    VoidFunc1<RendererParam> onRowDeselected,
    VoidFunc1<RendererParam> onGridReady,
    VoidFunc1<RendererParam> onVirtualRowRemoved,
    VoidFunc1<RendererParam> onGridSizeChanged,
    VoidFunc0 onModelUpdated,
    VoidFunc0 onSelectionChanged,
    VoidFunc1 onBeforeFilterChanged,
    VoidFunc0 onAfterFilterChanged,
    VoidFunc0 onFilterModified,
    VoidFunc0 onBeforeSortChanged,
    VoidFunc0 onAfterSortChanged,
    Func0<bool> isExternalFilterPresent,
    Func1<RowNode, bool> doesExternalFilterPass});
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
  external String get notEqual;
  external set notEqual(String value);
  external String get greaterThanOrEqual;
  external set greaterThanOrEqual(String value);
  external String get lessThanOrEqual;
  external set lessThanOrEqual(String value);
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
  external String get noRowsToShow;
  external set noRowsToShow(String value);
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
    String notEqual,
    String greaterThanOrEqual,
    String lessThanOrEqual,
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
    String valueColumnsEmptyMessage,
    String noRowsToShow});
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
  external dynamic get editable;
  external set editable(dynamic value);
  external bool get pinned;
  external set pinned(bool value);
  external String get headerTooltip;
  external set headerTooltip(String value);
  external String get valueGetter;
  external set valueGetter(String value);
  external Function get headerCellRenderer;
  external set headerCellRenderer(Function value);
  external GroupCellRenderer get cellRendererParams;
  external set cellRendererParams(GroupCellRenderer value);
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
  external VoidFunc1<RendererParam> get newValueHandler;
  external set newValueHandler(VoidFunc1<RendererParam> value);
  external VoidFunc1<RendererParam> get onCellValueChanged;
  external set onCellValueChanged(VoidFunc1<RendererParam> value);
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
  external Function get comparator;
  external set comparator(Function value);
  external String get filter;
  external set filter(String value);
  external FilterParams get filterParams;
  external set filterParams(FilterParams value);
  external Func1<RendererParam, String> get headerValueGetter;
  external set headerValueGetter(Func1<RendererParam, String> value);
  external bool get volatile;
  external set volatile(bool value);
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
    dynamic editable,
    bool pinned,
    String headerTooltip,
    String valueGetter,
    Function headerCellRenderer,
    GroupCellRenderer cellRendererParams,
    Func1<RendererParam, String> headerCellTemplate,
    int width,
    int maxWidth,
    int minWidth,
    dynamic cellClass,
    dynamic cellStyle,
    dynamic cellRenderer,
    Func1<RendererParam, String> floatingCellRenderer,
    VoidFunc1<RendererParam> newValueHandler,
    VoidFunc1<RendererParam> onCellValueChanged,
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
    Function comparator,
    String filter,
    FilterParams filterParams,
    Func1<RendererParam, String> headerValueGetter,
    bool volatile});
}

@JS()
@anonymous
class GetContextMenuItemsParams {
  external Column get column;
  external set column(Column value);
  external GridApi get api;
  external set api(GridApi value);
  external RowNode get node;
  external set node(RowNode value);
  external dynamic get value;
  external set value(dynamic value);
  external dynamic get context;
  external set context(dynamic value);
  external dynamic get columnApi;
  external set columnApi(dynamic value);
  external factory GetContextMenuItemsParams ({
    Column column,
    GridApi api,
    RowNode node,
    dynamic value,
    dynamic context,
    dynamic columnApi});
}

@JS()
@anonymous
class FileBrowserItem {
  external bool get folder;
  external set folder(bool value);
  external bool get open;
  external set open(bool value);
  external String get name;
  external set name(String value);
  external String get size;
  external set size(String value);
  external String get type;
  external set type(String value);
  external String get dateModified;
  external set dateModified(String value);
  external List<FileBrowserItem> get children;
  external set children(List<FileBrowserItem> value);
  external factory FileBrowserItem ({
    bool folder,
    bool open,
    String name,
    String size,
    String type,
    String dateModified,
    List<FileBrowserItem> children});
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
  external dynamic get newValue;
  external set newValue(dynamic value);
  external dynamic get oldValue;
  external set oldValue(dynamic value);
  external dynamic get value;
  external set value(dynamic value);
  external factory RendererParam ({
    ColumnDef colDef,
    GridApi api,
    RowNode node,
    dynamic data,
    dynamic newValue,
    dynamic oldValue,
    dynamic value});
}

