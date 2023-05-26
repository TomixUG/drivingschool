import 'package:drivingschool/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  List<Question> questions = Get.arguments;
  var currentQuestion = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() async {
    debugPrint("testview init");
    super.onInit();
  }

  void nextQuestion() async {
    if (currentQuestion >= questions.length - 1) return; // the test is completed
    await pageController.animateToPage(++currentQuestion.value,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void prevQuestion() async {
    if (currentQuestion <= 0) return;
    await pageController.animateToPage(--currentQuestion.value,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
