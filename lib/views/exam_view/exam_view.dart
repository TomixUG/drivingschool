import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exam_view_controller.dart';

class ExamView extends StatelessWidget {
  ExamView({super.key});

  final ExamViewController controller = Get.put(ExamViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zkouška"),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  Text("Exam"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
