import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tournament_assistant/Widgets/changes_names.dart';
import 'package:tournament_assistant/Widgets/five_man.dart';
import 'package:tournament_assistant/Widgets/wingman.dart';
import 'package:tournament_assistant/Widgets/check_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tournament_assistant/Widgets/changes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: const ColorScheme(
          background: Color.fromRGBO(36, 3, 47, 100),
          brightness: Brightness.light,
          primary: Color.fromRGBO(189, 163, 254, 100),
          secondary: Color.fromRGBO(164, 70, 236, 100),
          error: Colors.redAccent,
          onSecondary: Color.fromRGBO(164, 70, 236, 0),
          onBackground: Colors.deepPurple,
          surface: Colors.red,
          onError: Colors.redAccent,
          onSurface: Colors.white,
          onPrimary: Color.fromRGBO(141, 24, 231, 0),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        initialIndex: 1,
        length: tabsCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tournament Assistant', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            backgroundColor: Theme.of(context).colorScheme.background,
            // This check specifies which nested Scrollable's scroll notification
            // should be listened to.
            //
            // When `ThemeData.useMaterial3` is true and scroll view has
            // scrolled underneath the app bar, this updates the app bar
            // background color and elevation.
            //
            // This sets `notification.depth == 1` to listen to the scroll
            // notification from the nested `ListView.builder`.
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            // The elevation value of the app bar when scroll view has
            // scrolled underneath the app bar.
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.looks_two_sharp),
                  text: "Wingman",
                ),
                Tab(
                  icon: const Icon(Icons.five_g_sharp),
                  text: "5v5",
                ),
                Tab(
                  icon: const Icon(Icons.admin_panel_settings),
                  text: "admin",
                ),
              ],
            ),
          ),

          // AppBar(
          //   // Here we take the value from the MyHomePage object that was created by
          //   // the App.build method, and use it to set our appbar title.
          //   title: Text(widget.title),
          //   backgroundColor: Theme.of(context).colorScheme.background,
          //   elevation: 5,
          //   actions: <Widget>[
          //     ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(
          //       builder: (context) => const Wingman()
          //     )), child: Text("Wingman", style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
          //     ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(
          //       builder: (context) => const FiveMan()
          //     )), child: Text("Five Man", style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
          //   ],
          // ),
          body: TabBarView(
            children: <Widget>[
              Wingman(),
              FiveMan(),
              CheckAuth(),
            ],
          ),
        ));
  }
}
