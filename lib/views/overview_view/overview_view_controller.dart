import 'package:get/get.dart';

class OverviewViewController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value += 5;
  }
}
