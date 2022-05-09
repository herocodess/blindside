import 'package:blindside/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  MockDataConnectionChecker? mockDataConnectionChecker;
  NetworkInfoImpl? networkInfo;

  group('isConnected', () {
    setUp(() {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfo = NetworkInfoImpl(mockDataConnectionChecker!);
    });
    test('should forward the call to InternetConnectionChecker.hasConnection',
        () {
      // arrange
      final thasConnectionFuture = Future.value(true);
      when(() => mockDataConnectionChecker!.hasConnection)
          .thenAnswer((_) => thasConnectionFuture);
      // // act
      final result = networkInfo!.isConnected;
      // // assert
      verify(() => mockDataConnectionChecker!.hasConnection);
      expect(result, thasConnectionFuture);
    });
  });
}
