extension Capitilizer on String {
  String capitilizeFirstLetters() {
    return split(" ")
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word)
        .join(" ");
  }
}
