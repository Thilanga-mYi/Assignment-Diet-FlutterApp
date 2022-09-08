import 'package:flutter/material.dart';
import 'package:NutritionApplication/Views/Common/SplashScreen.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: 'Doc APP',
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
