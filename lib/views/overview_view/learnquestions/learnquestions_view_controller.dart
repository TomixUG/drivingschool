import 'package:drivingschool/models/cat.dart';
import 'package:drivingschool/models/question.dart';
import 'package:drivingschool/utils/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsViewController extends GetxController {
  List<Cat> categories = <Cat>[].obs;

  @override
  void onInit() async {
    debugPrint("learnquestionsview init");
    loadCategories();
    super.onInit();
  }

  void loadCategories() async {
    categories = await Get.find<DbController>().getCategories();
  }

  int getTotalCategories() {
    return categories.fold(0, (int sum, Cat item) => sum + item.count);
  }

  void openTestAll() async {
    List<Question> questions = await Get.find<DbController>().getAllQuestions();
    Get.toNamed("/test", arguments: questions);
  }

  void openTestCategories(String categoryId) async {
    List<Question> questions = await Get.find<DbController>().getQuestions(categoryId);
    Get.toNamed("/test", arguments: questions);
  }

  void openDiailog() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Title Text",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Message Text",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'NO',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.amber,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'YES',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.amber,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
