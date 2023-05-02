import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:drivingschool/views/home_view/home_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final _defaultLightColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue);
final _defaultDarkColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark);

void main() {
  runApp(
    DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomeView()),
          // GetPage(name: '/second', page: () => Second()),
        ],
        theme: ThemeData(
          colorScheme: lightColorScheme ?? const ColorScheme.light(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? const ColorScheme.dark(),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
      );
    }),
  );
}
