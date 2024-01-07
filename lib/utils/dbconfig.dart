import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openDatabases() async {
  final ByteData data = await rootBundle.load('assets/sqlite.db');
  final List<int> bytes = data.buffer.asUint8List();
  final String path =
      '/data/user/0/com.example.wheather/databases/sqlite.db'; // Replace <your_package_name>

  await File(path).writeAsBytes(bytes);

  return await openDatabase(path, version: 1); // Specify the correct version
}
