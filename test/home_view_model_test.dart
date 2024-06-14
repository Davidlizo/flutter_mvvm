import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_tutorial/data/repository/home_repository.dart';
import 'package:mvvm_tutorial/data/model/home_view_model.dart';

// Mock class for HomeRepository
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  group('HomeViewModel Test', () {
    late MockHomeRepository mockHomeRepository;
    late HomeViewModel homeViewModel;

    setUp(() {
      mockHomeRepository = MockHomeRepository();
      homeViewModel = HomeViewModel(homeRepository: mockHomeRepository);
    });

    test('fetchItems should populate items list', () async {
      // Arrange
      when(mockHomeRepository.getItems()).thenAnswer((_) async => ['Collins', 'David 1', 'Painter']);

      // Act
      await homeViewModel.fetchItems();

      // Assert
      expect(homeViewModel.items, ['Collins', 'David 1', 'Painter']);
      verify(mockHomeRepository.getItems()).called(1);
    });

    test('fetchItems should handle exceptions very well', () async {
      // Arrange
      when(mockHomeRepository.getItems()).thenThrow(Exception('Failed to fetch items'));

      // Act
      await homeViewModel.fetchItems();

      // Assert
      expect(homeViewModel.items.isEmpty, true);
      verify(mockHomeRepository.getItems()).called(1);
    });
  });
}


// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mvvm_tutorial/data/repository/home_repository.dart';
// import 'package:mvvm_tutorial/data/model/home_view_model.dart';
// import 'package:mockito/annotations.dart';

// @GenerateMocks([HomeRepository])
// void main() {
//   group('HomeViewModel Test', () {
//     late MockHomeRepository mockHomeRepository;
//     late HomeViewModel homeViewModel;

//     setUp(() {
//       mockHomeRepository = MockHomeRepository();
//       // Initialize the HomeViewModel with the mock repository
//       homeViewModel = HomeViewModel(homeRepository: mockHomeRepository);
//     });

//     test('fetchItems should populate items list', () async {
//       // Arrange
//       when(mockHomeRepository.getItems()).thenAnswer((_) async => ['Collins', 'David 1', 'Painter']);

//       // Act
//       await homeViewModel.fetchItems();

//       // Assert
//       expect(homeViewModel.items, ['Collins', 'David 1', 'Painter']);
//       verify(mockHomeRepository.getItems()).called(1);
//     });

//     test('fetchItems should handle exceptions gracefully', () async {
//       // Arrange
//       when(mockHomeRepository.getItems()).thenThrow(Exception('Failed to fetch items'));

//       // Act
//       await homeViewModel.fetchItems();

//       // Assert
//       expect(homeViewModel.items.isEmpty, true);
//       verify(mockHomeRepository.getItems()).called(1);
//     });
//   });
// }
