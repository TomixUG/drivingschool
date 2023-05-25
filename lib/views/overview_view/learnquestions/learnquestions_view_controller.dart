import 'package:drivingschool/models/cat.dart';
import 'package:drivingschool/models/question.dart';
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

  int getTotalCategories() {
    return categories.fold(0, (int sum, Cat item) => sum + item.count);
  }

  void openTestAll() async {
    List<Question> questions = await Get.find<DbController>().getAllQuestions();
    Get.toNamed("/test", arguments: questions);
  }

  void openTestCategories(String categoryId) async {
    List<Question> questions = await Get.find<DbController>().getQuestions(categoryId);
    Get.toNamed("/test", arguments: questions);
  }
}
