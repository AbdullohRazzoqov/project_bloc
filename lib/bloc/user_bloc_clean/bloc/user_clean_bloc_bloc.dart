import 'package:bloc/bloc.dart';

part 'user_clean_bloc_event.dart';
part 'user_clean_bloc_state.dart';

class UserCleanBlocBloc extends Bloc<UserCleanEvent, UserCleanBlocState> {
  UserCleanBlocBloc() : super(UserCleanBlocState()) {
    on<GetUserCleanEvent>(_onGetUser);
  }
  _onGetUser(GetUserCleanEvent event, Emitter<UserCleanBlocState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    final users = List.generate(
        event.count,
        (index) => User(
              name: 'Abdulloh',
              id: index.toString(),
            ));
    emit(state.copyWith(users: users));
  }
}
