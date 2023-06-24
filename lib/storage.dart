import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


class TextStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/text.txt');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final prev_text = await file.readAsString();
      return prev_text;
    } catch (e) {
      return 'enter something';
    }
  }

  Future<File> writeFile(String str) async {
    final file = await _localFile;
    return file.writeAsString('$str');
  }
}