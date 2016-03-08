library anonymous_wrappers_proto;

import 'package:ag_grid/generator/wrapper_generator.dart';
import "package:func/func.dart";

@stub
class GridApi {}

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
}

class RowNode {
  int id;

  var data;

  RowNode parent;
  /** How many levels this node is from the top */
  int level;
  /** True if this node is a group node (ie has children) */
  bool group;
  /** True if this is the first child in this group */
  bool firstChild;
  /** True if this is the last child in this group */
  bool lastChild;
  /** The index of this node in the group */
  int childIndex;
  /** True if this row is a floating row */
  bool floating;
  /** True if this row is a floating top row */
  bool floatingTop;
  /** True if this row is a floating bottom row */
  bool floatingBottom;
  /** If using quick filter, stores a string representation of the row for searching against */
  String quickFilterAggregateText;
  /** Groups only - True if row is a footer. Footers  have group = true and footer = true */
  bool footer;
  /** Groups only - Children of this group */
  List<RowNode> children;
  /** Groups only - The field we are grouping on eg Country*/
  String field;
  /** Groups only - The key for the group eg Ireland, UK, USA */
  var key;
  /** Groups only - Filtered children of this group */
  List<RowNode> childrenAfterFilter;
  /** Groups only - Sorted children of this group */
  List<RowNode> childrenAfterSort;
  /** Groups only - Number of children and grand children */
  int allChildrenCount;
  /** Groups only - True if group is expanded, otherwise false */
  bool expanded;
  /** Groups only - If doing footers, reference to the footer node for this group */
  RowNode sibling;
  /** The height, in pixels, of this row */
  num rowHeight;
  /** The top pixel for this row */
  num rowTop;
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
  bool pinned;
  String headerTooltip;
  String valueGetter;
  Function headerCellRenderer;
  Func1<RendererParam, String> headerCellTemplate;
  int width;
  int maxWidth;
  int minWidth;
  var cellClass;
  var cellStyle;
  //Func1<RendererParam, String> cellRenderer;
  var cellRenderer;
  Func1<RendererParam, String> floatingCellRenderer;
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
  String filter;
  FilterParams filterParams;
  Func1<RendererParam, String> headerValueGetter;
}

class AbstractColDef {
  String headerName;
  String columnGroupShow;
  dynamic headerClass;
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
  int pageSize;
  int rowCount;
  int overflowSize;
  int maxConcurrentRequests;
  int maxPagesInCache;
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

class GridOptions {
  GridApi api;
  List<ColumnDef> columnDefs;
  var rowData;
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
  String rowSelection;
  LocaleText localeText;
  bool enableServerSideFilter;
  StringIcons icons;
  VoidFunc1<RendererParam> onRowClicked;
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

main() {
  new WrapperGenerator(#anonymous_wrappers_proto, fileHeader: 'part of agGrid;')
      .generateTo('anonymous_wrappers.dart');
}
