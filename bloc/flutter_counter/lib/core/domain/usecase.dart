import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

abstract class UseCase<T, P extends Params> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable implements Params {
  NoParams() : super();
  @override
  List<Object> get props => [];
}

abstract class Params {}
