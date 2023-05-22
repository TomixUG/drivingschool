import 'package:drivingschool/views/allquestions_view/learnquestions/learnquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsView extends StatelessWidget {
  LearnQuestionsView({super.key});

  final LearnQuestionsViewController controller = Get.put(LearnQuestionsViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie"),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  Text("question view"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
