import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:get_it/get_it.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CounterBloc>(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterSuccessState) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Text('${state.counter}'),
            );
          }
          if (state is CounterErrorState) {
            return Container(
              child: Text('Error: ${state.failure.code}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(CounterIncrementedEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(CounterDecrementedEvent());
            },
            child: const Icon(Icons.no_encryption_gmailerrorred_outlined),
          ),
        ],
      ),
    );
  }
}
