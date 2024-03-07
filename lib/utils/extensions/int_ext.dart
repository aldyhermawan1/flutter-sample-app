

extension IntExt on int? {
  int orZero() {
    if (this != null) {
      return this!;
    }
    return 0;
  }
}
