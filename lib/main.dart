import 'package:flutter/material.dart';
import 'pages/TaskPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}
