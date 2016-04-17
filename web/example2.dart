// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";

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

void main() {
  initialiseAgGridWithWebComponents();

  var gridDiv = querySelector('#myGrid');
  var columnDefs = [
    new ColumnDef(
        headerName: '',
        width: 25,
        checkboxSelection: true,
        suppressSorting: true,
        headerCellRenderer: allowInterop(headerCellRendererFunc),
        suppressMenu: true,
        pinned: true),
    new ColumnDef(headerName: 'Make', field: 'make'),
    new ColumnDef(headerName: 'Model', field: 'model'),
    new ColumnDef(headerName: 'Price', field: 'price')
  ];

  var rowData = new JsObject.jsify([
    {'make': "Toyota", 'model': "Celica", 'price': 35000},
    {'make': "Ford", 'model': "Mondeo", 'price': 32000},
    {'make': "Porsche", 'model': "Boxter", 'price': 72000}
  ]);

  GridOptions go = new GridOptions(
      columnDefs: columnDefs,
      rowData: rowData,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      rowDeselection: true,
//      suppressRowClickSelection: true,
      suppressCellSelection: true,
      localeText: russianLocale(),
      enableColResize: true);
  new Grid(gridDiv, go);
}
