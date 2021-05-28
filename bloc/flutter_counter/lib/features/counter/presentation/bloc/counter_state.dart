part of 'counter_bloc.dart';

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
  final Counter counter;
  const CounterSuccessState(this.counter);

  @override
  List<Object?> get props => [this.counter];
}
