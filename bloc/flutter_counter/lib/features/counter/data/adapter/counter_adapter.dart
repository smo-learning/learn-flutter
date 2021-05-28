import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/features/counter/data/data_sources/counter_data_source_local.dart';
import 'package:flutter_counter/features/counter/domain/entities/counter.dart';
import 'package:flutter_counter/features/counter/domain/port/counter_port.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterPort)
class CounterAdapter extends CounterPort {
  CounterDataSourceLocal localDataSource;

  CounterAdapter(this.localDataSource);

  @override
  Future<Either<Failure, Counter>> increment() async {
    var result = await localDataSource.increment();
    return result.fold((l) => Left(l), (r) => Right(Counter(r.counter)));
  }

  @override
  Future<Either<Failure, Counter>> decrement() async {
    var result = await localDataSource.decrement();
    return result.fold((l) => Left(l), (r) => Right(Counter(r.counter)));
  }
}
