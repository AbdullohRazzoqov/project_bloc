part of 'user_bloc.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadState extends UserState {
  final List<User> users;

  UserLoadState(this.users);
}

class UserLoadingState extends UserState {}

class User {
  final String name;
  final String id;
  final String job;
  User({
    required this.name,
    required this.id,
    required this.job,
  });
}
