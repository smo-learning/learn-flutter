import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/features/counter/data/data_sources/counter_data_source_local.dart';
import 'package:flutter_counter/features/counter/domain/port/counter_port.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterPort)
class CounterAdapter extends CounterPort {
  CounterDataSourceLocal localDataSource;

  CounterAdapter(this.localDataSource);

  @override
  Future<Either<Failure, int>> increment() async {
    return localDataSource.increment();
  }

  @override
  Future<Either<Failure, int>> decrement() async {
    return localDataSource.decrement();
  }
}
