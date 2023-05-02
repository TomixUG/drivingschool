import 'package:drivingschool/views/overview_view/overview_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewView extends StatelessWidget {
  OverviewView({super.key});

  OverviewViewController controller = Get.put(OverviewViewController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text("${controller.counter.value}")),
            ElevatedButton(onPressed: controller.increment, child: Text("click me")),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                    child: Column(
                      children: [
                        const Text("Kurz Autoškola B"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Progress: "),
                            Text("Progress: "),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                    child: Column(
                      children: [
                        const Text(""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Progress: "),
                            Text("Progress: "),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
