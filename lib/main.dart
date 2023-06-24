import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'homepage.dart';
import 'storage.dart';


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
      home: MyHomePage(title: 'Register Page', storage: TextStorage()),
    );
  }
}
