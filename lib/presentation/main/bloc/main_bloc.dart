import 'package:app_nation_case/presentation/main/bloc/main_event.dart';
import 'package:app_nation_case/presentation/main/bloc/main_state.dart';
import 'package:bloc/bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(0)) {
    on<MainPageChangedEvent>((event, emit) {
      emit(state.copyWith(index: event.newIndex));
    });
  }
}
