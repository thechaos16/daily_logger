import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'storage.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.storage});
  final String title;
  final TextStorage storage;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input_text = "";
  String now = "";
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((value) {
      setState(() {
        input_text = value;
      });
    });
  }

  Future<File> _updateString(String update) {
    setState(() {
      input_text = update;
      now = DateFormat("yyMMdd").format(DateTime.now());
    });
    return widget.storage.writeFile(update);
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
                  hintText: '$input_text',
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
