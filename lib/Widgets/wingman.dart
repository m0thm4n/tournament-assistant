import 'package:flutter/material.dart';
import 'package:tournament_assistant/Class/submit.dart';
import 'package:tournament_assistant/Widgets/changes_names.dart';
import 'package:tournament_assistant/Widgets/done.dart';

List<String> WingmanNames = [
  "NONE",
  'ZebraOnCrack',
  'N@MO',
  'Nick',
  'Chief Papin',
  'Jacob',
  'Coolspy01',
  'TMBreezy',
  'Big T',
  'Bamboozled',
  'Totorro',
  'Radio_Killa',
  'Nomality',
  'Groveskeeper',
  'UncleJack',
  'NickM',
  'Spoody'
];

class Wingman extends StatefulWidget {
  var numOfPlayers;

  Wingman();

  @override
  State<Wingman> createState() => _WingmanState();
}

class _WingmanState extends State<Wingman> {
  List<String> selectedItemValue = [""];

  @override
  void initState() {
    selectedItemValue.removeAt(0);
  }

  var numOfPlayers = 16;

  List<DropdownMenuItem<String>> _dropDownItem() {
    // List<String> ddl = [
    //   "NONE",
    //   'ZebraOnCrack',
    //   'N@MO',
    //   'Nick',
    //   'Chief Papin',
    //   'Jacob',
    //   'Coolspy01',
    //   'TMBreezy',
    //   'Big T',
    //   'Bamboozled',
    //   'Totorro',
    //   'Radio_Killa',
    //   'Nomality',
    //   'Groveskeeper',
    //   'UncleJack',
    //   'NickM',
    //   'Spoody'
    // ];

    return WingmanNames.map((value) => DropdownMenuItem(
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
            for (int i = 0; i < 16; i++) {
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
                    value: selectedItemValue[index].toString(),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      // This is called when the user selects an item.
                      selectedItemValue[index] = value!;
                      WingmanNames.remove(value);
                      setState(() {});
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
