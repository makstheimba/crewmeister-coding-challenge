import 'package:mocktail/mocktail.dart';

class TestFunction {
  void call() {}
}

class MockFunction extends Mock implements TestFunction {}
