// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";

rowNumCellRendererFunc(RendererParam params) {
//  var map = obj.toMap(params);
//  print('Params : $map');
  return params.node.id;
}

main() async {
  initialiseAgGridWithWebComponents();
  var gridDiv = querySelector('#myGrid');

  var columnDefs = [
    new ColumnDef(
        headerName: '#',
        width: 50,
        cellRenderer: allowInterop(rowNumCellRendererFunc),
        suppressMenu: true,
        suppressSorting: true,
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

//  var pageSize = 500;



  GridOptions gridOptions = new GridOptions(
      columnDefs: columnDefs,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      rowDeselection: true,
      suppressCellSelection: true,
      enableColResize: true);
  new Grid(gridDiv, gridOptions);
  var path = 'olympicWinners.json';
  var allOfTheData = JSON.decode(await HttpRequest.getString(path));
  var rowData = new JsObject.jsify(allOfTheData);
  gridOptions.api.setRowData(rowData);
}
