// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/pages/appli_reg.page.dart';
import 'package:frontend_job_recruitment/pages/company_reg.page.dart';
import '../Utils/ReferenceVariable.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  // final Function toggleView;
  // const FormPage({ required this.toggleView});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  ReferenceVariable<bool> toggle = ReferenceVariable(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: const Icon(Icons.person),
            label: const Text(''),
            onPressed: () {},
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.menu),
            label: const Text(''),
            onPressed: () {},
          )
        ],
      ),
      // body: toggle.variable ? CompanyRegPage(formKey: _formKey, toggle: toggle) : ApplicantRegPage(formKey: _formKey, toggle: toggle),
    );
  }
}
