import 'package:flutter/material.dart';
import 'screens/auth.dart';
import 'screens/form_page.dart';
import 'widgets/appBar.dart';
import 'package:flutter/services.dart';


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
      title: 'Job Recruitement App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Auth(),
      // home: const AmberAppBar(),
    );
  }
}
