import 'dart:io';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:drivingschool/views/home_view/home_view.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// final _defaultLightColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue);
// final _defaultDarkColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark);

void main() async {
  // database stuff
  // windows or linux has different sqlite backend
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  WidgetsFlutterBinding.ensureInitialized();

  // create instance of DbController (inits the db)
  Get.put(DbController());

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
