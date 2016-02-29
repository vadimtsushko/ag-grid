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
}

class BaseParam {
  ColumnDef colDef;
  GridApi api;
}

class RendererParam {
  ColumnDef colDef;
  GridApi api;
  RowNode node;
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
  Func1<RendererParam, String> cellRenderer;
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
}

main() {
  new WrapperGenerator(#anonymous_wrappers_proto, fileHeader: 'part of agGrid;')
      .generateTo('anonymous_wrappers.dart');
}
