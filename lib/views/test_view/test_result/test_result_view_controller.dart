import 'package:drivingschool/models/question.dart';
import 'package:drivingschool/views/test_view/test_result/test_result_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestResultViewController extends GetxController {
  TestResultModel data = Get.arguments;

  @override
  void onInit() async {
    debugPrint("testresultview init");
    super.onInit();
  }

  double successRate() => double.parse(((data.correct / (data.correct + data.incorrect)) * 100).toStringAsFixed(2));
}
