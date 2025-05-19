class MainState {
  final int currentIndex;
  MainState(this.currentIndex);

  MainState copyWith({int? index}) {
    return MainState(index ?? currentIndex);
  }
}
