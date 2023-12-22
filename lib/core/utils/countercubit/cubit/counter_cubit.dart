import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counter = 1;
  add() {
    emit(Counteradd());
  }

  remove() {
    emit(CounteRemove());
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print(change);
  }
}
