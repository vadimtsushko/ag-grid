part of agGrid;

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
    notEqual: 'Не равно',
    notEquals: 'Не равно',
    lessThanOrEqual: 'Меньше или равно',
    greaterThanOrEqual: 'Больше или равно',
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
    noRowsToShow: 'Нет строк для отображения',
    groupColumns: 'Колонки группы',
    groupColumnsEmptyMessage: 'Перетащите колонки сюда',
    valueColumns: 'Колонки значений',
    valueColumnsEmptyMessage: 'Перетащите колонки сюда'
// for filter panel

    );

String localeTextFunc(String input) {
  switch (input) {
    case 'page':
      return 'Страница';
    case 'more':
      return 'Дальше';
    case 'to':
      return 'До';
    case 'of':
      return 'Из';
    case 'next':
      return 'Следующая';
    case 'last':
      return 'Последняя';
    case 'first':
      return 'Первая';
    case 'previous':
      return 'Предыдущая';
    case 'loadingOoo':
      return 'Загрузка...';
    case 'selectAll':
      return 'Выбрать все';
    case 'searchOoo':
      return 'Поиск...';
    case 'blanks':
      return 'Пусто';
    case 'equals':
      return 'Равно';
    case 'lessThan':
      return 'Меньше чем';
    case 'notEqual':
      return 'Не равно';
    case 'notEquals':
      return 'Не равно';
    case 'lessThanOrEqual':
      return 'Меньше или равно';
    case 'greaterThanOrEqual':
      return 'Больше или равно';
    case 'greaterThan':
      return 'Больше чем';
    case 'applyFilter':
      return 'Применить';
    case 'filterOoo':
      return 'Фильтр...';
    case 'contains':
      return 'Содержит';
    case 'startsWith':
      return 'Начинается с ';
    case 'endsWith':
      return 'Заканчивается ';
    case 'group':
      return 'Группа';
    case 'columns':
      return 'Колонки';
    case 'noRowsToShow':
      return 'Нет строк для отображения';
    case 'groupColumns':
      return 'Колонки группы';
    case 'groupColumnsEmptyMessage':
      return 'Перетащите колонки сюда';
    case 'valueColumns':
      return 'Колонки значений';
    case 'valueColumnsEmptyMessage':
      return 'Перетащите колонки сюда';
    default:
      return input;
  }
}
