import 'package:flutter/material.dart';
import 'screens/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Json Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicJsonScreen(title: 'Flutter JSON Exam'),
    );
  }
}
