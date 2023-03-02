import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/user_bloc/bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final userBloc = UserBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        //?Bu nega qo'yilishi kerak
        bloc: userBloc,
        builder: (context, state) {
          return Column(
            children: [
              if (state is UserLoadingState)
                const Center(child: CircularProgressIndicator()),
              if (state is UserLoadState)
                ...state.users.map(
                  (e) => Card(
                    child: ListTile(
                      leading: Text(e.id),
                      title: Text(e.name),
                      trailing: Text(e.job),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userBloc.add(GetUserEvent(10));
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
