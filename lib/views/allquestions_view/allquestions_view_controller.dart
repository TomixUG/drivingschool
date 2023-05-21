import 'package:drivingschool/models/question.dart';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:get/get.dart';

class AllQuestionsViewController extends GetxController {
  List<Question> questions = <Question>[].obs;
  @override
  void onInit() async {
    loadQuestions();
    super.onInit();
  }

  void loadQuestions() async {
    questions = await Get.find<DbController>().getAllQuestions();
  }
}
