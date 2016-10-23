@JS()
library rownode;
import "package:js/js.dart";


@JS()
class RowNode {
  external static String get EVENT_ROW_SELECTED;
  external static set EVENT_ROW_SELECTED(String v);
  external static String get EVENT_DATA_CHANGED;
  external static set EVENT_DATA_CHANGED(String v);
  external static String get EVENT_CELL_CHANGED;
  external static set EVENT_CELL_CHANGED(String v);
  external static String get EVENT_MOUSE_ENTER;
  external static set EVENT_MOUSE_ENTER(String v);
  external static String get EVENT_MOUSE_LEAVE;
  external static set EVENT_MOUSE_LEAVE(String v);
  external get mainEventService;
  external set mainEventService(v);
  external get gridOptionsWrapper;
  external set gridOptionsWrapper(v);
  external get selectionController;
  external set selectionController(v);
  external get columnController;
  external set columnController(v);
  external get valueService;
  external set valueService(v);
  external get rowModel;
  external set rowModel(v);

  /// Unique ID for the node. Either provided by the grid, or user can set to match the primary
  /// key in the database (or whatever data source is used).
  external String get id;
  external set id(String v);

  /// The user provided data
  external dynamic get data;
  external set data(dynamic v);

  /// The parent node to this node, or empty if top level
  external RowNode get parent;
  external set parent(RowNode v);

  /// How many levels this node is from the top
  external num get level;
  external set level(num v);

  /// True if this node is a group node (ie has children)
  external bool get group;
  external set group(bool v);

  /// True if this node can flower (ie can be expanded, but has no direct children)
  external bool get canFlower;
  external set canFlower(bool v);

  /// True if this node is a flower
  external bool get flower;
  external set flower(bool v);

  /// True if this node is a group and the group is the bottom level in the tree
  external bool get leafGroup;
  external set leafGroup(bool v);

  /// True if this is the first child in this group
  external bool get firstChild;
  external set firstChild(bool v);

  /// True if this is the last child in this group
  external bool get lastChild;
  external set lastChild(bool v);

  /// The index of this node in the group
  external num get childIndex;
  external set childIndex(num v);

  /// Either 'top' or 'bottom' if floating, otherwise undefined or null
  external String get floating;
  external set floating(String v);

  /// If using quick filter, stores a string representation of the row for searching against
  external String get quickFilterAggregateText;
  external set quickFilterAggregateText(String v);

  /// Groups only - True if row is a footer. Footers  have group = true and footer = true
  external bool get footer;
  external set footer(bool v);

  /// Groups only - The field we are grouping on eg Country
  external String get field;
  external set field(String v);

  /// Groups only - The key for the group eg Ireland, UK, USA
  external dynamic get key;
  external set key(dynamic v);

  /// All user provided nodes
  external List<RowNode> get allLeafChildren;
  external set allLeafChildren(List<RowNode> v);

  /// Groups only - Children of this group
  external List<RowNode> get childrenAfterGroup;
  external set childrenAfterGroup(List<RowNode> v);

  /// Groups only - Filtered children of this group
  external List<RowNode> get childrenAfterFilter;
  external set childrenAfterFilter(List<RowNode> v);

  /// Groups only - Sorted children of this group
  external List<RowNode> get childrenAfterSort;
  external set childrenAfterSort(List<RowNode> v);

  /// Groups only - Number of children and grand children
  external num get allChildrenCount;
  external set allChildrenCount(num v);

  /// Children mapped by the pivot columns
  external dynamic /*JSMap of <String,dynamic>*/ get childrenMapped;
  external set childrenMapped(dynamic /*JSMap of <String,dynamic>*/ v);

  /// Groups only - True if group is expanded, otherwise false
  external bool get expanded;
  external set expanded(bool v);

  /// Groups only - If doing footers, reference to the footer node for this group
  external RowNode get sibling;
  external set sibling(RowNode v);

  /// Not to be used, internal temporary map used by the grid when creating groups
  external dynamic /*{}*/ get JS$_childrenMap;
  external set JS$_childrenMap(dynamic /*{}*/ v);

  /// The height, in pixels, of this row
  external num get rowHeight;
  external set rowHeight(num v);

  /// The top pixel for this row
  external num get rowTop;
  external set rowTop(num v);
  external get selected;
  external set selected(v);
  external get eventService;
  external set eventService(v);
  external void setData(dynamic data);
  external void setDataAndId(dynamic data, String id);
  external void setId(String id);
  external dispatchLocalEvent(eventName, [event]);
  external void setDataValue(
      dynamic /*String|ColDef|Column*/ colKey, dynamic newValue);
  external void resetQuickFilterAggregateText();
  external bool isExpandable();
  external bool isSelected();
  external void deptFirstSearch(void callback(RowNode rowNode));
  external void calculateSelectedFromChildren();
  external calculateSelectedFromChildrenBubbleUp();
  external void setSelectedInitialValue(bool selected);
  external void setSelected(bool newValue,
      [bool clearSelection, bool tailingNodeInSequence]);
  external void setSelectedParams(
      dynamic /*{
        newValue: boolean;
        clearSelection?: boolean;
        tailingNodeInSequence?: boolean;
        rangeSelect?: boolean;
    }*/
      params);
  external doRowRangeSelection();
  external isParentOfNode(potentialParent);
  external calculatedSelectedForAllGroupNodes();
  external void selectThisNode(bool newValue);
  external selectChildNodes(newValue);
  external void addEventListener(String eventType, Function listener);
  external void removeEventListener(String eventType, Function listener);
  external void onMouseEnter();
  external void onMouseLeave();
}


//@JS()
//class RowNode {
//  external int get id;
//  external set id(int value);
//  external dynamic get data;
//  external set data(dynamic value);
//  external RowNode get parent;
//  external set parent(RowNode value);
//  external int get level;
//  external set level(int value);
//  external bool get group;
//  external set group(bool value);
//  external bool get firstChild;
//  external set firstChild(bool value);
//  external bool get lastChild;
//  external set lastChild(bool value);
//  external int get childIndex;
//  external set childIndex(int value);
//  external bool get floating;
//  external set floating(bool value);
//  external bool get floatingTop;
//  external set floatingTop(bool value);
//  external bool get floatingBottom;
//  external set floatingBottom(bool value);
//  external String get quickFilterAggregateText;
//  external set quickFilterAggregateText(String value);
//  external bool get footer;
//  external set footer(bool value);
//  external List<RowNode> get children;
//  external set children(List<RowNode> value);
//  external String get field;
//  external set field(String value);
//  external dynamic get key;
//  external set key(dynamic value);
//  external List<RowNode> get childrenAfterFilter;
//  external set childrenAfterFilter(List<RowNode> value);
//  external List<RowNode> get childrenAfterSort;
//  external set childrenAfterSort(List<RowNode> value);
//  external int get allChildrenCount;
//  external set allChildrenCount(int value);
//  external bool get expanded;
//  external set expanded(bool value);
//  external RowNode get sibling;
//  external set sibling(RowNode value);
//  external num get rowHeight;
//  external set rowHeight(num value);
//  external num get rowTop;
//  external set rowTop(num value);
//  external void resetQuickFilterAggregateText();
//  external bool isSelected();
//  external void selectThisNode(bool newValue);
//  external void addEventListener(String eventType, Function listener);
//  external void removeEventListener(String eventType, Function listener);
//  external void setSelected(bool newValue, bool clearSelection);
//}

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
