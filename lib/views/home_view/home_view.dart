import 'package:drivingschool/views/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../allquestions_view/allquestions_view.dart';
import '../exam_view/exam_view.dart';
import '../overview_view/overview_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autoškola"),
      ),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              OverviewView(),
              ExamView(),
              AllQuestionsView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Učení"),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Zkouška"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Všechny otázky"),
          ],
        ),
      ),
    );
  }
}
