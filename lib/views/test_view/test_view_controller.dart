import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestViewController extends GetxController {
  @override
  void onInit() async {
    debugPrint("testview init");
    super.onInit();
  }

  // void loadCategories() async {
  //   categories = await Get.find<DbController>().getCategories();
  // }
}
