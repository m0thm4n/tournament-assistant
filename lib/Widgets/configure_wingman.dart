import 'package:flutter/material.dart';
import 'package:tournament_assistant/Widgets/wingman.dart';

class ConfigureWingman extends StatefulWidget {
  ConfigureWingman({super.key});

  @override
  State<ConfigureWingman> createState() => _ConfigureWingmanState();
}

class _ConfigureWingmanState extends State<ConfigureWingman> {
  List<String> selectedItemValue = [""];
  List<TextEditingController> _controllers = <TextEditingController>[];
  List<String> names = ["NONE"];

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

    super.initState();
  }

  void sendIt() {
    for (var i = 0; i < 16; i++) {
      var controller = _controllers[i];
      names.add(controller.text);
    }

    for (var i = 0; i < names.length; i++) {
      WingmanNames.add(names[i]);
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
      floatingActionButton: ElevatedButton(child: Text("SEND IT!"), onPressed: sendIt, style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.background),
          foregroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary))),
    );
  }
}
