import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsViewController extends GetxController {
  // List<Question> questions = <Question>[].obs;

  @override
  void onInit() async {
    debugPrint("learnquestionsview init");
    loadCategories();
    super.onInit();
  }

  void loadCategories() async {
    // questions = await Get.find<DbController>().getAllQuestions();
  }
}
