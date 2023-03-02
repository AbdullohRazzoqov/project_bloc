import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<GetUserEvent>(_getUser);
  }
  _getUser(GetUserEvent event, Emitter<UserState> state) async {
    emit(UserLoadingState());

    await Future.delayed(const Duration(seconds: 1));
    final users = List.generate(
        event.count,
        (index) =>
            User(name: 'Abdulloh', id: index.toString(), job: "Dasturchi"));
    emit(UserLoadState(users));
  }
}
