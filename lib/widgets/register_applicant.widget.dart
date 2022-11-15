import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/widgets/button1.widget.dart';
import 'package:frontend_job_recruitment/widgets/custom_text_field.widget.dart';

class RegisterApplicantForm extends StatefulWidget {
  final Function(Map<String, String> form) callback;
  const RegisterApplicantForm({Key? key, required this.callback}) : super(key: key);

  @override
  State<RegisterApplicantForm> createState() => _RegisterApplicantFormState();
}

class _RegisterApplicantFormState extends State<RegisterApplicantForm> {
  Map<String, String> form = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          title: 'Name',
          obscure: false,
          onSaved: (val) {
            if (val != null && val.trim().isNotEmpty) form['name'] = val;
          },
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return 'Name is required';
            } else {
              return null;
            }
          },
        ),
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
        CustomTextField(
          title: 'Confirm Password',
          obscure: true,
          onSaved: (val) {},
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Name is required';
            } else if (!RegExp(
                    r"(?=.*\d)(?=.*[A-Z])(?=.*[a-z])((?=.*[^\w\d\s:])|(?=.*[_]))([^\s])*$")
                .hasMatch(val)) {
              return 'Password does not meet requirements \nPassword must be at least eight characters \nPassword must have one letter \nPassword must have one number \nPassword must have one symbol';
            } else {
              return null;
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Button1(title: 'Register', callback: () {}),
        ),
      ],
    );
  }
}
