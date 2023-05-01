import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeViewController extends GetxController {
  RxInt clicked = 0.obs;

  void userClicked() {
    clicked.value += 1;
  }
}
