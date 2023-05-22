import 'package:drivingschool/components/shared/expansion_card.dart';
import 'package:drivingschool/views/allquestions_view/allquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllQuestionsView extends StatelessWidget {
  AllQuestionsView({super.key});

  final AllQuestionsViewController controller = Get.put(AllQuestionsViewController());

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
          return ExpansionCard(
            title: controller.questions[index].text,
            child: ListView.builder(
              shrinkWrap: true, // Set shrinkWrap to true for the inner ListView.builder
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
              itemCount: controller.questions[index].answers.length,
              itemBuilder: (c, i) {
                return Text(
                  controller.questions[index].answers[i].text,
                  style: TextStyle(color: controller.questions[index].answers[i].isCorrect ? Colors.green : Colors.red),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
