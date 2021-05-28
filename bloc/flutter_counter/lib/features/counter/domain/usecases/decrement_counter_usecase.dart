import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/usecase.dart';
import 'package:flutter_counter/features/counter/domain/entities/counter.dart';
import 'package:flutter_counter/features/counter/domain/failures/counter_failure.dart';
import 'package:flutter_counter/features/counter/domain/port/counter_port.dart';
import 'package:injectable/injectable.dart';

// ignore: one_member_abstracts
abstract class DecrementCounterUseCase
    extends UseCase<Counter, DecrementCounterParams> {}

class DecrementCounterParams extends Params {
  final int oldCounter;
  DecrementCounterParams(this.oldCounter);
  @override
  List<Object?> get props => [oldCounter];
}

@LazySingleton(as: DecrementCounterUseCase)
class DecrementCounterUseCaseImpl extends DecrementCounterUseCase {
  final CounterPort _port;
  DecrementCounterUseCaseImpl(this._port);

  @override
  Future<Either<Failure, Counter>> execute(
      DecrementCounterParams params) async {
    if (params.oldCounter == 0) {
      return Left(CounterFailure.decrementFailure);
    }
    return _port.decrement();
  }
}
