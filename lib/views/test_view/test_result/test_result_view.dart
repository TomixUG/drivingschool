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
          title: const Text("Výsledky"),
          actions: [],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed(
                  <Widget>[
                    CustomCard(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${controller.successRate()}%",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  style:
                                      TextStyle(fontSize: 16.0, color: Theme.of(context).textTheme.bodyMedium!.color),
                                  children: [
                                    TextSpan(
                                        text: '${controller.correct()}', style: const TextStyle(color: Colors.green)),
                                    const TextSpan(text: ' / '),
                                    TextSpan(text: '${controller.params.answeredQuestions.length}'),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          LinearProgressIndicator(
                            value: controller.successRate() / 100,
                            color: Colors.green,
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 15),
                    const Text(
                      "Špatně odpovězené otázky:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
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
                                const SizedBox(height: 15),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.params.incorrectQuestions[index].answers.length,
                                  itemBuilder: (BuildContext c, int i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                      child: Text(
                                        "\u2022  ${controller.params.incorrectQuestions[index].answers[i].text}",
                                        style: TextStyle(
                                            color: controller.params.showedAnswers
                                                    .contains(controller.params.incorrectQuestions[index].answers[i])
                                                ? (controller.params.incorrectQuestions[index].answers[i].isCorrect
                                                    ? Colors.green
                                                    : Colors.red)
                                                : null),
                                      ),
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
