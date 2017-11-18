// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'package:ag_grid/js_object_api.dart' as js_object_api;
import 'package:ag_grid/filters/date_filter_factory.dart';
import "dart:js";
import 'package:ag_grid/interop/dart_interface.dart';
import "package:js/js.dart";
import '../data.dart';

var cellStyleBoolean = new JsObject.jsify({'text-align': 'center'});

GridOptions gridOptions;
var startDateColDef;
void main() {
  DateFilterFactory filterFactory = new DateFilterFactory();
//  HtmlElement button = querySelector('#setDate');
//  button.onClick.listen((_) => setDate());
  initialiseAgGridWithWebComponents();
  setupDartInterface();
//  createClass('dartInterface', 'NumericCellEditor', NumericCellEditorMethods.getPrototype());
  var priceColumn = new ColumnDef(
      headerName: 'Price',
      field: 'price',
      editable: true,
      filter: 'number',
      width: 100);
//  priceColumn.cellEditor = allowInterop(numericCellEditorFactory);
  //assignNumericCellEditor(priceColumn);
  var gridDiv = querySelector('#myGrid');
  var columnDefs = [
    new ColumnDef(
        headerName: 'Make', field: 'make', editable: true, width: 150),
    new ColumnDef(
        headerName: 'Model', field: 'model', editable: true, width: 150),
//    new ColumnDef(headerName: 'Price', field: 'price'),
    priceColumn,
    new ColumnDef(
        headerName: 'Make date',
        field: 'makeDate',
        editable: true,
        width: 150,
        cellRenderer: allowInterop(DateFilterFactory.dateCellRenderer),
        valueGetter: allowInterop(DateFilterFactory.dateValueGetter),
        filter: filterFactory.filter,
        cellEditor: allowInterop(getDartInterface().dateCellEditorFactory)),
    new ColumnDef(
        headerName: 'Top seller',
        field: 'topSeller',
        editable: true,
        cellStyle: cellStyleBoolean,
        width: 60,
        cellEditor: allowInterop(getDartInterface().checkBoxEditorFactory),
        cellRenderer: allowInterop(booleanCellRenderer))
  ];

  var rowData = [
    new CarItem(
      make: 'Hyundai',
      model: 'Solaris',
      price: 625000,
      topSeller: '1',
      makeDate: new DateTime(2015, 1, 1)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Sonata',
        price: 1245000,
        topSeller: '1',
        makeDate: new DateTime(2017, 2, 2)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Creta',
        price: 799000,
        topSeller: '1',
        makeDate: new DateTime(2014, 3, 3)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Elantra',
        price: 957000,
        topSeller: '1',
        makeDate: new DateTime(2012, 4, 4)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Tucson',
        price: 1449900,
        topSeller: '1',
        makeDate: new DateTime(2011, 5, 5)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Santa fe',
        price: 1856000,
        topSeller: '1',
        makeDate: new DateTime(2013, 6, 6)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'Grand Santa fe',
        price: 2324000,
        topSeller: '1',
        makeDate: new DateTime(2011, 7, 7)
    ),
    new CarItem(
        make: 'Hyundai',
        model: 'H-1',
        price: 1954000,
        topSeller: '1',
        makeDate: new DateTime(2015, 8, 8)
    ),
    new CarItem(
        make: 'Skoda',
        model: 'Rapid',
        price: 611000,
        topSeller: '1',
        makeDate: new DateTime(2009, 9, 9)
    ),
    new CarItem(
        make: 'Skoda',
        model: 'Octavia',
        price: 940000,
        topSeller: '1',
        makeDate: new DateTime(2010, 10, 10)
    ),
    new CarItem(
        make: 'Skoda',
        model: 'Yeti',
        price: 1069000,
        topSeller: '1',
        makeDate: new DateTime(2016, 11, 11)
    ),
    new CarItem(
        make: 'Skoda',
        model: 'KODIAQ',
        price: 1999000,
        topSeller: '1',
        makeDate: new DateTime(2012, 12, 12)
    ),
    new CarItem(
        make: 'Skoda',
        model: 'Superb',
        price: 1300000,
        topSeller: '1',
        makeDate: new DateTime(2013, 12, 13)
    ),
    new CarItem(
        make: 'Mersedes-Benz',
        model: 'A-Class',
        price: 1660000,
        topSeller: '0'
    ),
    new CarItem(
        make: 'Mersedes-Benz',
        model: 'E-Class',
        price: 2960000,
        topSeller: '0'
    ),
    new CarItem(
        make: 'BMW',
        model: '118i',
        price: 1520000,
        topSeller: '0'
    ),
    new CarItem(
        make: 'BMW',
        model: '218i',
        price: 1790000,
        topSeller: '0'
    )
  ];

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
  gridOptions.api.sizeColumnsToFit();
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
String toRussianDate(int milliseconds) {
  if (milliseconds == null) {
    return '';
  }
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(milliseconds);
  return '${pad2(date.day)}.${pad2(date.month)}.${date.year}';
}

String formatDate(DateTime date){

  if(date == null){
    return '';
  }

  return '${pad2(date.day)}.${pad2(date.month)}.${date.year}';
}

dateCellRenderer(RendererParam params) => formatDate(params.value);

setDate() {
  FilterApi filterApi = gridOptions.api.getFilterApi(startDateColDef);
  filterApi.setFilter(new DateTime(2012, 12, 31));
  gridOptions.api.onFilterChanged();
}
