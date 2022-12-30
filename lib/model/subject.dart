class Subject {
  String str_addUpToFirst = '''
    int addUpToFirst(n) {
      var total = 0;
      for (var i = 0; i <= n; i++) {
        total += i;
      }
      return total;
    }
    ''';

  String str_addUpToSecond = '''
    int addUpToSecond(n) {
      return n * (n + 1) / 2;
    }
  ''';

  int addUpToFirst(int n) {
    var total = 0;
    for (var i = 0; i <= n; i++) {
      total += i;
    }
    return total;
  }

  int addUpToSecond(int n) {
    return (n * (n + 1) / 2).toInt();
  }
}
