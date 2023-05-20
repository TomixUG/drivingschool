import 'package:drivingschool/views/allquestions_view/allquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllQuestionsView extends StatelessWidget {
  AllQuestionsView({super.key});

  AllQuestionsViewController controller = Get.put(AllQuestionsViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Všechny otázky",
        ),
      ),
      body: ListView.builder(
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.questions[index].text),
          );
        },
      ),
    );
  }
}
