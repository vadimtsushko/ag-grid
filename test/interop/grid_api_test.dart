import 'package:test/test.dart';
import 'package:ag_grid/ag_grid.dart';

void main(){
  group('GridApi', (){

    GridApi api = new GridApi();

    test('should not be null', () {
      expect(api, isNotNull);
    });
  });
}