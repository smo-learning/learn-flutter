import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/failure.dart';
import 'package:flutter_counter/features/counter/domain/entities/counter.dart';

abstract class CounterPort {
  Future<Either<Failure, Counter>> increment();
  Future<Either<Failure, Counter>> decrement();
}
