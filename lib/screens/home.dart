import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/navdrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar:AppBar(
        title: const Text("Autoškola"),
      ),
      body: const Text("hello"),
    );
  }
}




