// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'dart:js_util';

void main() {
  var gridDiv = querySelector('#myGrid');
  var columnDefs = [
    new ColumnDef(headerName: 'Make', field: 'make'),
    new ColumnDef(headerName: 'Model', field: 'model'),
    new ColumnDef(headerName: 'Price', field: 'price')
  ];

  var rowData = jsify([
    {'make': "Toyota", 'model': "Celica", 'price': 35000},
    {'make': "Ford", 'model': "Mondeo", 'price': 32000},
    {'make': "Porsche", 'model': "Boxter", 'price': 72000}
  ]);

  GridOptions go = new GridOptions(
      columnDefs: columnDefs,
      rowData: rowData,
      enableFilter: true,
      enableSorting: true,
      enableColResize: true);
  new Grid(gridDiv, go);
}
