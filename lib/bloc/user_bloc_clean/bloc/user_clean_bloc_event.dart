part of 'user_clean_bloc_bloc.dart';

abstract class UserCleanEvent  {
  
}

class GetUserCleanEvent extends UserCleanEvent{
  final int count;
  GetUserCleanEvent(this.count);
}