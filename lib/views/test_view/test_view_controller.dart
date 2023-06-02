import 'package:drivingschool/models/answer.dart';
import 'package:drivingschool/models/question.dart';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:drivingschool/views/overview_view/overview_view_controller.dart';
import 'package:drivingschool/views/test_view/test_result/test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  List<Question> questions = Get.arguments;

  var currentQuestion = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  var switching = false;

  final showedAnswers = <Answer>[].obs;
  final answeredQuestions = <Question>[].obs;

  final correctQuestions = <Question>[].obs;
  final incorrectQuestions = <Question>[].obs;

  final OverviewViewController overviewController = Get.find(); // to refresh the amounts

  @override
  void onInit() async {
    debugPrint("testview init");
    super.onInit();
  }

  @override
  onClose() {
    debugPrint("closing..");
    overviewController.loadAmounts(); // refresh amounts in overview
    super.onClose();
  }

  void submitAnswer(Answer answer, Question question) async {
    answeredQuestions.add(question);

    if (answer.isCorrect) {
      showedAnswers.add(answer);
      // answer is correct
      correctQuestions.add(question);
      Get.find<DbController>().setCorrect(question.id, true); // save the answer
    } else {
      // add all correct answers
      for (var a in question.answers) {
        if (a.isCorrect) showedAnswers.add(a);
      }
      showedAnswers.add(answer);
      // answer is incorrect
      incorrectQuestions.add(question);
      Get.find<DbController>().setCorrect(question.id, false); // save the answer
    }
  }

  void finishTest() {
    // if user didn't answer anything just go back
    if (showedAnswers.isEmpty) {
      Get.back();
      return;
    }

    // pop the current route and go to testresult
    Get.offNamed(
      "/testresult",
      arguments: TestResultModel(
        showedAnswers: showedAnswers,
        answeredQuestions: answeredQuestions,
        correctQuestions: correctQuestions,
        incorrectQuestions: incorrectQuestions,
      ),
    );
  }

  void flagQuestion() async {
    questions[currentQuestion.value].flagged = !questions[currentQuestion.value].flagged;

    // force state refresh using this TODO: improve this garbage
    currentQuestion += 1;
    currentQuestion -= 1;

    Get.find<DbController>()
        .setFlagged(questions[currentQuestion.value].id, questions[currentQuestion.value].flagged); // save the answer
  }

  void nextQuestion() async {
    if (switching == true) return;

    if (currentQuestion >= questions.length - 1) {
      finishTest();
      return;
    } // the test is completed

    switching = true;
    await pageController.animateToPage(++currentQuestion.value,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    switching = false;
  }

  void prevQuestion() async {
    if (switching == true) return;

    if (currentQuestion <= 0) return;

    switching = true;
    await pageController.animateToPage(--currentQuestion.value,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    switching = false;
  }
}
