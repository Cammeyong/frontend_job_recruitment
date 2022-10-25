import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/registration.screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amber Employ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FormPage(),
    );
  }
}
