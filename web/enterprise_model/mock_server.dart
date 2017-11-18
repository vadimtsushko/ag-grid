import 'package:ag_grid/ag_grid.dart';
import 'dart:js';
import 'dart:js_util';
class MockServer {
  IEnterpriseDatasource datasource;
  List data;
  void getRows(IEnterpriseGetRowsParams params) {
    print('getRows filterModel: "${params.request.filterModel}" ${params.request.filterModel}');
    var rows = jsify(data.sublist(params.request.startRow, params.request.endRow));
    params.successCallback(rows, -1);
  }
  IEnterpriseDatasource getDatasource() {
    var result = new IEnterpriseDatasource();
    result.getRows = allowInterop(this.getRows);
    return result;
  }
  setData(List allData) {
    data = allData;
  }

/*
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
        if (ageFilterType == NumberFilterType.EQUALS) {
          if (age != ageFilterValue) {
            continue;
          }
        } else if (ageFilterType == NumberFilterType.LESS_THAN) {
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
      params.successCallback(jsify(rowsThisPage), lastRow);
    });
  }

  List sortAndFilter(sortModel, filterModel) {
    return sortData(sortModel, filterData(filterModel, allOfTheData));
  }
  */

}




/*
function EnterpriseDatasource(fakeServer) {
    this.fakeServer = fakeServer;
}

EnterpriseDatasource.prototype.getRows = function(params) {
    console.log('EnterpriseDatasource.getRows: params = ', params);

    var request = params.request;

    // if we are on the top level, then group keys will be [],
    // if we are on the second level, then group keys will be like ['United States']
    var groupKeys = request.groupKeys;
    var doingTopLevel = groupKeys.length === 0;

    if (doingTopLevel) {
        this.fakeServer.getTopLevelCountryList(successCallback, request);
    } else {
        var country = request.groupKeys[0];
        this.fakeServer.getCountryDetails(successCallback, country, request);
    }

    function successCallback(resultForGrid, lastRow) {
        params.successCallback(resultForGrid, lastRow);
    }
};

function FakeServer(allData) {
    this.initData(allData);
}

FakeServer.prototype.initData = function(allData) {
    var topLevelCountryGroups = [];
    var bottomLevelCountryDetails = {}; // will be a map of [country name => records]

    allData.forEach( function(dataItem) {
        // get country this item is for
        var country = dataItem.country;

        // get the top level group for this country
        var childrenThisCountry = bottomLevelCountryDetails[country];
        var groupThisCountry = _.find(topLevelCountryGroups, {country: country});
        if (!childrenThisCountry) {
            // no group exists yet, so create it
            childrenThisCountry = [];
            bottomLevelCountryDetails[country] = childrenThisCountry;

            // add a group to the top level
            groupThisCountry = {country: country, gold: 0, silver: 0, bronze: 0};
            topLevelCountryGroups.push(groupThisCountry);
        }

        // add this record to the county group
        childrenThisCountry.push(dataItem);

        // increment the group sums
        groupThisCountry.gold += dataItem.gold;
        groupThisCountry.silver += dataItem.silver;
        groupThisCountry.bronze += dataItem.bronze;
    });

    this.topLevelCountryGroups = topLevelCountryGroups;
    this.bottomLevelCountryDetails = bottomLevelCountryDetails;

    this.topLevelCountryGroups.sort(function(a,b) { return a.country < b.country ? -1 : 1; });
};

FakeServer.prototype.sortList = function(data, sortModel) {
    var sortPresent = sortModel && sortModel.length > 0;
    if (!sortPresent) {
        return data;
    }
    // do an in memory sort of the data, across all the fields
    var resultOfSort = data.slice();
    resultOfSort.sort(function(a,b) {
        for (var k = 0; k<sortModel.length; k++) {
            var sortColModel = sortModel[k];
            var valueA = a[sortColModel.colId];
            var valueB = b[sortColModel.colId];
            // this filter didn't find a difference, move onto the next one
            if (valueA==valueB) {
                continue;
            }
            var sortDirection = sortColModel.sort === 'asc' ? 1 : -1;
            if (valueA > valueB) {
                return sortDirection;
            } else {
                return sortDirection * -1;
            }
        }
        // no filters found a difference
        return 0;
    });
    return resultOfSort;
};

// when looking for the top list, always return back the full list of countries
FakeServer.prototype.getTopLevelCountryList = function(callback, request) {

    var lastRow = this.getLastRowResult(this.topLevelCountryGroups, request);
    var rowData = this.getBlockFromResult(this.topLevelCountryGroups, request);

    // put the response into a timeout, so it looks like an async call from a server
    setTimeout( function() {
        callback(rowData, lastRow);
    }, 1000);
};

FakeServer.prototype.getCountryDetails = function(callback, country, request) {

    var countryDetails = this.bottomLevelCountryDetails[country];

    var countryDetailsSorted = this.sortList(countryDetails, request.sortModel);

    var lastRow = this.getLastRowResult(countryDetailsSorted, request);
    var rowData = this.getBlockFromResult(countryDetailsSorted, request);

    // put the response into a timeout, so it looks like an async call from a server
    setTimeout( function() {
        callback(rowData, lastRow);
    }, 1000);
};

FakeServer.prototype.getBlockFromResult = function(data, request) {
    return data.slice(request.startRow, request.endRow);
};

FakeServer.prototype.getLastRowResult = function(result, request) {
    // we mimic finding the last row. if the request exceeds the length of the
    // list, then we assume the last row is found. this would be similar to hitting
    // a database, where we have gone past the last row.
    var lastRowFound = (result.length <= request.endRow);
    var lastRow = lastRowFound ? result.length : null;
    return lastRow;
};
 */