import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/features/counter/domain/port/counter_port.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterPort)
class CounterAdapter extends CounterPort {
  @override
  Future<Either<Failure, int>> decrement() async {
    return Right(4);
  }

  @override
  Future<Either<Failure, int>> increment() async {
    return Right(5);
  }
}
