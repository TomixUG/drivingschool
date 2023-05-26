import 'package:drivingschool/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  List<Question> questions = Get.arguments;

  var currentQuestion = 0.obs;

  @override
  void onInit() async {
    debugPrint("testview init");
    super.onInit();
  }

  void nextQuestion() async {
    if (currentQuestion > questions.length) return;
    currentQuestion++;
  }

  void prevQuestion() async {
    if (currentQuestion < 0) return;
    currentQuestion--;
  }
}
