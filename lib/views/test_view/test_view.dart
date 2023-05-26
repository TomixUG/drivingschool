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
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        child: Row(
          children: [
            ElevatedButton(
              onPressed: controller.prevQuestion,
              child: const Text("Previous question"),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: controller.nextQuestion,
              child: const Text("Next question"),
            ),
          ],
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
                      Text(controller.questions[index].text),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.questions[index].answers.length,
                        itemBuilder: (BuildContext c, int i) {
                          return ListTile(
                            title: Text(controller.questions[index].answers[i].text),
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
