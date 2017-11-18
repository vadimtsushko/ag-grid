import 'package:test/test.dart';
import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'package:ag_grid/editors/date_cell_editor_factory.dart';
import 'package:ag_grid/editors/date_cell_editor.dart';

void main() {
  group('DateCellEditorFactory', () {
    final DateTime localDate = new DateTime(2010, 10, 10);
    final DateTime utcDate = new DateTime.utc(2010, 10, 10);

    DateCellEditorFactory editorFactory;
    DateCellEditor editor;

    setUp(() {
      editorFactory = new DateCellEditorFactory();
      editor = editorFactory.getInstance();
    });

    test('editor properties should be initialized', () {
      expect(editor.init, isNotNull);
      expect(editor.getGui, isNotNull);
      expect(editor.afterGuiAttached, isNotNull);
      expect(editor.getValue, isNotNull);
      expect(editor.isPopup, isNotNull);
      expect(editor.destroy, isNotNull);
    });

    test('getGui should return null before init', () {
      expect(editorFactory.getGui(editor), isNull);
    });

    test('getValue should throw', () {
      method() {
        editorFactory.getValue(editor);
      }

      expect(method, throwsA(new isInstanceOf<StateError>()));
    });

    test('getGui should return DateInputElement after init', () {
      editorFactory.init(editor, new RendererParam());

      expect(editorFactory.getGui(editor), isNotNull);
      expect(editorFactory.getGui(editor), new isInstanceOf<DateInputElement>());
      expect(editor.input, isNotNull);
    });

    test('init should update input value with DateTime', () {
      editorFactory.init(editor, new RendererParam(value: localDate));
      DateInputElement element = editor.input as DateInputElement;

      expect(element.valueAsDate, equals(utcDate));
    });

    test('init should update input value with String', () {
      editorFactory.init(editor, new RendererParam(value: localDate.toString()));
      DateInputElement element = editor.input as DateInputElement;

      expect(element.valueAsDate, equals(utcDate));
    });

    test('getValue should throw StateError', () {
      method() {
        editorFactory.getValue(editor);
      }

      expect(method, throwsA(new isInstanceOf<StateError>()));
    });

    test('getValue should return null', () {

      editorFactory.init(editor, new RendererParam());

      method(){
        editorFactory.getValue(editor);
      }
      expect(method, throws);
    });

    test('getValue should return utc DateTime', () {
      editorFactory.init(editor, new RendererParam(value: localDate));

      expect(editorFactory.getValue(editor), equals(utcDate));
    });
  });
}
