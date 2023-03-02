part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent{
  final int count;
  GetUserEvent(this.count);
}
