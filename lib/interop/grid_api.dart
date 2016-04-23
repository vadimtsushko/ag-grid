part of agGrid;


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
  external void showNoRowsOverlay();
  external void hideOverlay();
  external void showLoading(show);
  external bool isNodeSelected(node);
  external void ensureColIndexVisible(index);

  /// ensureColumnVisible(key: string | Column | ColDef): void;

  external void ensureColumnVisible(key);
  external void selectNode(node, bool tryMulti, bool suppressEvents);
  external void forEachNodeAfterFilter(Function callback);
  external void forEachInMemory(Function callback);
  external void forEachNode(Function callback);
  external void forEachNodeAfterFilterAndSort(Function callback);
  external void destroy();
  external GridCell getFocusedCell();
  external void onFilterChanged();
  external void onBeforeFilterChanged();
  external void onAfterFilterChanged();
  external void onFilterModified();
  external void copySelectedRowsToClipboard();
  external void copySelectedRangeToClipboard();
  external List<RowNode> getSelectedNodes();
  external List getSelectedRows();
  external FilterApi getFilterApi(key);
/*
    selectNode(node: any, tryMulti?: boolean, suppressEvents?: boolean): void;
    deselectNode(node: any, suppressEvents?: boolean): void;
    getSelectedNodesById(): {
        [nodeId: number]: RowNode;
    };
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


@JS()
class GridCell {
  external int get rowIndex;
  external String get floating;
}


@JS()
class RowModel{
  external List<RowNode> getTopLevelNodes();
  external RowNode getRow(int index);
  external int getRowCount();
  external int getRowAtPixel(int pixel);
  external num getRowCombinedHeight();
  external bool isRowsToRender();
  external bool  isEmpty();
  external void expandOrCollapseAll(bool expand);
/*
export interface IRowModel {
refreshModel(step: number, fromIndex?: number): void;
forEachNode(callback: (rowNode: RowNode) => void): void;
forEachNodeAfterFilter(callback: (rowNode: RowNode) => void): void;
forEachNodeAfterFilterAndSort(callback: (rowNode: RowNode) => void): void;
expandOrCollapseAll(expand: boolean): void;
setRowData(rows: any[], refresh: boolean, firstId?: number): void;
setDatasource(datasource: any): void;
*/
}


@JS()
class FilterApi {
  external setFilter(value);
  external getFilter();
  external setType(int type);
  external int getType();
  external getModel();
  external setModel(model);


  external selectEverything();
  external selectValue(value);
}
