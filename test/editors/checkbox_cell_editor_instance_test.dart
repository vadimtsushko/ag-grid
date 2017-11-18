import 'package:test/test.dart';
import 'dart:html';
import 'package:ag_grid/ag_grid.dart';
import 'package:ag_grid/editors/checkbox.dart';

void main(){

  group('CheckboxCellEditorInstance', () {

    CheckboxCellEditorMethods editorFactory = new CheckboxCellEditorMethods();
    CheckboxCellEditorInstance editor = editorFactory.getInstance();

    test('init should set value checked', () {

      editor.init(new RendererParam(value: '1'));

      expect(editor.getValue(), equals('1'));
    });

    test('init should set value unchecked', () {

      editor.init(new RendererParam(value: 'any'));

      expect(editor.getValue(), equals('0'));
    });

    test('getGui should return HtmlElement', () {

      editor.init(new RendererParam(value: 'any'));

      var element = editor.getGui();

      expect(element, isNotNull);
      expect(element, new isInstanceOf<HtmlElement>());
      expect(element, new isInstanceOf<InputElement>());
    });

    test('getValue should return zero', () {

      editor.init(new RendererParam(value: 'any'));

      expect(editor.getValue(), equals('0'));
    });

    test('getValue should return one', () {

      editor.init(new RendererParam(value: '1'));

      expect(editor.getValue(), equals('1'));
    });

    test('isPopup should return false', () {

      editor.init(new RendererParam(value: 'any'));

      expect(editor.isPopup(), isFalse);
    });
  });
}