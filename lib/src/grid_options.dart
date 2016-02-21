part of agGrid;

@JS()
@anonymous
class GridOptions {
  external List<ColumnDef> get columnDefs;
  external get rowData;
  external bool get virtualPaging;
  external bool get toolPanelSuppressGroups;
  external bool get toolPanelSuppressValues;
  external bool get rowsAlreadyGrouped;
  external bool get suppressRowClickSelection;
  external bool get suppressMultiSort;
  external bool get suppressCellSelection;
  external List<String> get sortingOrder;
  external bool get suppressHorizontalScroll;
  external bool get unSortIcon;
  external int get rowBuffer;
  external bool get enableColResize;
  external bool get enableCellExpressions;
  external bool get enableSorting;
  external bool get enableServerSideSorting;
  external bool get enableFilter;
  external bool get enableServerSideFilter;
  external factory GridOptions(
      {List<ColumnDef> columnDefs,
      rowData,
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
      bool enableServerSideFilter});
}
