import 'package:drivingschool/views/allquestions_view/allquestions_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllQuestionsView extends StatelessWidget {
  AllQuestionsView({super.key});

  AllQuestionsViewController controller = Get.put(AllQuestionsViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Všechny otázky",
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  Text("hello"),
                  SizedBox(height: 200),
                  Text("hello"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
