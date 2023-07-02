import 'package:drivingschool/views/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../allquestions_view/allquestions_view.dart';
import '../exam_view/exam_view.dart';
import '../overview_view/overview_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        () => NavigationBar(
          onDestinationSelected: controller.changeTabIndex,
          selectedIndex: controller.tabIndex.value,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Učení"),
            NavigationDestination(icon: Icon(Icons.assignment), label: "Zkouška"),
            NavigationDestination(icon: Icon(Icons.book), label: "Všechny otázky"),
          ],
        ),
      ),
    );
  }
}
