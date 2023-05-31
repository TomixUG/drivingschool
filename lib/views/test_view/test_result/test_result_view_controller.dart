import 'package:drivingschool/views/test_view/test_result/test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestResultViewController extends GetxController {
  TestResultModel params = Get.arguments;

  @override
  void onInit() async {
    debugPrint("testresultview init");
    super.onInit();
  }

  int correct() => params.correctQuestions.length;
  int incorrect() => params.incorrectQuestions.length;

  int successRate() =>
      ((params.correctQuestions.length / (params.correctQuestions.length + params.incorrectQuestions.length) * 100))
          .round();
}
