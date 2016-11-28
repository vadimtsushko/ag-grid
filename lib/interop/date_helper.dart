import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import "dart:js";
import 'dart:convert';
import "package:js/js.dart";
import 'dart:async';
import 'dart:math' as math;
import 'dart:js_util' as js_util;
import 'package:func/func.dart';

class DateHelper {
  static String NULL_DATE_VALUE = '0000-00-00';
  SelectElement selectElement;
  DateInputElement input;
  String filterType;
  String filterValue;

  VoidFunc0 filterChangedCallback;
  VoidFunc0 filterModifiedCallback;
  Func1<RowNode, dynamic> valueGetter;
  Func1<RowNode, bool> doesRowPassOtherFilter;
  List<StreamSubscription> subscriptions = [];

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
    result.destroy = allowInterop(destroy);
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
    subscriptions.add(selectElement.onChange.listen((_) => onTypeChanged()));
    subscriptions.add(input.onChange.listen((_) => onFilterChanged()));
    filterType = NumberFilterType.EQUALS;
    return result;
  }

  init(IFilterParams params) {
    valueGetter = params.valueGetter;
    filterChangedCallback = params.filterChangedCallback;
    filterModifiedCallback = params.filterModifiedCallback;
    doesRowPassOtherFilter = params.doesRowPassOtherFilter;
  }

  DateFilterModel getModel() {
    return new DateFilterModel(
        filterType: filterType, filterValue: filterValue);
  }

  setModel(DateFilterModel value) {
    filterType = value?.filterType;
    filterValue = value?.filterValue;
  }

  afterGuiAttached(IAfterFilterGuiAttachedParams params) {
    input.focus();
  }

  bool isFilterActive() {
    return filterValue != null;
  }

  bool doesFilterPass(IDoesFilterPassParams params) {
    if (filterValue == NULL_DATE_VALUE) {
      return false;
    }
    if (filterValue == null) {
      return true;
    }
    String nodeValue = valueGetter(params as RowNode);
    switch (filterType) {
      case NumberFilterType.EQUALS:
        return nodeValue == filterValue;
      case NumberFilterType.NOT_EQUAL:
        return nodeValue != filterValue;
      case NumberFilterType.LESS_THAN:
        return nodeValue.compareTo(filterValue) > 0;
      case NumberFilterType.LESS_THAN_OR_EQUAL:
        return nodeValue.compareTo(filterValue) >= 0;
      case NumberFilterType.GREATER_THAN:
        return nodeValue.compareTo(filterValue) < 0;
      case NumberFilterType.GREATER_THAN_OR_EQUAL:
        nodeValue.compareTo(filterValue) <= 0;
    }
    return false;
  }

  destroy() {
    for (var each in subscriptions) {
      each.cancel();
    }
  }

  onTypeChanged() {
    filterType = selectElement.value;
    this.filterChanged();
  }

  String getType() => filterType;
  setType(String value) {
    selectElement.value = value;
    filterType = value;
    filterChanged();
  }

  getFilter() => filterValue;
  setFilter(String value) {
    print('DateFilter setFilter "$value"');
    if (value.toString().trim() == '') {
      value = null;
    }
    filterValue = value;

    if (filterValue == null) {
      input.value = '';
    } else {
      input.valueAsDate = DateTime.parse(value);
    }
    filterChanged();
  }

  filterChanged() {
    print('DateFilter filterChanged');
//    this.filterModifiedCallback();
    this.filterChangedCallback();
  }

  onFilterChanged() {
    String oldValue = filterValue;
    filterValue = getNewValue();
    print('onFilterChanged oldValue: $oldValue newValue: $filterValue');
    if (oldValue != filterValue) {
      filterChanged();
    }
  }

  String getNewValue() {
//    return input.valueAsDate?.millisecondsSinceEpoch;
    DateTime value = input.valueAsDate;
    if (value == null) {
      return null;
    }
    try {
      return dateToComparableString(value);
    } catch (e) {
      return null;
    }
  }

  static String _fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "${n}";
    return "0${n}";
  }

  static String dateValueGetter(RendererParam params) {
    if (params.data == null) {
      return '';
    }
    if (js_util.hasProperty(params.data, params.colDef.field)) {
      DateTime value = js_util.getProperty(params.data, params.colDef.field);
      return dateToComparableString(value);
    }
    return '';
  }

  static String dateToComparableString(DateTime value) {
    if (value is! DateTime) {
      return '';
    }
    return '${_fourDigits(value.year)}-${_twoDigits(value.month)}-${_twoDigits(value.day)}';
  }

  static String toRussianDate(DateTime date) {
    if (date == null) {
      return '';
    }
    return '${_twoDigits(date.day)}.${_twoDigits(date.month)}.${date.year}';
  }

  static String toRussianTime(DateTime date) {
    if (date == null) {
      return '';
    }
    return '${_twoDigits(date.hour)}:${_twoDigits(date.minute)}:${date.second}';
  }

  static String dateCellRenderer(RendererParam params) {
    if (params.value == null) {
      return '';
    }
    String dateStr = params.value;
    if (dateStr == '' || dateStr == null) {
      return '';
    }
    return toRussianDate(DateTime.parse(dateStr));
  }

  static String timeCellRenderer(RendererParam params) {
    if (params.value == null) {
      return '';
    }
    String dateStr = params.value;
    if (dateStr == '' || dateStr == null) {
      return '';
    }
    return toRussianTime(DateTime.parse(dateStr));
  }
}
