import 'package:clock_app/enums.dart';
import 'package:clock_app/homePage.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) =>
              MenuInfo(MenuType.clock, imageSource: '', title: ''),
          child: HomePage()),
    );
  }
}
