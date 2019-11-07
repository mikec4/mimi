import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/board_drop_location/drop/drop_provider.dart';

void main(){
  DropProvider dropProvider;

  setUp((){
    dropProvider = DropProvider();
  });

  group('Drop providers', (){
      
      test('Initial groupvalue is empty', () {
        expect(dropProvider.groupValue, equals(''));
      });

      test('Group value should be equal to test', () {
        dropProvider.setGroupValue = 'test';
        expect(dropProvider.groupValue, equals('test'));
      });
    });
}