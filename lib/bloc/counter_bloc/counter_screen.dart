import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/counter_bloc/bloc/counter_bloc.dart';
//!Bloc provider bunda MultiBloc provider yaratish shart emas

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Counter"),
            ),
            body: Center(
              child: Text('$state'),
            ),
            floatingActionButton: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
//!Read
                    final counterBlocRead = context.read<CounterBloc>();

                    counterBlocRead.add(CounterDecEvent());
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    final counterBloc = BlocProvider.of<CounterBloc>(context);
                    counterBloc.add(CounterIncEvent());
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
