import 'package:cloud_firestore/cloud_firestore.dart';

class Submit {
  static void submitForm(List<String> list) async {
    Map<String, dynamic> players = {};

    List names = [""];
    names.removeAt(0);

    print(list);

    list.removeWhere((element) => element == "NONE");

    for (var i = 0; i < list.length; i++) {
      if (names.contains(list[i])) {
        print(list[i]);
        throw ("Failed to submit form due to duplicate names.");
      } else {
        names.add(list[i]);
      }
    }

    list.forEach((p) {

    });

    for (var i = 0; i < names.length; i++) {
      players.addAll({"Player${i + 1}": "${names[i]}"});
    }

    FirebaseFirestore.instance.collection('players').add(
      players,
    );
  }
}
