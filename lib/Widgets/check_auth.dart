import 'package:flutter/material.dart';
import 'package:tournament_assistant/Widgets/changes_names.dart';

// String password = "271c1fad-766c-4a6b-8f1c-270c0d1c890c";
String password = "7";

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  TextEditingController controller = TextEditingController();

  void checkAuth() {
    print(controller.text);
    if (controller.text == password.toString()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ChangeNames(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
            controller: controller,
          ),
      floatingActionButton: ElevatedButton(
          child: Text("Check Auth"),
          onPressed: checkAuth,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.background),
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary))),
    );
  }
}
