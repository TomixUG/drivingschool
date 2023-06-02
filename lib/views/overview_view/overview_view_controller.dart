import 'package:drivingschool/utils/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewViewController extends GetxController {
  var flaggedAmount = 0.obs;
  var wrongAmount = 0.obs;
  var unshowedAmount = 0.obs;

  @override
  void onInit() async {
    loadAmounts();
    super.onInit();
  }

  void openLearnQuestions() {
    Get.toNamed("/learnquestions");
  }

  void loadAmounts() async {
    flaggedAmount.value = await Get.find<DbController>().getFlaggedAmount();
    wrongAmount.value = await Get.find<DbController>().getWrongAmount();
    unshowedAmount.value = await Get.find<DbController>().getUnshowedAmount();
  }
}
