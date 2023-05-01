import 'package:drivingschool/views/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewController homeController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autoškola"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text("Count: ${homeController.clicked}"),
            ),
            ElevatedButton(
              child: const Text("Click me"),
              onPressed: () {
                homeController.userClicked();
              },
            ),
          ],
        ),
      ),
    );
  }
}
