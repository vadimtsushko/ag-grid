import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";
import 'dart:async';
import 'dart:math' as math;
import 'dart:js_util' as js_util;
import 'package:func/func.dart';

class IvDateFilter {
  static int NULL_DATE_VALUE = new DateTime.utc(1900).millisecondsSinceEpoch;
  SelectElement selectElement;
  DateInputElement input;
  DateFilterModel model = new DateFilterModel();

  int filterValue;

  VoidFunc0 filterChangedCallback;
  VoidFunc0 filterModifiedCallback;
  Func1<RowNode, dynamic> valueGetter;
  Func1<RowNode, bool> doesRowPassOtherFilter;

  Func0<IFilter> get filter => allowInterop(createFilter);
  IFilter createFilter() {
    IFilter result = new IFilter();
    result.getGui = allowInterop(getGui);
    result.isFilterActive = allowInterop(isFilterActive);
    result.doesFilterPass = allowInterop(doesFilterPass);
    result.afterGuiAttached = allowInterop(afterGuiAttached);
    result.getModel = allowInterop(getModel);
    result.setModel = allowInterop(setModel);
    result.setFilter = allowInterop(setFilter);
    result.setType = allowInterop(setType);
    result.getFilter = allowInterop(getFilter);
    result.getType = allowInterop(getType);

    result.init = allowInterop(init);
    return result;
  }

  getGui() {
    print('getGui');
    DivElement result = new DivElement();
    var selectDiv = new DivElement();

    selectElement = new SelectElement()
      ..className = 'ag-filter-select'
      ..id = 'filterType';
    selectElement.append(
        new OptionElement(data: 'равно', value: 'equals', selected: true));
    selectElement
        .append(new OptionElement(data: 'не равно', value: 'notEqual'));
    selectElement.append(new OptionElement(data: 'меньше', value: 'lessThan'));
    selectElement.append(
        new OptionElement(data: 'меньше или равно', value: 'lessThanOrEqual'));
    selectElement
        .append(new OptionElement(data: 'больше', value: 'greaterThan'));
    selectElement.append(new OptionElement(
        data: 'больше или равно', value: 'greaterThanOrEqual'));
    selectDiv.append(selectElement);
    result.append(selectDiv);
    var inputDiv = new DivElement();
    input = new DateInputElement()
      ..className = 'ag-filter-filter'
      ..id = 'filterText';
    inputDiv.append(input);
    result.append(inputDiv);
    selectElement.onChange.listen((_) => onTypeChanged());
    input.onChange.listen((_) => onFilterChanged());
    return result;
  }

  init(IFilterParams params) {
    valueGetter = params.valueGetter;
    filterChangedCallback = params.filterChangedCallback;
    filterModifiedCallback = params.filterModifiedCallback;
    doesRowPassOtherFilter = params.doesRowPassOtherFilter;
  }

  DateFilterModel getModel() {
    model.filterType = selectElement.value;
    model.filterValue = filterValue;
    return model;
  }

  setModel(DateFilterModel value) {
    model = value;
  }

  afterGuiAttached(IAfterFilterGuiAttachedParams params) {
    input.focus();
  }

  bool isFilterActive() {
    print('isFilterActive');
    return filterValue != null;
  }

  bool doesFilterPass(IDoesFilterPassParams params) {
    if (filterValue == NULL_DATE_VALUE) {
      return false;
    }
    if (filterValue == null) {
      return true;
    }
    int nodeValue = valueGetter(params as RowNode);
    print('$nodeValue ${model.filterType} $filterValue');
    switch (model.filterType) {
      case NumberFilterType.EQUALS:
        return nodeValue == filterValue;
      case NumberFilterType.NOT_EQUAL:
        return nodeValue != filterValue;
      case NumberFilterType.LESS_THAN:
        return nodeValue < filterValue;
      case NumberFilterType.LESS_THAN_OR_EQUAL:
        return nodeValue <= filterValue;
      case NumberFilterType.GREATER_THAN:
        return nodeValue > filterValue;
      case NumberFilterType.GREATER_THAN_OR_EQUAL:
        return nodeValue >= filterValue;
    }
    return false;
  }

  onTypeChanged() {
    model.filterType = selectElement.value;
    this.filterChanged();
  }

  String getType() => model.filterType;
  setType(String value) {
    selectElement.value = value;
    model.filterType = value;
    filterChanged();
  }

  getFilter() => model.filterValue;
  setFilter(value) {
    print('setFilter "$value"');
    if (value == null || value == '') {
      filterValue = null;
    }
    if (value is DateTime) {
      filterValue = value.millisecondsSinceEpoch;
    }
    if (value is num) {
      filterValue = value.toInt();
    }
    if (value is String) {
      var toParse = value.trim();
      if (value == '') {
        filterValue = null;
      } else {
        filterValue = int.parse(value);
      }

    }

    if (filterValue == null) {
      input.value = '';
    } else {
      input.valueAsDate =
          new DateTime.fromMillisecondsSinceEpoch(value);
    }
    filterChanged();
  }

  filterChanged() {
    print('DateFilter filterChanged');
//    this.filterModifiedCallback();
    this.filterChangedCallback();
  }

  onFilterChanged() {
    int oldValue = filterValue;
    filterValue = getNewValue();
    print('onFilterChanged oldValue: $oldValue newValue: $filterValue');
    if (oldValue != filterValue) {
      filterChanged();
    }
  }

  int getNewValue() {
//    return input.valueAsDate?.millisecondsSinceEpoch;
    String dateStr = input.value;
    print('getNewValue "$dateStr"');
    if (dateStr == '') {
      return null;
    }
    try {
      List<String> dateParts = dateStr.split('-');
      DateTime value = new DateTime.utc(int.parse(dateParts[0]),
          int.parse(dateParts[1]), int.parse(dateParts[2]));
      print(value);
      return value.millisecondsSinceEpoch;
    } catch (e) {
      return NULL_DATE_VALUE;
    }
  }
}
