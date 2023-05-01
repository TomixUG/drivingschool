import 'package:flutter/material.dart';
import 'package:drivingschool/views/home_view/home_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => HomeView()),
      // GetPage(name: '/second', page: () => Second()),
    ],
    theme: ThemeData(
      colorScheme: const ColorScheme.light(),
    ),
    darkTheme: ThemeData(
      colorScheme: const ColorScheme.dark(),
    ),
    themeMode: ThemeMode.system,
  ));
}
