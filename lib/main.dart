import 'package:flutter/material.dart';
import 'screens/auth.dart';
// import 'screens/form_page.dart';
// import 'widgets/appBar.dart';
import 'package:flutter/services.dart';
import 'package:frontend_job_recruitment/screens/recruiter_screens/recruiter_profile.screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Job Recruitment App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: const Auth(),
      // home: const AmberAppBar(),
        primaryColor: const Color(0xFF5C63B1),
        inputDecorationTheme: Theme.of(context)
            .inputDecorationTheme
            .copyWith(border: const OutlineInputBorder(borderRadius: BorderRadius.zero)),
      ),
      home: RecruiterHome(),
    );
  }
}
