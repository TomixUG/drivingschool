import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exam_view_controller.dart';

class ExamView extends StatelessWidget {
  ExamView({super.key});

  ExamViewController controller = Get.put(ExamViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zkouška"),
      ),
      body: Text("Exam"),
    );
  }
}
