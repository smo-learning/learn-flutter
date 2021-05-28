import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/features/counter/data/data_sources/counter_data_source_local.dart';
import 'package:flutter_counter/features/counter/data/models/counter_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterDataSourceLocal)
class CounterDataSourceLocalInMemory extends CounterDataSourceLocal {
  int counter = 0;
  @override
  Future<Either<Failure, CounterModel>> decrement() async {
    return Right(CounterModel(--counter));
  }

  @override
  Future<Either<Failure, CounterModel>> increment() async {
    return Right(CounterModel(++counter));
  }
}
