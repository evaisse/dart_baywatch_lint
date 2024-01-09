int danger() {
  throw Error();
}

void main() {
  String? foo;
  final list = <String>[];
  final map = <String, String>{};

  try {
    final a = 1;
  } catch (e) {
    //
  }

  danger();

  final b;

  final res = <String>[
    // expect_lint: riverpod_final_provider
    "foo".codeUnitAt(10).toString(),
    "igor".substring(10, 3),
    list.first,
    list.last,
    list[1],
    list.firstWhere((element) => element != "1"),
    list.lastWhere((element) => element != "1"),
    foo!,
    map["foof"]!,
    "jljljl"[200],
  ];

  for (var element in res) {
    print(element.isEmpty);
  }
}
