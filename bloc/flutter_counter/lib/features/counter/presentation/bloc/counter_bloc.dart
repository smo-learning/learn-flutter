import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/core/domain/failure.dart';
import 'package:flutter_counter/core/domain/usecase.dart';
import 'package:flutter_counter/features/counter/domain/failures/counter_failure.dart';
import 'package:flutter_counter/features/counter/domain/usecases/decrement_counter_usecase.dart';
import 'package:flutter_counter/features/counter/domain/usecases/increment_counter_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  IncrementCounterUseCase incrementUseCase;
  DecrementCounterUseCase decrementUseCase;

  CounterBloc(this.incrementUseCase, this.decrementUseCase)
      : super(CounterLoadingState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    yield CounterLoadingState();
    if (event is CounterIncrementedEvent) {
      final result = await incrementUseCase(NoParams());
      yield result.fold(
          (l) => CounterErrorState(CounterFailure.incrementFailure),
          (r) => CounterSuccessState(r));
    }
    if (event is CounterDecrementedEvent) {
      final result = await decrementUseCase(NoParams());
      yield result.fold(
          (l) => CounterErrorState(CounterFailure.decrementFailure),
          (r) => CounterSuccessState(r));
    }
  }
}

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterLoadingState extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterErrorState extends CounterState {
  final Failure failure;
  const CounterErrorState(this.failure);

  @override
  List<Object?> get props => [];
}

class CounterSuccessState extends CounterState {
  final int counter;
  const CounterSuccessState(this.counter);

  @override
  List<Object?> get props => [this.counter];
}

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

class CounterIncrementedEvent extends CounterEvent {}

class CounterDecrementedEvent extends CounterEvent {}
