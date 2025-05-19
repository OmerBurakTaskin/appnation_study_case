part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  List<DogEntity> allDogs;
  HomeInitialEvent({this.allDogs = const []});
}

class HomeSearchEvent extends HomeEvent {
  final String searchText;

  HomeSearchEvent(this.searchText);
}

class HomeTextfieldStateEvent extends HomeEvent {
  final TextfieldStateEnum textfieldStateEnum;

  HomeTextfieldStateEvent(this.textfieldStateEnum);
}

class HomeTextFieldExpandEvent extends HomeEvent {
  HomeTextFieldExpandEvent();
}
class HomeTextFieldShrinkEvent extends HomeEvent {
  HomeTextFieldShrinkEvent();
}

class HomeSelectDogEvent extends HomeEvent {
  final DogEntity dog;

  HomeSelectDogEvent(this.dog);
}
