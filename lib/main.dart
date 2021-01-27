import 'package:flutter/material.dart';
import 'package:test_app/screens/users_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFFEEEEEE),
        textTheme: TextTheme(
          /// TITLE TEXT
          headline1: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Color(0xFF303030),
          ),
        ),
      ),
      home: Scaffold(body: UsersScreen()),
    );
  }
}
