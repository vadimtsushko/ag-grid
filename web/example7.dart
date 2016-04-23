// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'package:ag_grid/js_object_api.dart' as js_object_api;
import "dart:js";

import "package:js/js.dart";

var cellStyleBoolean = new JsObject.jsify({'text-align': 'center'});

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
GridOptions gridOptions;
var startDateColDef;
void main() {
  HtmlElement button = querySelector('#setDate');
  button.onClick.listen((_) => setDate());
  initialiseAgGridWithWebComponents();
  startDateColDef = new ColumnDef(headerName: 'Start date',
      field: 'startDate',
      cellRenderer: allowInterop(dateCellRenderer),
      editable: false);
  assignDateFilter(startDateColDef);
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
startDateColDef,
    new ColumnDef(headerName: 'Make', field: 'make', editable: true),
    new ColumnDef(headerName: 'Model', field: 'model', editable: true),
    new ColumnDef(headerName: 'Price', field: 'price', editable: true),
//    priceColumnDef,
    new ColumnDef(
        headerName: 'Top seller',
        field: 'topSeller',
        editable: true,
        cellStyle: cellStyleBoolean,
        width: 60,
        newValueHandler: allowInterop(boolNewValueHandler),
        cellRenderer: allowInterop(booleanCellRenderer),
        filter: 'set',
        filterParams: new FilterParams(
            cellRenderer: allowInterop(booleanFilterCellRenderer),
            values: ['1','0']))
  ];

  var rowData = new JsObject.jsify([
    {'make': "Toyota", 'model': "Celica", 'price': 35000, 'topSeller': '', 'startDate': new DateTime(2013,2,3)},
    {'make': "Ford", 'model': "Mondeo", 'price': 32000, 'topSeller': '1', 'startDate': new DateTime(2012,12,31)},
    {'make': "Porsche", 'model': "Boxter", 'price': 72000, 'topSeller': '', 'startDate': new DateTime(2014,1,16)}
  ]);

  gridOptions = new GridOptions(
      columnDefs: columnDefs,
      rowData: rowData,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      rowDeselection: true,
//      suppressRowClickSelection: true,
      suppressCellSelection: false,
      localeText: russianLocale(),
      enableColResize: true);
  new Grid(gridDiv, gridOptions);
}

String booleanFilterCellRenderer(RendererParam params) {
  if (params.value == '1') {
    return "&#10004;";
  } else if (params.value == '') {
    return "&#10006;";
  } else {
    return params.value.toString();
  }
}

String booleanCellRenderer(RendererParam params) {
  if (params.value == '1') {
    return '&#10004';
  } else {
    return '';
  }
}

boolNewValueHandler(RendererParam params) {
  String value = params.newValue.toString().trim();
  if (value != '') {
    value = '1';
  }
  String fieldName = params.colDef.field;
  js_object_api.setValue(params.data, fieldName, value);
}

String pad2(int value) => value < 10 ? '0$value' : '$value';
String toRussianDate(DateTime date) {
  if (date == null) {
    return '';
  }
  return '${pad2(date.day)}.${pad2(date.month)}.${date.year}';
}

dateCellRenderer(RendererParam params) => toRussianDate(params.value);


setDate() {
  FilterApi filterApi =  gridOptions.api.getFilterApi(startDateColDef);
  filterApi.setFilter(new DateTime(2012,12,31));
  gridOptions.api.onFilterChanged();
}