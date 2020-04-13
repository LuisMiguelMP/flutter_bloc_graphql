import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blapp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeModule(),
    );
  }
}
