abstract class MainEvent {}

class MainPageChangedEvent extends MainEvent {
  final int newIndex;
  MainPageChangedEvent(this.newIndex);
}
