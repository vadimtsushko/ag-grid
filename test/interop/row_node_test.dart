import 'package:test/test.dart';
import 'package:ag_grid/interop/rownode.dart';

void main() {

  group('RowNode', () {

    RowNode node = new RowNode();

    test('should not be null', () {

      expect(node, isNotNull);
    });
  });
}