import 'package:cloud_firestore/cloud_firestore.dart';
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
  late CollectionReference<Map<String, dynamic>> wingmanPlayers;

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

  Future<List<DropdownMenuItem>> _dropDownItem() async {
    List<DropdownMenuItem> items = [];

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

    // return WingmanNames.map((value) => DropdownMenuItem(
    //       value: value,
    //       child: Text(value),
    //     )).toList();

    CollectionReference<Map<String, dynamic>> wingmanPlayers = FirebaseFirestore.instance.collection('wingmanParticipants');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await wingmanPlayers.get();

    // Get data from docs and convert map to List
    final List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) => <String, dynamic>{'Player1': doc['Player1'], 'Player2': doc['Player2'], 'Player3': doc['Player3'], 'Player4': doc['Player4'], 'Player5': doc['Player5'], 'Player6': doc['Player6'], 'Player7': doc['Player7'], 'Player8': doc['Player8'], 'Player9': doc['Player9'], 'Player10': doc['Player10'], 'Player11': doc['Player11'], 'Player12': doc['Player12'], 'Player13': doc['Player13'], 'Player14': doc['Player14'], 'Player15': doc['Player15'], 'Player16': doc['Player16']}).toList();

    for (var i = 0; i < data.length; i++) {
      items.add(DropdownMenuItem(value: data[i]["player$i"], child: Text(data[i]["player$i"])));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> items = [];

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
                    items: _dropDownItem()
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
