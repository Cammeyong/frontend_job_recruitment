import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/screens/recruiter_screens/recruiter_profile.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF5C63B1),
        inputDecorationTheme: Theme.of(context)
            .inputDecorationTheme
            .copyWith(border: const OutlineInputBorder(borderRadius: BorderRadius.zero)),
      ),
      home: RecruiterHome(),
    );
  }
}
