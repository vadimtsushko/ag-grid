part of agGrid;


@JS()
class ColumnApi {
  external bool setColumnState(List<ColumnDef> columnState);
  external List<ColumnDef> getColumnState();
  external void resetColumnState();
  external setColumnWidth(key, int newWidth, [bool finished]);
  external String getDisplayNameForCol(column);
  external Column getColumn(key);
}
/*
export declare class ColumnApi {
    private _columnController;
    sizeColumnsToFit(gridWidth: any): void;
    setColumnGroupOpened(group: ColumnGroup | string, newValue: boolean, instanceId?: number): void;
    getColumnGroup(name: string, instanceId?: number): ColumnGroup;
    getDisplayNameForCol(column: any): string;
    getColumn(key: any): Column;
    setColumnState(columnState: any): boolean;
    getColumnState(): [any];
    resetColumnState(): void;
    isPinning(): boolean;
    isPinningLeft(): boolean;
    isPinningRight(): boolean;
    getDisplayedColAfter(col: Column): Column;
    getDisplayedColBefore(col: Column): Column;
    setColumnVisible(key: Column | ColDef | String, visible: boolean): void;
    setColumnsVisible(keys: (Column | ColDef | String)[], visible: boolean): void;
    setColumnPinned(key: Column | ColDef | String, pinned: string): void;
    setColumnsPinned(keys: (Column | ColDef | String)[], pinned: string): void;
    getAllColumns(): Column[];
    getDisplayedLeftColumns(): Column[];
    getDisplayedCenterColumns(): Column[];
    getDisplayedRightColumns(): Column[];
    getAllDisplayedColumns(): Column[];
    getRowGroupColumns(): Column[];
    getValueColumns(): Column[];
    moveColumn(fromIndex: number, toIndex: number): void;
    moveRowGroupColumn(fromIndex: number, toIndex: number): void;
    setColumnAggFunction(column: Column, aggFunc: string): void;
    setColumnWidth(key: Column | string | ColDef, newWidth: number, finished?: boolean): void;
    removeValueColumn(column: Column): void;
    addValueColumn(column: Column): void;
    setRowGroupColumns(colKeys: (Column | ColDef | String)[]): void;
    removeRowGroupColumn(colKey: Column | ColDef | String): void;
    removeRowGroupColumns(colKeys: (Column | ColDef | String)[]): void;
    addRowGroupColumn(colKey: Column | ColDef | String): void;
    addRowGroupColumns(colKeys: (Column | ColDef | String)[]): void;
    getLeftDisplayedColumnGroups(): ColumnGroupChild[];
    getCenterDisplayedColumnGroups(): ColumnGroupChild[];
    getRightDisplayedColumnGroups(): ColumnGroupChild[];
    getAllDisplayedColumnGroups(): ColumnGroupChild[];
    autoSizeColumn(key: Column | ColDef | String): void;
    autoSizeColumns(keys: (Column | ColDef | String)[]): void;
    columnGroupOpened(group: ColumnGroup | string, newValue: boolean): void;
    hideColumns(colIds: any, hide: any): void;
    hideColumn(colId: any, hide: any): void;
    setState(columnState: any): boolean;
    getState(): [any];
    resetState(): void;
}

 */