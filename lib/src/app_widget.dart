import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_module.dart';
import 'package:splashscreen/splashscreen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blapp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.pink,
            Colors.pink
          ],
        ),
        navigateAfterSeconds: HomeModule(),
        loaderColor: Colors.white,
      ),Center(
      child: Container(
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
          ),
        ),
      ),),
    ],
  );
}