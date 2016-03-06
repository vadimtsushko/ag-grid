// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";
import 'package:ag_grid/js_object_api.dart' as jsObjApi;
import 'dart:async';
import 'dart:math' as math;

var pageSize = 20;
GridOptions gridOptions;
List allOfTheData;

rowNumCellRendererFunc(RendererParam params) {
//  var keys = obj.keys(p);
//  print('Params keys: $keys');
  return params.node.id + 1;
}

List sortData(List<SortModelItem> sortModel, List<Map> data) {
  var sortPresent = sortModel != null && sortModel.length > 0;
  if (!sortPresent) {
    return data;
  }
  // do an in memory sort of the data,
  // assuming sorting by only one column
  var sortColId = sortModel[0].colId;
  var sortDirection = sortModel[0].sort == 'asc' ? 1 : -1;
  var resultOfSort = new List.from(data);
  resultOfSort
      .sort((a, b) => a[sortColId].compareTo(b[sortColId]) * sortDirection);
  return resultOfSort;
}

List filterData(filterModel, List data) {
  var filterMap = {};
  print('FilterModel: $filterModel');
  if (filterModel != null) {
    filterMap = jsObjApi.toMap(filterModel);
    print('filterMap: $filterMap');
  }
  if (filterMap.isEmpty) {
    return data;
  }
  Set<String> yearsToFilter;
  if (filterMap.containsKey('year')) {
    yearsToFilter = new Set<String>.from(filterMap['year']);
  }

  Set<String> countriesToFilter;
  if (filterMap.containsKey('country')) {
    countriesToFilter = new Set<String>.from(filterMap['country']);
  }
  int ageFilterType;
  int ageFilterValue;
  if (filterMap.containsKey('age')) {
    var ageFilterMap = jsObjApi.toMap(filterMap['age']);
    print('ageFilterMap $ageFilterMap');
    ageFilterValue = int.parse(ageFilterMap['filter'].toString());
    ageFilterType = int.parse(ageFilterMap['type'].toString());
  }
  var resultOfFilter = [];
  for (var i = 0; i < data.length; i++) {
    var item = data[i];

    if (ageFilterType != null) {
      var age = item['age'];
      if (age == null) {
        continue;
      }
      if (ageFilterType == FilterType.EQUALS) {
        if (age != ageFilterValue) {
          continue;
        }
      } else if (ageFilterType == FilterType.LESS_THAN) {
        if (age >= ageFilterValue) {
          continue;
        }
      } else {
        if (age <= ageFilterValue) {
          continue;
        }
      }
    }
    if (countriesToFilter != null) {
      if (!countriesToFilter.contains(item['country'].toString())) {
        // year didn't match, so skip this record
        continue;
      }
    }



    if (yearsToFilter != null) {
      if (!yearsToFilter.contains(item['year'].toString())) {
        // year didn't match, so skip this record
        continue;
      }
    }


    resultOfFilter.add(item);
  }

  return resultOfFilter;
}

getRows(GetRowsParam params) async {
  // this code should contact the server for rows. however for the purposes of the demo,
  // the data is generated locally, a timer is used to give the experience of
  // an asynchronous call

//    var sortModel = params.sortModel;
//    print('SortModel: $sortModel');
//    if(sortModel != null && sortModel.length > 0) {
//      var item = obj.toMap(sortModel[0]);
//      print('Sort item: $item');
//      print('Sort item colId: ${sortModel[0].colId}');
//
//    }

  print('asking for ${params.startRow} to  ${params.endRow}');
  var dataAfterSortingAndFiltering =
      sortAndFilter(params.sortModel, params.filterModel);

  await new Future.delayed(new Duration(microseconds: 5000), () {
    var lastRow = -1;
    if (dataAfterSortingAndFiltering.length <= params.endRow) {
      lastRow = dataAfterSortingAndFiltering.length;
    }

    var rowsThisPage = dataAfterSortingAndFiltering.sublist(params.startRow,
        math.min(params.endRow, dataAfterSortingAndFiltering.length));
    params.successCallback(rowsThisPage, lastRow);
  });
}

List sortAndFilter(sortModel, filterModel) {
  return sortData(sortModel, filterData(filterModel, allOfTheData));
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

main() async {
  initialiseAgGridWithWebComponents();
  var gridDiv = querySelector('#myGrid');
  var listOfCountries = [
    'United States',
    'Russia',
    'Australia',
    'Canada',
    'Norway',
    'China',
    'Zimbabwe',
    'Netherlands',
    'South Korea',
    'Croatia',
    'France',
    'Japan',
    'Hungary',
    'Germany',
    'Poland',
    'South Africa',
    'Sweden',
    'Ukraine',
    'Italy',
    'Czech Republic',
    'Austria',
    'Finland',
    'Romania',
    'Great Britain',
    'Jamaica',
    'Singapore',
    'Belarus',
    'Chile',
    'Spain',
    'Tunisia',
    'Brazil',
    'Slovakia',
    'Costa Rica',
    'Bulgaria',
    'Switzerland',
    'New Zealand',
    'Estonia',
    'Kenya',
    'Ethiopia',
    'Trinidad and Tobago',
    'Turkey',
    'Morocco',
    'Bahamas',
    'Slovenia',
    'Armenia',
    'Azerbaijan',
    'India',
    'Puerto Rico',
    'Egypt',
    'Kazakhstan',
    'Iran',
    'Georgia',
    'Lithuania',
    'Cuba',
    'Colombia',
    'Mongolia',
    'Uzbekistan',
    'North Korea',
    'Tajikistan',
    'Kyrgyzstan',
    'Greece',
    'Macedonia',
    'Moldova',
    'Chinese Taipei',
    'Indonesia',
    'Thailand',
    'Vietnam',
    'Latvia',
    'Venezuela',
    'Mexico',
    'Nigeria',
    'Qatar',
    'Serbia',
    'Serbia and Montenegro',
    'Hong Kong',
    'Denmark',
    'Portugal',
    'Argentina',
    'Afghanistan',
    'Gabon',
    'Dominican Republic',
    'Belgium',
    'Kuwait',
    'United Arab Emirates',
    'Cyprus',
    'Israel',
    'Algeria',
    'Montenegro',
    'Iceland',
    'Paraguay',
    'Cameroon',
    'Saudi Arabia',
    'Ireland',
    'Malaysia',
    'Uruguay',
    'Togo',
    'Mauritius',
    'Syria',
    'Botswana',
    'Guatemala',
    'Bahrain',
    'Grenada',
    'Uganda',
    'Sudan',
    'Ecuador',
    'Panama',
    'Eritrea',
    'Sri Lanka',
    'Mozambique',
    'Barbados'
  ];

  var columnDefs = [
    new ColumnDef(
        headerName: '#',
        width: 50,
        cellRenderer: allowInterop(rowNumCellRendererFunc),
        suppressMenu: true,
        suppressSorting: true,
        pinned: true),
    new ColumnDef(
        headerName: "Athlete",
        field: "athlete",
        width: 150,
        suppressMenu: true),
    new ColumnDef(
        headerName: "Age",
        field: "age",
        width: 90,
        filter: 'number',
        filterParams: new FilterParams(newRowsAction: 'keep', apply: true)),
    new ColumnDef(
        headerName: "Country",
        field: "country",
        width: 120,
        filter: 'set',
        filterParams: new FilterParams(
            values: listOfCountries, newRowsAction: 'keep', apply: true)),
    new ColumnDef(
        headerName: "Year",
        field: "year",
        width: 90,
        filter: 'set',
        filterParams: new FilterParams(
            values: ['2000', '2004', '2008', '2012'],
            newRowsAction: 'keep',
            apply: true)),
    new ColumnDef(
        headerName: "Date", field: "date", width: 110, suppressMenu: true),
    new ColumnDef(
        headerName: "Sport", field: "sport", width: 110, suppressMenu: true),
    new ColumnDef(
        headerName: "Gold", field: "gold", width: 100, suppressMenu: true),
    new ColumnDef(
        headerName: "Silver", field: "silver", width: 100, suppressMenu: true),
    new ColumnDef(
        headerName: "Bronze", field: "bronze", width: 100, suppressMenu: true),
    new ColumnDef(
        headerName: "Total", field: "total", width: 100, suppressMenu: true)
  ];

  gridOptions = new GridOptions(
      columnDefs: columnDefs,
      enableFilter: true,
      enableSorting: true,
      rowSelection: 'multiple',
      enableServerSideSorting: true,
      enableServerSideFilter: true,
      rowDeselection: true,
      suppressCellSelection: true,
      enableColResize: true);
  Grid grid = new Grid(gridDiv, gridOptions);
  var path = 'olympicWinners.json';
  allOfTheData = JSON.decode(await HttpRequest.getString(path));
  var rowData = new JsObject.jsify(allOfTheData);
  setRowData(rowData);
}
