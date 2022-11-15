import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/screens/landing.screen.dart';
import 'package:frontend_job_recruitment/widgets/footer.widget.dart';
import 'package:frontend_job_recruitment/widgets/login.widget.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../widgets/head_banner.widget.dart';
import '../widgets/roundedToggle.widget.dart';

class LoginPage extends StatefulWidget {
  final BoxConstraints box;

  const LoginPage({Key? key, required this.box}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadBanner(applyButton: false),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Sign In',
                    style: titleStyle.merge(
                      TextStyle(color: paletteIndigo),
                    ),
                  ),
                ),
              ),
              Center(
                child: RoundedToggle(
                  box: widget.box,
                  callback: (toggle) async {
                    setState(() {
                      this.toggle = toggle;
                    });
                  },
                  option1: 'Applicant',
                  option2: 'Company',
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              LoginForm(
                  callback: () => !toggle ? LandingPages.userProfile : LandingPages.companyProfile),
              Footer(box: widget.box),
            ],
          ),
        ),
      ],
    );
  }
}
