import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/models/person.dart';
import 'package:hive_project/views/home.dart';

// Main Hive box
late Box box;

Future<void> main() async {
  // Init and set hive variables
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  // Main box = "box"
  box = await Hive.openBox('box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hive Porject',
      home: Home(),
    );
  }
}
