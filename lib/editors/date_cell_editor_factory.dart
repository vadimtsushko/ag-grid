import 'date_cell_editor.dart';
import '../interop/ag_grid.dart';
import 'dart:html';
import 'package:js/js.dart';

class DateCellEditorFactory {

  init(DateCellEditor me, RendererParam params) {

    me.input = new DateInputElement();

    if(params.value is DateTime)
      me.input.valueAsDate = _makeUtcDate(params.value);

    if(params.value is String){
      DateTime date = _parseDate(params.value);
      if(date != null)
        me.input.valueAsDate = date;
    }
  }

  DateTime _parseDate(String value){
    try{
      DateTime date = DateTime.parse(value);
      return _makeUtcDate(date);
    }
    catch(exception){
      return null;
    }
  }

  DateTime _makeUtcDate(DateTime value){

    int year = value.year;
    int month = value.month;
    int day = value.day;

    DateTime date = new DateTime.utc(year, month, day);
    return date;
  }

  HtmlElement getGui(DateCellEditor me) {
    return me.input as HtmlElement;
  }

  afterGuiAttached(DateCellEditor me) {
    me.input.focus();
  }

  getValue(DateCellEditor me) {

    if(me.input == null)
      throw new StateError('Call DateCellEditor init method before use!');

    if(me.input.valueAsDate is DateTime)
      return me.input.valueAsDate;
  }

  bool isPopup(DateCellEditor me) {
    return false;
  }

  destroy(DateCellEditor me) {
  }

  DateCellEditor getInstance() {
    DateCellEditor editor = new DateCellEditor();
    editor.init = allowInteropCaptureThis(init);
    editor.getGui = allowInteropCaptureThis(getGui);
    editor.afterGuiAttached = allowInteropCaptureThis(afterGuiAttached);
    editor.getValue = allowInteropCaptureThis(getValue);
    editor.isPopup = allowInteropCaptureThis(isPopup);
    editor.destroy = allowInteropCaptureThis(destroy);
    return editor;
  }
}
