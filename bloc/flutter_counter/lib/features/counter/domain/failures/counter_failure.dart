import 'package:flutter_counter/core/domain/failure.dart';

class CounterFailure extends Failure {
  const CounterFailure(code) : super(code);

  static const incrementFailure = CounterFailure(1);
  static const decrementFailure = CounterFailure(2);
}
