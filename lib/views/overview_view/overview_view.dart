import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/overview_view/overview_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.dashboard),
                              SizedBox(width: 20),
                              Text(
                                "Kurz Autoškola B",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Divider(color: Theme.of(context).dividerColor, thickness: 0.5),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 5.0,
                                    percent: 0.4,
                                    // center: new Text("100%"),
                                    progressColor: Colors.green,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Hotové: "),
                                      Text("40 %"),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 25.0,
                                    percent: 1,
                                    center: new Text("10%", style: TextStyle(color: Colors.white)),
                                    progressColor: Colors.red,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Úspěšnost: "),
                                      Text("Neprošel", style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
