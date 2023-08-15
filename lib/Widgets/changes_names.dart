import 'package:flutter/material.dart';
import 'package:tournament_assistant/Class/admin.dart';
import 'package:tournament_assistant/Widgets/configure_five_man.dart';
import 'package:tournament_assistant/Widgets/configure_wingman.dart';
import 'package:tournament_assistant/Class/rcv.dart';

const List<String> types = <String>['5v5', 'Wingman'];
const List<int> numOfPlayersFiveMan = <int>[
  0,
  10
]; // <int>[0, 10, 15, 20, 25, 30];
const List<int> numOfPlayersWingman = <int>[
  0,
  16
]; // <int>[0, 8, 12, 16, 20, 24];
// int numberOfPlayers = 0;
int dropdownValueNumOfPlayersWingman = numOfPlayersWingman.first;
int dropdownValueNumOfPlayersFiveMan = numOfPlayersFiveMan.first;

class ChangeNames extends StatefulWidget {
  const ChangeNames({Key? key}) : super(key: key);

  @override
  State<ChangeNames> createState() => _ChangeNamesState();
}

class _ChangeNamesState extends State<ChangeNames> {
  String dropdownValueType = types.first;

  var wingman;
  var fiveman;

  bool _isVisibleWingman = false;
  bool _isVisibleFiveMan = false;

  bool _isVisibleVotingFiveMan = false;
  bool _isVisibleVotingWingman = false;

  void showWingman() {
    setState(() {
      _isVisibleWingman = !_isVisibleWingman;
    });
  }

  void showFiveMan() {
    setState(() {
      _isVisibleFiveMan = !_isVisibleFiveMan;
    });
  }

  void showVotingFiveMan() {
    setState(() {
      _isVisibleVotingFiveMan = !_isVisibleVotingFiveMan;
    });
  }

  void showVotingWingman() {
    setState(() {
      _isVisibleVotingWingman = !_isVisibleVotingWingman;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(children: <Widget>[
                DropdownButton(
                  value: dropdownValueType.toString(),
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
                      dropdownValueType = value!;
                    });
                  },
                  items: types.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                dropdownValueType == "5v5"
                    ? DropdownButton(
                        value: dropdownValueNumOfPlayersFiveMan,
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
                            dropdownValueNumOfPlayersFiveMan = value!;
                          });
                        },
                        items: numOfPlayersFiveMan
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      )
                    : DropdownButton(
                        value: dropdownValueNumOfPlayersWingman,
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
                            dropdownValueNumOfPlayersWingman = value!;
                          });
                        },
                        items: numOfPlayersWingman
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                ElevatedButton(
                    onPressed: () => {
                          if (dropdownValueType == "5v5")
                            {showFiveMan()}
                          else if (dropdownValueType == "Wingman")
                            {showWingman()}
                        },
                    child: Text("Submit"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.background),
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary))),
              ]),
            ),
            Expanded(
              child: Visibility(
                  visible: _isVisibleFiveMan,
                  child: Container(child: ConfigureFiveMan())),
            ),
            Expanded(
              child: Visibility(
                  visible: _isVisibleWingman,
                  child: Container(child: ConfigureWingman())),
            ),

            ElevatedButton(
                onPressed: RCV.getRCVTenMan,
                child: Text("RCV 10 Man"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.background),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary))),

            ElevatedButton(
                onPressed: RCV.getRCVWingman,
                child: Text("RCV Wingman"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.background),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary))),

            // if (dropdownValueNumOfPlayersWingman != 0 && dropdownValueType == "Wingman") ConfigureWingman(numOfPlayersWingman),
            // if (dropdownValueNumOfPlayersFiveMan != 0 && dropdownValueType == "5v5") ConfigureFiveMan(numOfPlayersFiveMan),
          ],
        ),
      ),
    );
  }
}
