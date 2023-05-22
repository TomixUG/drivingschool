import 'package:drivingschool/models/cat.dart';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsViewController extends GetxController {
  List<Cat> categories = <Cat>[].obs;

  @override
  void onInit() async {
    debugPrint("learnquestionsview init");
    loadCategories();
    super.onInit();
  }

  void loadCategories() async {
    categories = await Get.find<DbController>().getCategories();
  }
}
