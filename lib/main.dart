import 'package:flutter/material.dart';
import'input.dart';
import 'result_screen.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF384988),
        scaffoldBackgroundColor:inactive_container_color,
      ),
      home: InputPage(),

    );
  }
}

