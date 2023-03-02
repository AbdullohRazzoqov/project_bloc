import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/user_bloc_clean/bloc/user_clean_bloc_bloc.dart';

class UserCleanBlocScreen extends StatelessWidget {
  const UserCleanBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCleanBloc = UserCleanBlocBloc();

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen Clean"),
      ),
      body: BlocBuilder<UserCleanBlocBloc, UserCleanBlocState>(
        //?Bu nega qo'yilishi kerak
        bloc: userCleanBloc,
        builder: (context, state) {
          final users = state.users;
          return Column(
            children: [
              if (users.isEmpty && state.isLoading)
                const Center(child: CircularProgressIndicator()),
              if (users.isNotEmpty)
                ...state.users.map(
                  (e) => Card(
                    child: ListTile(
                      leading: Text(e.id),
                      title: Text(e.name),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userCleanBloc.add(GetUserCleanEvent(10));
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
    ;
  }
}
