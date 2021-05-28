// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/counter/data/adapter/counter_adapter.dart' as _i6;
import 'features/counter/data/data_sources/counter_data_source_local.dart'
    as _i3;
import 'features/counter/data/data_sources/counter_data_source_local_inmemory.dart'
    as _i4;
import 'features/counter/domain/port/counter_port.dart' as _i5;
import 'features/counter/domain/usecases/decrement_counter_usecase.dart' as _i7;
import 'features/counter/domain/usecases/increment_counter_usecase.dart' as _i8;
import 'features/counter/presentation/bloc/counter_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CounterDataSourceLocal>(
      () => _i4.CounterDataSourceLocalInMemory());
  gh.lazySingleton<_i5.CounterPort>(
      () => _i6.CounterAdapter(get<_i3.CounterDataSourceLocal>()));
  gh.lazySingleton<_i7.DecrementCounterUseCase>(
      () => _i7.DecrementCounterUseCaseImpl(get<_i5.CounterPort>()));
  gh.lazySingleton<_i8.IncrementCounterUseCase>(
      () => _i8.IncrementCounterUseCaseImpl(get<_i5.CounterPort>()));
  gh.factory<_i9.CounterBloc>(() => _i9.CounterBloc(
      get<_i8.IncrementCounterUseCase>(), get<_i7.DecrementCounterUseCase>()));
  return get;
}
