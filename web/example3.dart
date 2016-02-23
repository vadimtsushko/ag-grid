// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";

headerCellRendererFunc(RendererParam params) {
  var cb = new CheckboxInputElement();
  cb.onChange.listen((event) {
    if (cb.checked) {
      params.api.forEachNodeAfterFilter(allowInterop((node, index) {
        params.api.selectNode(node, true, true);
      }));
    } else {
      params.api.deselectAll();
    }
  });
  return cb;
}

main() async {
  initialiseAgGridWithWebComponents();
  var gridDiv = querySelector('#myGrid');

  var columnDefs = [
    // this row just shows the row index, doesn't use any data from the row
//    {headerName: "#", width: 50, cellRenderer: function(params) {
//    return params.node.id + 1;
//    } },
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

//  var columnDefs = [
//    new ColumnDef(
//        headerName: '',
//        width: 25,
//        checkboxSelection: true,
//        suppressSorting: true,
//        headerCellRenderer: allowInterop(headerCellRendererFunc),
//        suppressMenu: true,
//        pinned: true),
//    new ColumnDef(headerName: 'Make', field: 'make'),
//    new ColumnDef(headerName: 'Model', field: 'model'),
//    new ColumnDef(headerName: 'Price', field: 'price')
//  ];
//


  GridOptions gridOptions = new GridOptions(
      columnDefs: columnDefs,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      rowDeselection: true,
      suppressCellSelection: true,
      enableColResize: true);
  Grid grid = new Grid(gridDiv, gridOptions);
  var path = 'olympicWinners.json';
  var allOfTheData = JSON.decode(await HttpRequest.getString(path));
  var rowData = new JsObject.jsify(allOfTheData);
  gridOptions.api.setRowData(rowData);
}
