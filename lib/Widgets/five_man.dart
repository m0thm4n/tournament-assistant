import 'package:flutter/material.dart';
import 'package:tournament_assistant/Class/submit.dart';
import 'package:tournament_assistant/Widgets/changes_names.dart';
import 'package:tournament_assistant/Widgets/done.dart';

List<String> FiveManNames = [
  "NONE",
  'CivicNomand',
  'AntiProgram',
  'Howl',
  'Disaster',
  'Not Tim',
  'Jonboy',
  'Ganondolf',
  'Uncle',
  'Baychaa',
  'Mike Wazowski',
];

class FiveMan extends StatefulWidget {
  FiveMan();

  @override
  State<FiveMan> createState() => _FiveManState();
}

class _FiveManState extends State<FiveMan> {
  String player1 = "NONE", player2 = "NONE", player3 = "NONE", player4 = "NONE", player5 = "NONE", player6 = "NONE", player7 = "NONE", player8 = "NONE", player9 = "NONE", player10 = "NONE";
  List<String> selectedItemValue = [""];

  @override
  void initState() {
    selectedItemValue.removeAt(0);
  }

  var numOfPlayers = 10;

  // List<String> selectedItemValue = [""];

  List<DropdownMenuItem<String>> _dropDownItem() {
    return FiveManNames.map((value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: numOfPlayers,
          itemBuilder: (BuildContext context, int index) {
            for (int i = 0; i < 10; i++) {
              selectedItemValue.add("NONE");
            }

            return Container(
              color: Theme.of(context).colorScheme.background,
              height: 85,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Text("Player ${index + 1}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  const Padding(padding: EdgeInsets.fromLTRB(150, 0, 0, 0)),
                  DropdownButton(
                    value: 'player${index + 1}', // selectedItemValue[index].toString(),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      // This is called when the user selects an item.
                      setState(() {
                        // selectedItemValue[index] = value!;
                        FiveManNames.removeWhere((element) => element == value);
                      });
                    },
                    items: _dropDownItem(),
                  )
                ],
              ),
            );
          }),
      floatingActionButton: ElevatedButton(
          child: Text("Submit"),
          onPressed: () => {
                Submit.submitForm(selectedItemValue),
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Done()),
            ),
              },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.background),
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary))),
    );
  }
}
