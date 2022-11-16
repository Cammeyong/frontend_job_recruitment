import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/models/company.model.dart';
import 'package:frontend_job_recruitment/providers/master.provider.dart';
import '../models/user.model.dart';
import '../providers/landing_pages.provider.dart';
import '../screens/landing.screen.dart';
import '../utils/async_response.handler.dart';
import 'button1.widget.dart';
import 'custom_text_field.widget.dart';

class LoginForm extends ConsumerStatefulWidget {
  final bool Function() callback;

  const LoginForm({Key? key, required this.callback}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  Map<String, String> form = {};

  @override
  Widget build(BuildContext context) {
    var nav = Navigator.of(context);
    var messenger = ScaffoldMessenger.of(context);
    return Form(
      child: Builder(builder: (context) {
        return Column(
          children: [
            CustomTextField(
              title: 'Email',
              obscure: false,
              onSaved: (val) {
                if (val != null && val.isNotEmpty) form['email'] = val;
              },
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Email is required';
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              title: 'Password',
              obscure: true,
              onSaved: (val) {
                if (val != null && val.isNotEmpty) form['password'] = val;
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Password is required';
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Button1(
                  title: 'Submit',
                  callback: () {
                    Form.of(context)!.save();
                    if (Form.of(context)!.validate()) {
                      asyncResponseHandler<Object>(
                        'Login Successful',
                        context,
                        nav,
                        messenger,
                        (!widget.callback() ? User.signIn(form) : Company.signIn(form)),
                        (object) {
                          if (!widget.callback()) {
                            ref.watch(masterProvider.notifier).setUser(object as User);
                            ref
                                .watch(landingPagesProvider.notifier)
                                .setPage(LandingPages.userProfile);
                          } else {
                            ref.watch(masterProvider.notifier).setCompany(object as Company);
                            ref
                                .watch(landingPagesProvider.notifier)
                                .setPage(LandingPages.companyProfile);
                          }
                        },
                      );
                    }
                  }),
            ),
          ],
        );
      }),
    );
  }
}
