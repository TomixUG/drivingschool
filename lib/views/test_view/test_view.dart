import 'dart:ui';

import 'package:drivingschool/components/test/video_player.dart';
import 'package:drivingschool/views/test_view/test_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final TestViewController controller = Get.put(TestViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Otázka ${controller.currentQuestion.value + 1}/${controller.questions.length}")),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: (controller.questions.length == 1)
              ? const LinearProgressIndicator(value: 1)
              : Obx(() =>
                  LinearProgressIndicator(value: controller.currentQuestion.value / (controller.questions.length - 1))),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Vyhodnotit test',
            onPressed: controller.finishTest,
          ),
          Obx(
            () => IconButton(
              icon: controller.questions[controller.currentQuestion.value].flagged
                  ? const Icon(Icons.flag)
                  : const Icon(Icons.flag_outlined),
              tooltip: controller.questions[controller.currentQuestion.value].flagged ? 'Odoznačit' : 'Označit',
              onPressed: controller.flagQuestion,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
        // height: 50,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: controller.prevQuestion,
                child: const Text("Předchozí otázka"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: controller.nextQuestion,
                child: const Text("Další otázka"),
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (int page) {
          controller.currentQuestion.value = page;
        },
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    <Widget>[
                      if (controller.questions[index].imageUrl != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: VPlayer(
                            asset:
                                'assets/images/${controller.questions[index].categoryId}/${controller.questions[index].imageUrl}',
                          ),
                        ),
                      ],
                      Text(
                        controller.questions[index].text,
                        style: const TextStyle(fontSize: 16),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.questions[index].answers.length,
                        itemBuilder: (BuildContext c, int i) {
                          return Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10), // Adjust the margin as needed
                            child: Obx(
                              () => InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: controller.answeredQuestions.contains(controller.questions[index])
                                    ? null
                                    : () => controller.submitAnswer(
                                        controller.questions[index].answers[i], controller.questions[index]),
                                child: Obx(
                                  () => Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Theme.of(context).focusColor, width: 3),
                                      borderRadius: BorderRadius.circular(15),
                                      color: controller.showedAnswers.contains(controller.questions[index].answers[i])
                                          ? (controller.questions[index].answers[i].isCorrect
                                              ? Colors.green.withOpacity(0.4)
                                              : Colors.red.withOpacity(0.4))
                                          : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
                                    ),
                                    child: Text(controller.questions[index].answers[i].text),
                                  ),
                                ),
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
          );
        },
      ),
    );
  }
}
