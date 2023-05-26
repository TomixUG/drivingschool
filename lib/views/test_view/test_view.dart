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
        title: Obx(() => Text("Otázka ${controller.currentQuestion}/${controller.questions.length}")),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  Obx(
                    () => Text(controller.questions[controller.currentQuestion.toInt()].text),
                  ),
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.questions[controller.currentQuestion.toInt()].answers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(controller.questions[controller.currentQuestion.toInt()].answers[index].text),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.nextQuestion,
                    child: const Text("Next question"),
                  ),
                  ElevatedButton(
                    onPressed: controller.prevQuestion,
                    child: const Text("Previous question"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
