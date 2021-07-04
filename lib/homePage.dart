import 'package:clock_app/clockView.dart';
import 'package:clock_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        alignment: Alignment.center,
        child: ClockView(),
      ),
    );
  }
}
