library anonymous_wrappers_proto;

import 'package:ag_grid/generator/wrapper_generator.dart';
import "package:func/func.dart";

@stub
class GridApi {}
@stub
class RowNode {}
@stub
class RowModel {}

@stub
class Column {}
@stub
class ColumnApi {}
@stub
class HtmlElement {}


class LocaleText {
  String page;
  String more;
  String to;
  String of;
  String next;
  String last;
  String first;
  String previous;
  String loadingOoo;
  String selectAll;
  String searchOoo;
  String blanks;
  String equals;
  String notEqual;
  String notEquals;
  String greaterThanOrEqual;
  String lessThanOrEqual;
  String lessThan;
  String greaterThan;
  String applyFilter;
  String filterOoo;
  String contains;
  String startsWith;
  String endsWith;
  String group;
  String columns;
  String groupColumns;
  String groupColumnsEmptyMessage;
  String valueColumns;
  String valueColumnsEmptyMessage;
  String noRowsToShow;
}


class BaseParam {
  ColumnDef colDef;
  GridApi api;
}

class RendererParam {
  ColumnDef colDef;
  GridApi api;
  RowNode node;
  var data;
  var newValue;
  var oldValue;
  var value;
}

class ColumnDef {
  String headerName;
  String columnGroupShow;
  var headerClass;
  String colId;
  String sort;
  String field;
  int sortedAt;
  List<String> sortingOrder;
  bool hide;
  var editable;
  bool pinned;
  String headerTooltip;
  var valueGetter;
  Function headerCellRenderer;
  GroupCellRenderer cellRendererParams;
  Func1<RendererParam, String> headerCellTemplate;
  int width;
  int maxWidth;
  int minWidth;
  var cellClass;
  var cellStyle;
  //Func1<RendererParam, String> cellRenderer;
  var cellRenderer;
  Func1<RendererParam, String> floatingCellRenderer;
  VoidFunc1<RendererParam> newValueHandler;
  VoidFunc1<RendererParam> onCellValueChanged;
  String aggFunc;
  int rowGroupIndex;
  bool suppressMenu;
  bool suppressSorting;
  bool suppressMovable;
  bool unSortIcon;
  bool suppressSizeToFit;
  bool suppressResize;
  bool suppressAutoSize;
  var checkboxSelection;
  Function comparator;
  var cellEditor;
  var cellEditorParams;
  var filter;
  FilterParams filterParams;
  Func1<RendererParam, String> headerValueGetter;
  bool volatile;
}

class AbstractColDef {
  String headerName;
  String columnGroupShow;
  dynamic headerClass;
}

class CellEditorParams {
  List<String> values;
}


class ColGroupDef {
  List<AbstractColDef> children;
  String groupId;
  String headerName;
  String columnGroupShow;
  dynamic headerClass;
}

class CsvExportParams {
  bool skipHeader;
  bool skipFooters;
  bool skipGroups;
  bool allColumns;
  String fileName;
  String customHeader;
  String customFooter;
  String columnSeparator;
}

class SortModelItem {
  String colId;
  String sort;
}

class GetRowsParam {
  int startRow;
  int endRow;
  VoidFunc2<dynamic, int> successCallback;
  VoidFunc0 failCallback;
  List<SortModelItem> sortModel;
  var filterModel;
}

class Datasource {
  int rowCount;
  VoidFunc1<GetRowsParam> getRows;
}

class FilterParams {
  Func1<RendererParam, String> cellRenderer;
  int cellHeight;
  List values;
  String newRowsAction;
  bool apply;
  bool suppressRemoveEntries;
}


/// New Filter interfaces

class IFilterParams {
  Column column;
  ColumnDef colDef;
  RowModel rowModel;
  VoidFunc0 filterChangedCallback;
  VoidFunc0 filterModifiedCallback;
  Func1<RowNode,dynamic> valueGetter;
  Func1<RowNode,bool> doesRowPassOtherFilter;
  var context;
}

class IAfterFilterGuiAttachedParams {
  VoidFunc1 hidePopup;
}

class IDoesFilterPassParams {
  RowNode rowNode;
  var data;
}

class DateFilterModel {
  String filterType;
  int filterValue;
}


class IFilter {
  VoidFunc1<IFilterParams> init;
  Func0 getGui;
  Func0<bool> isFilterActive;
  Func1<IDoesFilterPassParams,bool> doesFilterPass;
  Func0 getModel;
  VoidFunc1 setModel;
  Func0<String> getType;
  VoidFunc1<String> setType;
  Func0 getFilter;
  VoidFunc1 setFilter;

  VoidFunc1<IAfterFilterGuiAttachedParams> afterGuiAttached;
  VoidFunc0 onNewRowsLoaded;
  VoidFunc0 destroy;
  Func0 getFrameworkComponentInstance;
}

class GridOptions {
  GridApi api;
  ColumnApi columnApi;
  List<ColumnDef> columnDefs;
  var rowData;
  int paginationPageSize;
  int viewportRowModelPageSize;
  int viewportRowModelBufferSize;
  int paginationOverflowSize;
  int maxConcurrentDatasourceRequests;
  int maxPagesInPaginationCache;
  bool virtualPaging;
  bool toolPanelSuppressGroups;
  bool toolPanelSuppressValues;
  bool rowsAlreadyGrouped;
  bool suppressRowClickSelection;
  bool suppressMultiSort;
  bool suppressCellSelection;
  List<String> sortingOrder;
  bool suppressHorizontalScroll;
  bool unSortIcon;
  int rowBuffer;
  bool enableColResize;
  bool enableCellExpressions;
  bool enableSorting;
  bool enableServerSideSorting;
  bool enableFilter;
  bool rowDeselection;
  bool singleClickEdit;
  int headerHeight;
  String rowSelection;
  LocaleText localeText;
  bool enableServerSideFilter;
  StringIcons icons;
  bool suppressMenuFilterPanel;
  bool suppressMenuMainPanel;
  bool suppressMenuColumnPanel;
  Function getNodeChildDetails;
  Function getContextMenuItems;
  String rowModelType;
  VoidFunc1<RendererParam> onCellClicked;
  VoidFunc1<RendererParam> onCellDoubleClicked;
  VoidFunc1<RendererParam> onCellContextMenu;
  VoidFunc1<RendererParam> onCellValueChanged;
  VoidFunc1<RendererParam> onCellFocused;
  VoidFunc1<RendererParam> onRowClicked;
  VoidFunc1<RendererParam> onRowDoubleClicked;
  VoidFunc1<RendererParam> onRowSelected;
  VoidFunc1<RendererParam> onRowDeselected;
  VoidFunc1<RendererParam> onGridReady;
  VoidFunc1<RendererParam> onVirtualRowRemoved;

  VoidFunc1<RendererParam> onGridSizeChanged;

  VoidFunc0 onModelUpdated;
  VoidFunc1 onSelectionChanged;
  VoidFunc1 onBeforeFilterChanged;
  VoidFunc1 onAfterFilterChanged;
  VoidFunc0 onFilterModified;
  VoidFunc1 onBeforeSortChanged;
  VoidFunc1 onAfterSortChanged;
  VoidFunc1 onViewportChanged;
  Func0<bool> isExternalFilterPresent;
  Func1<RowNode, bool> doesExternalFilterPass;
}

class getNodeChildDetailsResult {
  bool group;
  List children;
  bool expanded;
  String field;
  String key;
}

class StringIcons {
  String menu;
  String filter;
  String sortAscending;
  String sortDescending;
  String sortUnSort;
  String groupExpanded;
  String groupContracted;
  String columnGroupOpened;
  String columnGroupClosed;
  String columnVisible;
  String columnHidden;
  String columnRemoveFromGroup;
}

class GroupCellRenderer {
  String renderer;
  var keyMap;
  bool suppressCount;
  bool checkbox;
  int padding;
  var innerRenderer;
  var footerValueGetter;
}

class FileBrowserItem {
  bool folder;
  bool open;
  String name;
  String size;
  String type;
  String dateModified;
  List<FileBrowserItem> children;
}


class MenuItem {
  String name;
  bool disabled;
  String shortcut;
  VoidFunc0 action;
  /// set to true to provide a check beside the option
  bool checked;
  /// the icon to display beside the icon, either a DOM element or HTML string
  var icon;
}

class GetContextMenuItemsParams  {
  Column column;
  GridApi api;
  RowNode node;
  var value;
  var context;
  var columnApi;
}

class ViewportDatasource {
  VoidFunc1<ViewportDatasourceParams> init;
  VoidFunc2<int, int> setViewportRange;
  VoidFunc0 destroy;
}

class ViewportDatasourceParams {
  VoidFunc1<num> setRowCount;

  /// datasource calls this when new data arrives. The grid then updates the provided rows. The rows are mapped [rowIndex]=>rowData].
  VoidFunc1<dynamic /*JSMap of <num,dynamic>*/ > setRowData;

  /// datasource calls this when it wants a row node - typically used when it wants to update the row node
  Func1<num, dynamic> getRow;

}

//class CellEditorWrapper {
//  VoidFunc1<dynamic> init;
//  Func0<dynamic> getGui;
//  VoidFunc0 afterGuiAttached;
//  Func0<String> getValue;
//  VoidFunc0 destroy;
//  Func0<bool> isPopup;
//}

//class CarItem {
//  String make;
//  String model;
//  int price;
//  int startDate;
//  String topSeller;
//}

//class CellEditorPrototype {
//// gets called once after the editor is created
//VoidFunc1 init;
//
//// Gets called once after GUI is attached to DOM.
//// Useful if you want to focus or highlight a component
//// (this is not possible when the element is not attached)
//  VoidFunc0 afterGuiAttached;
//// Return the DOM element of your editor, this is what the grid puts into the DOM
//  Func0<HtmlElement> getGui;
//// Should return the final value to the grid, the result of the editing
//  Func0 getValue;
//
//// Gets called once by grid after editing is finished
//// if your editor needs to do any cleanup, do it here
//  VoidFunc0 destroy;
//
//// Gets called once after initialised.
//// If you return true, the editor will appear in a popup
//  Func0<bool> isPopup;
//}

main() {
  new WrapperGenerator(#anonymous_wrappers_proto, fileHeader: 'part of agGrid;')
      .generateTo('anonymous_wrappers.dart');
}
