import 'dart:io';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:drivingschool/views/overview_view/learnquestions/learnquestions_view.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:drivingschool/views/home_view/home_view.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'views/overview_view/learnquestions/learnquestions_view_controller.dart';

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
  await Get.put(DbController()).initDatabase();
  Get.put(LearnQuestionsViewController());

  runApp(
    DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomeView()),
          GetPage(name: '/learnquestions', page: () => LearnQuestionsView()),
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
