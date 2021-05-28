// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/counter/data/adapter/counter_adapter.dart' as _i4;
import 'features/counter/domain/port/counter_port.dart' as _i3;
import 'features/counter/domain/usecases/decrement_counter_usecase.dart' as _i5;
import 'features/counter/domain/usecases/increment_counter_usecase.dart' as _i6;
import 'features/counter/presentation/bloc/counter_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CounterPort>(() => _i4.CounterAdapter());
  gh.lazySingleton<_i5.DecrementCounterUseCase>(
      () => _i5.DecrementCounterUseCaseImpl(get<_i3.CounterPort>()));
  gh.lazySingleton<_i6.IncrementCounterUseCase>(
      () => _i6.IncrementCounterUseCaseImpl(get<_i3.CounterPort>()));
  gh.factory<_i7.CounterBloc>(() => _i7.CounterBloc(
      get<_i6.IncrementCounterUseCase>(), get<_i5.DecrementCounterUseCase>()));
  return get;
}
