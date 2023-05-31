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
                    Text("Correct: ${controller.data.correct}"),
                    Text("Incorrect: ${controller.data.incorrect}"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
