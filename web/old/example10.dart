// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import "package:js/js.dart";
import 'dart:async';
import 'dart:math' as math;
import 'dart:js_util' as js_util;

rowNumCellRendererFunc(RendererParam params) {
//  var keys = obj.keys(p);
//  print('Params keys: $keys');
  return params.node.id;
}



main() async {
  var dateFilter = new DateHelper();
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
    new ColumnDef(
        headerName: "Athlete", field: "athlete", width: 150, filter: 'text'),
    new ColumnDef(headerName: "Age", field: "age", width: 90, filter: 'number'),
    new ColumnDef(
        headerName: "Country", field: "country", width: 120, filter: 'text'),
    new ColumnDef(
        headerName: "Date",
        field: "date",
        width: 110,
        editable: true,
        valueGetter: allowInterop(DateHelper.dateValueGetter),
        filter: dateFilter.filter,
        cellRenderer: allowInterop(DateHelper.dateCellRenderer)),
    new ColumnDef(headerName: "Sport", field: "sport", width: 110),
    new ColumnDef(
        headerName: "Gold", field: "gold", width: 100, filter: 'number'),
    new ColumnDef(
        headerName: "Silver", field: "silver", width: 100, filter: 'number'),
    new ColumnDef(
        headerName: "Bronze", field: "bronze", width: 100, filter: 'number'),
    new ColumnDef(
        headerName: "Total", field: "total", width: 100, filter: 'number')
  ];

  var pageSize = 500;

  getRows(GetRowsParam params) async {
    // this code should contact the server for rows. however for the purposes of the demo,
    // the data is generated locally, a timer is used to give the experience of
    // an asynchronous call

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
  new Grid(gridDiv, gridOptions);
  var path = 'olympicWinners.json';
  var rowData = js_util.jsify(sampleData);
  gridOptions.api.setRowData(rowData);
}

List<Map<String, dynamic>> sampleData = [
  {
    "athlete": "Michael Phelps",
    "age": 23,
    "country": "United States",
    "year": 2008,
    "date": new DateTime.utc(2008, 8, 24),
    "sport": "Swimming",
    "gold": 8,
    "silver": 0,
    "bronze": 0,
    "total": 8
  },
  {
    "athlete": "Michael Phelps",
    "age": 19,
    "country": "United States",
    "year": 2004,
    "date": new DateTime.utc(2008, 8, 29),
    "sport": "Swimming",
    "gold": 6,
    "silver": 0,
    "bronze": 2,
    "total": 8
  },
  {
    "athlete": "Michael Phelps",
    "age": 27,
    "country": "United States",
    "year": 2012,
    "date": new DateTime.utc(2012, 7, 24),
    "sport": "Swimming",
    "gold": 4,
    "silver": 2,
    "bronze": 0,
    "total": 6
  },
  {
    "athlete": "Natalie Coughlin",
    "age": 25,
    "country": "United States",
    "year": 2008,
    "date": new DateTime.utc(2011, 2, 12),
    "sport": "Swimming",
    "gold": 1,
    "silver": 2,
    "bronze": 3,
    "total": 6
  },
  {
    "athlete": "Aleksey Nemov",
    "age": 24,
    "country": "Russia",
    "year": 2000,
    "date": new DateTime.utc(2009, 7, 11),
    "sport": "Gymnastics",
    "gold": 2,
    "silver": 1,
    "bronze": 3,
    "total": 6
  },
  {
    "athlete": "Alicia Coutts",
    "age": 24,
    "country": "Australia",
    "year": 2012,
    "date": new DateTime.utc(2016, 11, 21),
    "sport": "Swimming",
    "gold": 1,
    "silver": 3,
    "bronze": 1,
    "total": 5
  },
//  {
//    "athlete": "Missy Franklin",
//    "age": 17,
//    "country": "United States",
//    "year": 2012,
//    "date": "12/08/2012",
//    "sport": "Swimming",
//    "gold": 4,
//    "silver": 0,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Ryan Lochte",
//    "age": 27,
//    "country": "United States",
//    "year": 2012,
//    "date": "12/08/2012",
//    "sport": "Swimming",
//    "gold": 2,
//    "silver": 2,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Allison Schmitt",
//    "age": 22,
//    "country": "United States",
//    "year": 2012,
//    "date": "12/08/2012",
//    "sport": "Swimming",
//    "gold": 3,
//    "silver": 1,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Natalie Coughlin",
//    "age": 21,
//    "country": "United States",
//    "year": 2004,
//    "date": "29/08/2004",
//    "sport": "Swimming",
//    "gold": 2,
//    "silver": 2,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Ian Thorpe",
//    "age": 17,
//    "country": "Australia",
//    "year": 2000,
//    "date": "01/10/2000",
//    "sport": "Swimming",
//    "gold": 3,
//    "silver": 2,
//    "bronze": 0,
//    "total": 5
//  },
//  {
//    "athlete": "Dara Torres",
//    "age": 33,
//    "country": "United States",
//    "year": 2000,
//    "date": "01/10/2000",
//    "sport": "Swimming",
//    "gold": 2,
//    "silver": 0,
//    "bronze": 3,
//    "total": 5
//  },
//  {
//    "athlete": "Cindy Klassen",
//    "age": 26,
//    "country": "Canada",
//    "year": 2006,
//    "date": "26/02/2006",
//    "sport": "Speed Skating",
//    "gold": 1,
//    "silver": 2,
//    "bronze": 2,
//    "total": 5
//  },
//  {
//    "athlete": "Nastia Liukin",
//    "age": 18,
//    "country": "United States",
//    "year": 2008,
//    "date": "24/08/2008",
//    "sport": "Gymnastics",
//    "gold": 1,
//    "silver": 3,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Marit Bjørgen",
//    "age": 29,
//    "country": "Norway",
//    "year": 2010,
//    "date": "28/02/2010",
//    "sport": "Cross Country Skiing",
//    "gold": 3,
//    "silver": 1,
//    "bronze": 1,
//    "total": 5
//  },
//  {
//    "athlete": "Sun Yang",
//    "age": 20,
//    "country": "China",
//    "year": 2012,
//    "date": "12/08/2012",
//    "sport": "Swimming",
//    "gold": 2,
//    "silver": 1,
//    "bronze": 1,
//    "total": 4
//  }
];
