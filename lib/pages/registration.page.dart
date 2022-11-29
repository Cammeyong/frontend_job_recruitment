import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/models/user.model.dart';
import 'package:frontend_job_recruitment/providers/landing_pages.provider.dart';
import 'package:frontend_job_recruitment/screens/landing.screen.dart';
import 'package:frontend_job_recruitment/utils/async_response.handler.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';
import 'package:frontend_job_recruitment/widgets/head_banner.widget.dart';
import 'package:frontend_job_recruitment/widgets/register_applicant.widget.dart';
import 'package:frontend_job_recruitment/widgets/register_company.widget.dart';
import 'package:frontend_job_recruitment/widgets/roundedToggle.widget.dart';

import '../models/company.model.dart';
import '../widgets/footer.widget.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  final BoxConstraints box;

  const RegistrationPage({Key? key, required this.box}) : super(key: key);

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  bool toggle = false;
  bool going = false;

  @override
  Widget build(BuildContext context) {
    var nav = Navigator.of(context);
    var messenger = ScaffoldMessenger.of(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 250),
                children: [
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            'Registration',
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
                              going = true;
                            });
                            await Future.delayed(const Duration(milliseconds: 300));
                            setState(() {
                              going = false;
                              this.toggle = toggle;
                            });
                          },
                          option1: 'Applicant',
                          option2: 'Company',
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      !toggle
                          ? TweenAnimationBuilder(
                              tween: Tween<double>(begin: !going ? 0 : 1, end: !going ? 1 : 0),
                              duration: const Duration(milliseconds: 300),
                              builder: (ctx, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: RegisterApplicantForm(callback: (form) async {
                                    asyncResponseHandler<Map<String, dynamic>>(
                                      'Registration Successful.',
                                      context,
                                      nav,
                                      messenger,
                                      User.signUp(form),
                                      (object) {
                                        ref
                                            .watch(landingPagesProvider.notifier)
                                            .setPage(LandingPages.login);
                                      },
                                    );
                                  }),
                                );
                              },
                            )
                          : TweenAnimationBuilder(
                              tween: Tween<double>(begin: !going ? 0 : 1, end: !going ? 1 : 0),
                              duration: const Duration(milliseconds: 300),
                              builder: (ctx, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: RegisterCompanyForm(callback: (form) {
                                    asyncResponseHandler<Map<String, dynamic>>(
                                      'Registration Successful.',
                                      context,
                                      nav,
                                      messenger,
                                      Company.signUp(form),
                                      (object) {
                                        ref
                                            .watch(landingPagesProvider.notifier)
                                            .setPage(LandingPages.login);
                                      },
                                    );
                                  }),
                                );
                              },
                            ),
                    ],
                  ),
                  Footer(box: widget.box),
                ],
              ),
            ),
          ],
        ),
        const HeadBanner(title: ''),
      ],
    );
  }
}
