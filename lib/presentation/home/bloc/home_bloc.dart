import 'package:app_nation_case/core/constants/enum/textfield_state_enum.dart';
import 'package:app_nation_case/data/entities/dog_entity.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInitialEvent>((event, emit) {
      emit(state.copyWith(allDogs: event.allDogs, filteredDogs: event.allDogs));
    });
    on<HomeSearchEvent>((event, emit) {
      final filteredDogs = state.allDogs
          .where((dog) =>
              dog.name
                  ?.toLowerCase()
                  .contains(event.searchText.toLowerCase()) ??
              false)
          .toList();
      emit(state.copyWith(filteredDogs: filteredDogs));
    });
    on<HomeTextfieldStateEvent>((event, emit) {
      emit(state.copyWith(textfieldStateEnum: event.textfieldStateEnum));
    });
    on<HomeSelectDogEvent>((event, emit) {
      emit(state.copyWith(selectedDog: event.dog));
    });
    on<HomeTextFieldExpandEvent>((event, emit) {
      if (state.textfieldState == TextfieldStateEnum.small) {
        emit(state.copyWith(textfieldStateEnum: TextfieldStateEnum.medium));
      } else if (state.textfieldState == TextfieldStateEnum.medium) {
        emit(state.copyWith(textfieldStateEnum: TextfieldStateEnum.large));
      }
    });

    on<HomeTextFieldShrinkEvent>((event, emit) {
      if (state.textfieldState == TextfieldStateEnum.large) {
        emit(state.copyWith(textfieldStateEnum: TextfieldStateEnum.medium));
      } else if (state.textfieldState == TextfieldStateEnum.medium) {
        emit(state.copyWith(textfieldStateEnum: TextfieldStateEnum.small));
      }
    });
  }
}
