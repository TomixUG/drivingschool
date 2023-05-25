import 'package:drivingschool/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  List<Question> questions = Get.arguments;

  @override
  void onInit() async {
    debugPrint("testview init");
    super.onInit();
  }

  // void loadCategories() async {
  //   categories = await Get.find<DbController>().getCategories();
  // }
}
