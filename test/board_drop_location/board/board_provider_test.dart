import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/board_drop_location/board/board_provider.dart';

void main(){
  BoardProvider boardProvider;

  setUp((){
    boardProvider = BoardProvider();
  });

  group('Drop providers', (){
      
      test('Initial groupvalue is empty', () {
        expect(boardProvider.groupValue, equals(''));
      });

      test('Group value should be equal to test', () {
        boardProvider.setGroupValue = 'test';
        expect(boardProvider.groupValue, equals('test'));
      });
    });
}
