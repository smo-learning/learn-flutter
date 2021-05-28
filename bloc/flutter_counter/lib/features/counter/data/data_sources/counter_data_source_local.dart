import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/failure.dart';
import 'package:flutter_counter/features/counter/data/models/counter_model.dart';

abstract class CounterDataSourceLocal {
  Future<Either<Failure, CounterModel>> increment();
  Future<Either<Failure, CounterModel>> decrement();
}
