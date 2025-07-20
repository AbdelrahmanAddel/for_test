part of 'test_bloc.dart';

sealed class TestEvent {}

class TestEventIncrement extends TestEvent {}

class TestEventDecrement extends TestEvent {}
