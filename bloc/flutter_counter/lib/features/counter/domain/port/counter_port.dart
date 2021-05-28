import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/failure.dart';

abstract class CounterPort {
  Future<Either<Failure, int>> increment();
  Future<Either<Failure, int>> decrement();
}
