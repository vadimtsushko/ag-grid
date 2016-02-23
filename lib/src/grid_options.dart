part of agGrid;

@JS()
@anonymous
class GridOptions {
  external List<ColumnDef> get columnDefs;
  external get rowData;
  external bool get virtualPaging;
  external bool get toolPanelSuppressGroups;
  external bool get toolPanelSuppressValues;
  external bool get rowsAlreadyGrouped;
  external bool get suppressRowClickSelection;
  external bool get suppressMultiSort;
  external bool get suppressCellSelection;
  external List<String> get sortingOrder;
  external bool get suppressHorizontalScroll;
  external bool get unSortIcon;
  external int get rowBuffer;
  external bool get enableColResize;
  external bool get enableCellExpressions;
  external bool get enableSorting;
  external bool get enableServerSideSorting;
  external bool get enableFilter;
  external bool get enableServerSideFilter;
  external GridApi get api;
  external LocaleText get localeText;

  ///Type of row selection, set to either 'single' or 'multiple' to enable selection
  external String get rowSelection;

  ///Set to true or false. If true, then rows will be deselected if you hold down ctrl + click the row.
  ///Normal behaviour with the grid disallows deselection of nodes (ie once a node is selected,
  ///it remains selected until another row is selected in it's place).
  external bool get rowDeselection;
  external factory GridOptions(
      {List<ColumnDef> columnDefs,
      rowData,
      bool virtualPaging,
      bool toolPanelSuppressGroups,
      bool toolPanelSuppressValues,
      bool rowsAlreadyGrouped,
      bool suppressRowClickSelection,
      bool suppressMultiSort,
      bool suppressCellSelection,
      List<String> sortingOrder,
      bool suppressHorizontalScroll,
      bool unSortIcon,
      int rowBuffer,
      bool enableColResize,
      bool enableCellExpressions,
      bool enableSorting,
      bool enableServerSideSorting,
      bool enableFilter,
      bool rowDeselection,
      String rowSelection,
      LocaleText localeText,
      bool enableServerSideFilter});
}

@JS()
@anonymous
class LocaleText {
  external String get page;
  external String get more;
  external String get to;
  external String get of;
  external String get next;
  external String get last;
  external String get first;
  external String get previous;
  external String get loadingOoo;
  external String get selectAll;
  external String get searchOoo;
  external String get blanks;
  external String get equals;
  external String get lessThan;
  external String get greaterThan;
  external String get applyFilter;
  external String get filterOoo;
  external String get contains;
  external String get startsWith;
  external String get endsWith;
  external String get group;
  external String get columns;
  external String get groupColumns;
  external String get groupColumnsEmptyMessage;
  external String get valueColumns;
  external String get valueColumnsEmptyMessage;
  external factory LocaleText(
      {String page,
      String more,
      String to,
      String of,
      String next,
      String last,
      String first,
      String previous,
      String loadingOoo,
      String selectAll,
      String searchOoo,
      String blanks,
      String equals,
      String lessThan,
      String greaterThan,
      String applyFilter,
      String filterOoo,
      String contains,
      String startsWith,
      String endsWith,
      String group,
      String columns,
      String groupColumns,
      String groupColumnsEmptyMessage,
      String valueColumns,
      String valueColumnsEmptyMessage});
}

LocaleText russianLocale() => new LocaleText(
    page: 'Страница',
    more: 'Дальше',
    to: 'До',
    of: 'Из',
    next: 'Следующая',
    last: 'Последняя',
    first: 'Первая',
    previous: 'Предыдущая',
    loadingOoo: 'Загрузка...',
// for set filter
    selectAll: 'Выбрать все',
    searchOoo: 'Поиск...',
    blanks: 'Пусто',
// for number filter
    equals: 'Равно',
    lessThan: 'Меньше чем',
    greaterThan: 'Больше чем',
    applyFilter: 'Применить',
    filterOoo: 'Фильтр...',
// for text filter
    contains: 'Содержит',
    startsWith: 'Начинается с ',
    endsWith: 'Заканчивается ',
// the header of the default group column
    group: 'Группа',
// tool panel
    columns: 'Колонки',
    groupColumns: 'Колонки круппы',
    groupColumnsEmptyMessage: 'Перетащите колонки сюда',
    valueColumns: 'Колонки значений',
    valueColumnsEmptyMessage: 'Перетащите колонки сюда'

);
