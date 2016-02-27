// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";
import 'package:ag_grid/src/object_api.dart' as obj;
import 'dart:async';
import 'dart:math' as math;

rowNumCellRendererFunc(RendererParam params) {
//  var keys = obj.keys(p);
//  print('Params keys: $keys');
  return params.node.id + 1;
}

main() async {
  initialiseAgGridWithWebComponents();
  var gridDiv = querySelector('#myGrid');
  GridOptions gridOptions;
  List allOfTheData;
  var columnDefs = [
    new ColumnDef(
        headerName: '#',
        width: 50,
        cellRenderer: allowInterop(rowNumCellRendererFunc),
        suppressMenu: true,
        pinned: true),
    new ColumnDef(headerName: "Athlete", field: "athlete", width: 150),
    new ColumnDef(headerName: "Age", field: "age", width: 90),
    new ColumnDef(headerName: "Country", field: "country", width: 120),
    new ColumnDef(headerName: "Year", field: "year", width: 90),
    new ColumnDef(headerName: "Date", field: "date", width: 110),
    new ColumnDef(headerName: "Sport", field: "sport", width: 110),
    new ColumnDef(headerName: "Gold", field: "gold", width: 100),
    new ColumnDef(headerName: "Silver", field: "silver", width: 100),
    new ColumnDef(headerName: "Bronze", field: "bronze", width: 100),
    new ColumnDef(headerName: "Total", field: "total", width: 100)
  ];

  var pageSize = 500;

  getRows(GetRowsParam params) async {
    print('asking for ${params.startRow} to  ${params.endRow}');
    await new Future.delayed(new Duration(microseconds: 5000), () {
      var lastRow = -1;
      if (allOfTheData.length <= params.endRow) {
        lastRow = allOfTheData.length;
      }

      var rowsThisPage = allOfTheData.sublist(
          params.startRow, math.min(params.endRow, allOfTheData.length));
      params.successCallback(rowsThisPage, lastRow);
    });
  }
  createNewDatasource() {
    if (allOfTheData == null) {
      // in case user selected 'onPageSizeChanged()' before the json was loaded
      return;
    }

    var dataSource = new Datasource(
        //rowCount: ???, - not setting the row count, infinite paging will be used
        pageSize: pageSize, // changing to number, as scope keeps it as a string
        getRows: allowInterop(getRows));

    gridOptions.api.setDatasource(dataSource);
  }
  setRowData(rowData) {
    allOfTheData = rowData;
    createNewDatasource();
  }

  gridOptions = new GridOptions(
      columnDefs: columnDefs,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      rowDeselection: true,
      suppressCellSelection: true,
      enableColResize: true);
  Grid grid = new Grid(gridDiv, gridOptions);
  var path = 'olympicWinners.json';
  allOfTheData = JSON.decode(await HttpRequest.getString(path));
  var rowData = new JsObject.jsify(allOfTheData);
  setRowData(rowData);
}