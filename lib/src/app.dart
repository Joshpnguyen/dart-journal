import 'package:flutter/material.dart';
import 'package:dart_journal/src_export.dart';

bool darkMode = false; // false = light mode, true = dark mode

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final routes = {
    'entries page': (context) => JournalEntries(),
    'add entries page': (context) => AddEntry()
  };

  ThemeMode changeTheme() {
    if (darkMode) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Journal Entries',
        changeTheme: changeTheme(),
      ),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.changeTheme})
      : super(key: key);
  final String title;
  final ThemeMode changeTheme;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
      endDrawer: EndDrawer(),
      body: JournalEntries(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          displayAddEntry(context);
        },
        tooltip: 'New journal entry',
        child: Icon(Icons.add),
      ),
    );
  }

  // go to Add Entry screen
  void displayAddEntry(BuildContext context) {
    Navigator.of(context).pushNamed('add entries page');
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => AddEntry()));
  }

  void rebuild() {
    setState(() {});
  }
}
