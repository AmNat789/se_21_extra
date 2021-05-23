import 'package:flutter/material.dart';
import 'package:se_21/sensors_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensors and State Restoration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SensorsPage(),
    );
  }
}
