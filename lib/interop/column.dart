import "package:js/js.dart";
import 'ag_grid.dart';

@JS()
class Column {
  external void addEventListener(String eventType, Function listener);
  external void removeEventListener(String eventType, Function listener);
  external void setMoving(bool moving);
  external bool isMoving();
  external String getSort();
  external setSort(String sort);
  external num getSortedAt();
  external setSortedAt(num sortedAt);
  external String getAggFunc();
  external setAggFunc(String aggFunc);
  external num getLeft();
  external setLeft(num left);
  external void setPinned(/*bool| String*/ pinned);
  external bool isPinned();
  external String getPinned();
  external void setVisible(bool value);
  external bool isVisible();
  external ColumnDef getColDef();
  external String getColumnGroupShow();
  external String getColId();
  external ColumnDef getDefinition();
  external num getActualWidth();
  external setActualWidth(num value);
  external bool isGreaterThanMax(num width);
  external num getMinWidth();
  external num getMaxWidth();
  external void setMinimum();
}
