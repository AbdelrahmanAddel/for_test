part of 'test_bloc.dart';

sealed class TestState extends Equatable {
  const TestState(this.counter);
  final int counter;

  @override
  List<Object> get props => [counter];
}

final class TestInitial extends TestState {
  const TestInitial(super.counter);
}

final class TestIncrement extends TestState {
  const TestIncrement(super.counter);
}

final class TestDecrement extends TestState {
  const TestDecrement(super.counter);
}
