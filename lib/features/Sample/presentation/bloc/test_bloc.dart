import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial(0)) {
    on<TestEventIncrement>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      emit(TestIncrement(state.counter + 1));
    }, transformer: restartable());
  }
}
