import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/overview_view/learnquestions/learnquestions_view.dart';
import 'package:drivingschool/views/overview_view/overview_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverviewView extends StatelessWidget {
  OverviewView({super.key});

  final OverviewViewController controller = Get.put(OverviewViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Učení"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //     color: Colors.red,
                    //     width: 5,
                    //   ),
                    // ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.directions_car_rounded),
                            // Icon(Icons.motorcycle_outlined),
                            // Icon(Icons.directions_bus_rounded),
                            // Icon(Icons.local_shipping),
                            SizedBox(width: 20),
                            Text("Kurz Autoškola B", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Divider(color: Theme.of(context).dividerColor, thickness: 0.5),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 5.0,
                                    percent: controller.completionRate.value,
                                    progressColor: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Hotové: "),
                                    Obx(
                                      () => Text("${(controller.completionRate * 100).toStringAsFixed(1)} %"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 25.0,
                                    percent: 1,
                                    center: Text("${(controller.successRate * 100).toStringAsFixed(1)}%",
                                        style: const TextStyle(color: Colors.white)),
                                    progressColor: (controller.successRate >= 0.86) ? Colors.green : Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Úspěšnost: "),
                                    Obx(
                                      () => (controller.successRate >= 0.86)
                                          ? const Text("Prošel", style: TextStyle(color: Colors.green))
                                          : const Text("Neprošel", style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).dividerColor, thickness: 0.5),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            IconButton.filledTonal(
                              iconSize: 25,
                              constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
                              onPressed: controller.openFlagged,
                              icon: const Icon(Icons.flag),
                            ),
                            const SizedBox(height: 10),
                            const Text("Označené", style: TextStyle(fontSize: 15)),
                            Obx(() => Text("${controller.flaggedAmount} otázek")),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            IconButton.filledTonal(
                              iconSize: 25,
                              constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
                              onPressed: controller.openWrong,
                              icon: const Icon(Icons.close),
                            ),
                            const SizedBox(height: 10),
                            const Text("Špatné", style: TextStyle(fontSize: 15)),
                            Obx(() => Text("${controller.wrongAmount} otázek")),
                          ],
                        ),
                        const Spacer(),
                        Column(children: [
                          IconButton.filledTonal(
                            iconSize: 25,
                            constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
                            onPressed: controller.openUnshowed,
                            icon: const Icon(Icons.question_mark),
                          ),
                          const SizedBox(height: 10),
                          const Text("Nezobrazené", style: TextStyle(fontSize: 15)),
                          Obx(() => Text("${controller.unshowedAmount} otázek")),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Theme.of(context).dividerColor, thickness: 0.5),
                  const SizedBox(height: 25),
                  LearnQuestionsView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
