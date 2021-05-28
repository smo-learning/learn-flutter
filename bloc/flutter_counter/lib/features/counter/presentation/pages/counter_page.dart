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
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter'),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: currentStateWidget(state),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(
                      CounterIncrementedEvent(state is CounterSuccessState
                          ? state.counter.counter
                          : 0));
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 4),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(
                      CounterDecrementedEvent(state is CounterSuccessState
                          ? state.counter.counter
                          : 0));
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget currentStateWidget(CounterState state) {
    if (state is CounterSuccessState) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Text(
          '${state.counter.counter}',
          style: TextStyle(
            fontSize: (state.counter.counter * 2) + 10,
          ),
        ),
      );
    }
    if (state is CounterErrorState) {
      return Container(
          child: Text('Error: ${state.failure.code}',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 42)));
    }
    return const Text("Los");
  }
}
