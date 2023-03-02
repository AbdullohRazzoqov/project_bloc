part of 'user_clean_bloc_bloc.dart';

class UserCleanBlocState {
  final List<User> users;
  final List<Job> jobs;
  final bool isLoading;

  UserCleanBlocState({
    this.users = const [],
    this.jobs = const [],
    this.isLoading = false,
  });

  UserCleanBlocState copyWith({
    List<User>? users,
    List<Job>? jobs,
    bool isLoading = false,
  }) {
    return UserCleanBlocState(
      users: users ?? this.users,
      jobs: jobs ?? this.jobs,
      isLoading: isLoading,
    );
  }
}

class User {
  final String name;
  final String id;

  User({
    required this.name,
    required this.id,
  });
}

class Job {
  final String name;
  final String firsName;
  final String id;
  final String job;

  Job({
    required this.name,
    required this.firsName,
    required this.id,
    required this.job,
  });
}
