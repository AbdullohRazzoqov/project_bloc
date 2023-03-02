import 'package:bloc/bloc.dart';

part 'counter_event.dart';
// part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncEvent>(_onIncrement);
    on<CounterDecEvent>(_onDecrement);
  }

  _onIncrement(CounterIncEvent event, Emitter<int> emit) {
    emit(state + 1);
    print(state);
  }

  _onDecrement(CounterDecEvent event, Emitter<int> emit) {
    emit(state - 1);
    print(state);
  }
}
