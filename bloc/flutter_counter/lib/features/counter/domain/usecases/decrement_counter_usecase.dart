import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/usecase.dart';
import 'package:flutter_counter/features/counter/domain/port/counter_port.dart';
import 'package:injectable/injectable.dart';

// ignore: one_member_abstracts
abstract class DecrementCounterUseCase extends UseCase<int, NoParams> {}

@LazySingleton(as: DecrementCounterUseCase)
class DecrementCounterUseCaseImpl extends DecrementCounterUseCase {
  final CounterPort _port;
  DecrementCounterUseCaseImpl(this._port);

  @override
  Future<Either<Failure, int>> execute(NoParams params) async {
    return _port.decrement();
  }
}
