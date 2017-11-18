// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'package:ag_grid/js_object_api.dart' as js_object_api;
import "dart:js";
import 'package:ag_grid/interop/dart_interface.dart';
import "package:js/js.dart";
import '../data.dart';
import 'package:func/func.dart';

var cellStyleBoolean = new JsObject.jsify({'text-align': 'center'});

GridOptions gridOptions;
var startDateColDef;
void main() {
  initialiseAgGridWithWebComponents();
  SimpleCustomTextEditor editor = new SimpleCustomTextEditor();
  setupDartInterface();
//  createClass('dartInterface', 'NumericCellEditor', NumericCellEditorMethods.getPrototype());
  var priceColumn = new ColumnDef(
      headerName: 'Price', field: 'price', editable: true, filter: 'number');
//  priceColumn.cellEditor = allowInterop(numericCellEditorFactory);
  //assignNumericCellEditor(priceColumn);
  var gridDiv = querySelector('#myGrid');
  var columnDefs = [
    new ColumnDef(headerName: 'Make', field: 'make', editable: true)
      ..cellEditor = editor.cellEditor,
    new ColumnDef(headerName: 'Model', field: 'model', editable: true),
//    new ColumnDef(headerName: 'Price', field: 'price'),
    priceColumn,
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
        make: "Toyota",
        model: "Celica",
        price: 35000,
        topSeller: '',
        startDate: new DateTime(2013, 2, 3).millisecondsSinceEpoch),
    new CarItem(
        make: "Ford",
        model: "Mondeo",
        price: 32000,
        topSeller: '1',
        startDate: new DateTime(2012, 12, 31).millisecondsSinceEpoch),
    new CarItem(
        make: "Porsche",
        model: "Boxter",
        price: 72000,
        topSeller: '',
        startDate: new DateTime(2014, 1, 16).millisecondsSinceEpoch)
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

dateCellRenderer(RendererParam params) => toRussianDate(params.value);

setDate() {
  FilterApi filterApi = gridOptions.api.getFilterApi(startDateColDef);
  filterApi.setFilter(new DateTime(2012, 12, 31));
  gridOptions.api.onFilterChanged();
}

class SimpleCustomTextEditor {
  InputElement input;
  Func0<CellEditorWrapper> get cellEditor => allowInterop(createCustomEditor);

  CellEditorWrapper createCustomEditor() {
    CellEditorWrapper result = new CellEditorWrapper();
    result.init = allowInterop((CellEditorInitParams params) {
      print('CellEditorWrapper init');
      input = new InputElement();
      input.value = params.value;
    });

    result.getGui = allowInterop(() {
      print('CellEditorWrapper getGui');
      return input;
    });

    result.afterGuiAttached = allowInterop(() {
      print('CellEditorWrapper afterGuiAttached');
      input.focus();
      input.select();
    });

    result.getValue = allowInterop(() {
      print('CellEditorWrapper getValue');
      return input.value.toUpperCase();
    });

    result.isPopup = allowInterop(() {
      print('CellEditorWrapper isPopup');
      return true;
    });

    result.destroy = allowInterop(() {
      print('CellEditorWrapper destroy');
      input = null;
    });

    return result;
  }
}
