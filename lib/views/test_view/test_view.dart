import 'package:drivingschool/views/test_view/test_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final TestViewController controller = Get.put(TestViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie"),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
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
