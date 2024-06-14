import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_tutorial/data/repository/home_repository.dart';

void main() {
  group('HomeRepository Test', () {
    test('getItems should return a list of items', () async {
      // To Create an instance of The HomeRepository Class

      // Arrange
      final homeRepository = HomeRepository();

      // We call the getItems method and awaits it's result
      // Act
      final items = await homeRepository.getItems();

      // Expect a result of a list of Strings
      // Assert
      expect(items, isA<List<String>>());
      expect(items, ['Collins', 'David 1', 'Painter']);
    });
  });
}