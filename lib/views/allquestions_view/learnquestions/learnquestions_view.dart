import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/allquestions_view/learnquestions/learnquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsView extends StatelessWidget {
  LearnQuestionsView({super.key});

  final LearnQuestionsViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie"),
      ),
      body: ListView.builder(
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8, right: 20, left: 20),
            child: CustomCard(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
                child: Row(
                  children: [
                    Text(controller.categories[index].name),
                    const Spacer(),
                    Text("${controller.categories[index].count}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
