part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  final int oldCounter;
  const CounterEvent(this.oldCounter);
  @override
  List<Object?> get props => [];
}

class CounterIncrementedEvent extends CounterEvent {
  CounterIncrementedEvent(int oldCounter) : super(oldCounter);
}

class CounterDecrementedEvent extends CounterEvent {
  CounterDecrementedEvent(int oldCounter) : super(oldCounter);
}
