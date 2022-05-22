import 'package:flutter/material.dart';

class HomepageGyt extends StatefulWidget {
  const HomepageGyt({Key? key}) : super(key: key);

  @override
  State<HomepageGyt> createState() => _HomepageGytState();
}

class _HomepageGytState extends State<HomepageGyt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Current Mausam"),
      ),
    ));
  }
}
