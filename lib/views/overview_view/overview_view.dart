import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/overview_view/overview_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewView extends StatelessWidget {
  OverviewView({super.key});

  OverviewViewController controller = Get.put(OverviewViewController());

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
                  CustomCard(
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomCard(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
