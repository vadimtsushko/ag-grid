part of agGrid;

@JS()
@anonymous
class CsvExportParams {
  external bool get skipHeader;
  external set skipHeader(bool v);
  external bool get skipFooters;
  external set skipFooters(bool v);
  external bool get skipGroups;
  external set skipGroups(bool v);
  external bool get allColumns;
  external set allColumns(bool v);
  external String get fileName;
  external set fileName(String v);
  external String get customHeader;
  external set customHeader(String v);
  external String get customFooter;
  external set customFooter(String v);
  external String get columnSeparator;
  external set columnSeparator(String v);
  external factory CsvExportParams(
      {bool skipHeader,
      bool skipFooters,
      bool skipGroups,
      bool allColumns,
      String fileName,
      String customHeader,
      String customFooter,
      String columnSeparator});
}

@JS()
class GridApi {
  external String getDataAsCsv(CsvExportParams params);
  external exportDataAsCsv(CsvExportParams params);
  external setDatasource(dataSource);
  external onNewDatasource();
  external setRowData(rowData);
  external setRows(rows);
  external onNewRows();
  external setColumnDefs(List<ColumnDef> colDefs);
  external unselectAll();
/*
    refreshRows(rowNodes: RowNode[]): void;
    refreshCells(rowNodes: RowNode[], colIds: string[]): void;
*/
  external refreshRows(List rowNodes);
  external refreshCells(List, List<String> colIds);

  external rowDataChanged(rows);
  external refreshView();
  external softRefreshView();

  external bool isAnyFilterPresent();
  external bool isAdvancedFilterPresent();
  external bool isQuickFilterPresent();

  external dynamic getModel();
  external onGroupExpandedOrCollapsed(refreshFromIndex);

  external expandAll();
  external collapseAll();

  external addVirtualRowListener(
      String eventName, int rowIndex, Function callback);
  external setQuickFilter(newFilter);
  external selectIndex(index, tryMulti, suppressEvents);
  external deselectIndex(int index, bool suppressEvents);
  external void selectAll();
  external void deselectAll();
  external void recomputeAggregates();
  external void sizeColumnsToFit();
  external void showLoadingOverlay();
  external void hideOverlay();
  external void showLoading(show);
  external bool isNodeSelected(node);
  external void ensureColIndexVisible(index);

  /// ensureColumnVisible(key: string | Column | ColDef): void;

  external void ensureColumnVisible(key);
  external void selectNode(node, bool tryMulti, bool suppressEvents);
  external void forEachNodeAfterFilter(Function callback);

/*
    selectNode(node: any, tryMulti?: boolean, suppressEvents?: boolean): void;
    deselectNode(node: any, suppressEvents?: boolean): void;
    getSelectedNodesById(): {
        [nodeId: number]: RowNode;
    };
    getSelectedNodes(): RowNode[];
    getSelectedRows(): any[];
    getBestCostNodeSelection(): any;
    getRenderedNodes(): any[];
    ensureColIndexVisible(index: any): void;
    ensureColumnVisible(key: string | Column | ColDef): void;
    ensureIndexVisible(index: any): void;
    ensureNodeVisible(comparator: any): void;
    forEachInMemory(callback: Function): void;
    forEachNode(callback: Function): void;
    forEachNodeAfterFilter(callback: Function): void;
    forEachNodeAfterFilterAndSort(callback: Function): void;
    getFilterApiForColDef(colDef: any): any;
    getFilterApi(key: string | Column | ColDef): any;
    getColumnDef(key: string | Column | ColDef): ColDef;
    onFilterChanged(): void;
    setSortModel(sortModel: any): void;
    getSortModel(): {
        colId: string;
        sort: string;
    }[];
    setFilterModel(model: any): void;
    getFilterModel(): any;
    getFocusedCell(): {
        rowIndex: number;
        colId: string;
        node: RowNode;
        colDef: ColDef;
    };
    setFocusedCell(rowIndex: any, colId: any): void;
    setHeaderHeight(headerHeight: number): void;
    showToolPanel(show: any): void;
    isToolPanelShowing(): boolean;
    doLayout(): void;
    getValue(colDef: ColDef, data: any, node: any): any;
    addEventListener(eventType: string, listener: Function): void;
    addGlobalListener(listener: Function): void;
    removeEventListener(eventType: string, listener: Function): void;
    removeGlobalListener(listener: Function): void;
    dispatchEvent(eventType: string, event?: any): void;
    refreshRowGroup(): void;
    destroy(): void;

 */
}
