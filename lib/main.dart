import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Logger App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Register Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input_text = "";
  String now = "";
  final myController = TextEditingController();

  void _updateString(String update) {
    setState(() {
      input_text = update;
      now = DateFormat.yyMMdd().format(DateTime.now());
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter something',
              ),
              controller: myController,
            ),
            Text(
              input_text,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              now,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateString(myController.text);
        },
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      )
    );
  }
}
