@JS()
library rownode;
import "package:js/js.dart";

@JS()
class RowNode {
  external int get id;
  external set id(int value);
  external dynamic get data;
  external set data(dynamic value);
  external RowNode get parent;
  external set parent(RowNode value);
  external int get level;
  external set level(int value);
  external bool get group;
  external set group(bool value);
  external bool get firstChild;
  external set firstChild(bool value);
  external bool get lastChild;
  external set lastChild(bool value);
  external int get childIndex;
  external set childIndex(int value);
  external bool get floating;
  external set floating(bool value);
  external bool get floatingTop;
  external set floatingTop(bool value);
  external bool get floatingBottom;
  external set floatingBottom(bool value);
  external String get quickFilterAggregateText;
  external set quickFilterAggregateText(String value);
  external bool get footer;
  external set footer(bool value);
  external List<RowNode> get children;
  external set children(List<RowNode> value);
  external String get field;
  external set field(String value);
  external dynamic get key;
  external set key(dynamic value);
  external List<RowNode> get childrenAfterFilter;
  external set childrenAfterFilter(List<RowNode> value);
  external List<RowNode> get childrenAfterSort;
  external set childrenAfterSort(List<RowNode> value);
  external int get allChildrenCount;
  external set allChildrenCount(int value);
  external bool get expanded;
  external set expanded(bool value);
  external RowNode get sibling;
  external set sibling(RowNode value);
  external num get rowHeight;
  external set rowHeight(num value);
  external num get rowTop;
  external set rowTop(num value);
  external void resetQuickFilterAggregateText();
  external bool isSelected();
  external void selectThisNode(bool newValue);
  external void addEventListener(String eventType, Function listener);
  external void removeEventListener(String eventType, Function listener);
}

/*
    resetQuickFilterAggregateText(): void;
    isSelected(): boolean;
    deptFirstSearch(callback: (rowNode: RowNode) => void): void;
    calculateSelectedFromChildren(): void;
    private calculateSelectedFromChildrenBubbleUp();
    setSelectedInitialValue(selected: boolean): void;
    /** Returns true if this row is selected */
    setSelected(newValue: boolean, clearSelection?: boolean, tailingNodeInSequence?: boolean): void;
    selectThisNode(newValue: boolean): void;
    private selectChildNodes(newValue);
    addEventListener(eventType: string, listener: Function): void;
    removeEventListener(eventType: string, listener: Function): void;
 */
