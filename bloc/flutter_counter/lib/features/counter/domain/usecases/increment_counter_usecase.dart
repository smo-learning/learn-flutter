import 'package:flutter_counter/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_counter/core/domain/usecase.dart';
import 'package:injectable/injectable.dart';

// ignore: one_member_abstracts
abstract class IncrementCounterUseCase extends UseCase<int, NoParams> {}

@LazySingleton(as: IncrementCounterUseCase)
class IncrementCounterUseCaseImpl extends IncrementCounterUseCase {
  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return Right(5);
  }
}
