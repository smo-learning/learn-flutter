import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/core/domain/failure.dart';
import 'package:flutter_counter/core/domain/usecase.dart';
import 'package:flutter_counter/features/counter/domain/failures/counter_failure.dart';
import 'package:flutter_counter/features/counter/domain/usecases/decrement_counter_usecase.dart';
import 'package:flutter_counter/features/counter/domain/usecases/increment_counter_usecase.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

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
          (l) => CounterErrorState(l), (r) => CounterSuccessState(r));
    }
    if (event is CounterDecrementedEvent) {
      final result = await decrementUseCase(NoParams());
      yield result.fold(
          (l) => CounterErrorState(l), (r) => CounterSuccessState(r));
    }
  }
}
