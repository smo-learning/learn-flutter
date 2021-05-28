// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/counter/domain/usecases/decrement_counter_usecase.dart' as _i3;
import 'features/counter/domain/usecases/increment_counter_usecase.dart' as _i4;
import 'features/counter/presentation/bloc/counter_bloc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DecrementCounterUseCase>(
      () => _i3.DecrementCounterUseCaseImpl());
  gh.lazySingleton<_i4.IncrementCounterUseCase>(
      () => _i4.IncrementCounterUseCaseImpl());
  gh.factory<_i5.CounterBloc>(() => _i5.CounterBloc(
      get<_i4.IncrementCounterUseCase>(), get<_i3.DecrementCounterUseCase>()));
  return get;
}
