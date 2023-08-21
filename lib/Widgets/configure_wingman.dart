import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tournament_assistant/Widgets/wingman.dart';

class ConfigureWingman extends HookWidget {
  List<String> selectedItemValue = [""];
  List<TextEditingController> _controllers = <TextEditingController>[];
  List<String> names = ["NONE"];
  Map<String, dynamic> mappedPlayer = {};

  @override
  void initState() {
    for (var i = 0; i < 16; i++) {
      if (WingmanNames[i] == "NONE") {
        continue;
      } else {
        WingmanNames.removeAt(i);
      }
    }
    names.removeAt(0);
  }

  void sendIt(List<TextEditingController> controllers) {
    // for (var i = 0; i < 16; i++) {
    //   var controller = _controllers[i];
    //   names.add(controller.text);
    // }
    //
    // for (var i = 0; i < names.length; i++) {
    //   WingmanNames.add(names[i]);
    // }
    for (var i = 0; i < 16; i++) {
      var controller = _controllers[i];
      // names.add(controller.text);
      mappedPlayer.addAll({"player$i": controller.text});
    }

    for (var i = 0; i < names.length; i++) {
      FirebaseFirestore.instance.collection('wingmanParticipants').add(
        mappedPlayer,
      );
    }
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "NONE",
      // 'ZebraOnCrack',
      // 'N@MO',
      // 'Nick',
      // 'Chief Papin',
      // 'Jacob',
      // 'Coolspy01',
      // 'TMBreezy',
      // 'Big T',
      // 'Bamboozled',
      // 'Totorro'
    ];

    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            for (int i = 0; i < 16; i++) {
              _controllers.add(TextEditingController());
            }

            return TextField(
              controller: _controllers[index],
            );
          }),
      floatingActionButton: ElevatedButton(child: Text("SEND IT!"), onPressed: () {
        sendIt(_controllers);
      }, style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.background),
          foregroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary))),
    );
  }
}
