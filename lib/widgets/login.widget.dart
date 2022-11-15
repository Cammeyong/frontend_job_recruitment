import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.model.dart';
import '../providers/landing_pages.provider.dart';
import '../screens/landing.screen.dart';
import '../utils/async_response.handler.dart';
import 'button1.widget.dart';
import 'custom_text_field.widget.dart';
import 'error_snackbar.widget.dart';

class LoginForm extends ConsumerStatefulWidget {
  final LandingPages Function() callback;

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
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                .hasMatch(val.trim())) {
              return 'Invalid email address';
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
                asyncResponseHandler<Map<String, dynamic>>(
                  context,
                  nav,
                  messenger,
                  User.signUp(form).catchError((err) {
                    nav.pop();
                    messenger.showSnackBar(
                      ErrorSnackBar(err: '$err'),
                    );
                  }),
                  () {
                    ref.watch(landingPagesProvider.notifier).setPage(widget.callback());
                  },
                );
              }),
        ),
      ],
    );
  }
}
