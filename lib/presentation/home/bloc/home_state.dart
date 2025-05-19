part of 'home_bloc.dart';

class HomeState {
  final List<DogEntity> allDogs;
  final List<DogEntity> filteredDogs;
  final TextfieldStateEnum textfieldState;
  final DogEntity? selectedDog;

  HomeState(
      {this.allDogs = const [],
      this.filteredDogs = const [],
      this.selectedDog,
      this.textfieldState = TextfieldStateEnum.small});

  HomeState copyWith(
      {List<DogEntity>? allDogs,
      List<DogEntity>? filteredDogs,
      DogEntity? selectedDog,
      TextfieldStateEnum? textfieldStateEnum}) {
    return HomeState(
        allDogs: allDogs ?? this.allDogs,
        selectedDog: selectedDog ?? this.selectedDog,
        filteredDogs: filteredDogs ?? this.filteredDogs,
        textfieldState: textfieldStateEnum ?? textfieldState);
  }
}
