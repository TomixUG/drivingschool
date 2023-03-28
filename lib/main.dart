import 'package:flutter/material.dart';
import 'package:drivingschool/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Home(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      
    )
  );
}
