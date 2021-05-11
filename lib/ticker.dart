class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (sec) => ticks - sec - 1);
  }
}
