import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/test_view/test_result/test_result_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestResultView extends StatelessWidget {
  TestResultView({super.key});

  final TestResultViewController controller = Get.put(TestResultViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Výsledky"),
          actions: [],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed(
                  <Widget>[
                    Text("Úspěšnost: ${controller.successRate()}%"),
                    SizedBox(height: 20),
                    Text("Correct: ${controller.correct()}"),
                    Text("Incorrect: ${controller.incorrect()}"),
                    SizedBox(height: 20),
                    Text("Špatně odpovězené otázky:"),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.params.incorrectQuestions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10), // Adjust the margin as needed
                          child: CustomCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.params.incorrectQuestions[index].text,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.params.incorrectQuestions[index].answers.length,
                                  itemBuilder: (BuildContext c, int i) {
                                    return Text(
                                      controller.params.incorrectQuestions[index].answers[i].text,
                                      style: TextStyle(
                                          color: controller.params.showedAnswers
                                                  .contains(controller.params.incorrectQuestions[index].answers[i])
                                              ? (controller.params.incorrectQuestions[index].answers[i].isCorrect
                                                  ? Colors.green
                                                  : Colors.red)
                                              : null),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
