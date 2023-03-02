import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:project_bloc/bloc/counter_bloc/counter_screen.dart';
import 'package:project_bloc/bloc/user_bloc/bloc/user_bloc.dart';
import 'package:project_bloc/bloc/user_bloc/user_screen.dart';
import 'package:project_bloc/bloc/user_bloc_clean/user_clean_bloc_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (_) => CounterBloc(),
          ),
          BlocProvider<UserBloc>(
            create: (_) => UserBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCounter()));
              },
              child: const Text("Counter Bloc")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserScreen()));
              },
              child: const Text("User Bloc")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserCleanBlocScreen()));
              },
              child: const Text("User Clean Bloc"))
        ],
      ),
    );
  }
}
