import 'package:drivingschool/utils/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllQuestionsViewController extends GetxController {
  void btnClick() async {
    final allRows = await Get.find<DbController>().getAllQuestions();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }
}
