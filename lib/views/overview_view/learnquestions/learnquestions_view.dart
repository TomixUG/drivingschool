import 'package:drivingschool/components/shared/custom_card.dart';
import 'package:drivingschool/views/overview_view/learnquestions/learnquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnQuestionsView extends StatelessWidget {
  LearnQuestionsView({super.key});

  final LearnQuestionsViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  CustomCard(
                    onTap: () => controller.openTestAll(),
                    child: Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          const Text("Všechny otázky"),
                          const Spacer(),
                          Text("${controller.getTotalCategories()}"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: CustomCard(
                          onTap: () => controller.openTestCategories(controller.categories[index].id),
                          child: Container(
                            margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Text(controller.categories[index].name),
                                const Spacer(),
                                Text("${controller.categories[index].count}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
