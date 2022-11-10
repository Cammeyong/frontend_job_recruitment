// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_job_recruitment/widgets/custom_form_field.dart';
// import '../custom_form_field.dart';
// import '../custom_image_form_field.dart';
import '../widgets/custom_image_form_field.dart';
// import 'package:footer/footer.dart';
// import 'package:footer/footer_view.dart';

class CompanyRegPage extends StatefulWidget {
  // const FormPage({Key? key,}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final toggleView;
  const CompanyRegPage({super.key, this.toggleView});

  @override
  _CompanyRegPageState createState() => _CompanyRegPageState();
}

class _CompanyRegPageState extends State<CompanyRegPage> {
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var toggleView;

  @override
  void setState(VoidCallback fn) {
    toggleView = widget.toggleView;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        hintText: 'First Name',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        validator: (val) {
                          if (!val!.isValidName) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Last Name',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        validator: (val) {
                          if (!val!.isValidName) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Street Address',
                        validator: (val) {
                          if (val == null) return 'Please enter street address';
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Town/City',
                        validator: (val) {
                          if (val == null) {
                            return 'Please enter Town or City';
                          }
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Country',
                        validator: (val) {
                          if (val == null) return 'Please enter your Country';
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Phone',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                        validator: (val) {
                          if (!val!.isValidPhone) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                        obsureText: false,
                      ),
                      const CustomFormField(
                        hintText: 'Zip Code/Postal Code', obsureText: false,
                        //  validator: (val) {
                        //   if (val == null) {
                        //     return 'Please enter zip code';
                        //   }
                        //   return null;
                        // },
                      ),
                      CustomFormField(
                        hintText: 'Email',
                        validator: (val) {
                          if (!val!.isValidEmail) return 'Enter valid email';
                          return null;
                        },
                        obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Password',
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                        obsureText: true,
                      ),
                      CustomFormField(
                        hintText: 'Confirm Password',
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Password do not match';
                          }
                          return null;
                        },
                        obsureText: true,
                      ),
                      CustomImageFormField(
                        validator: (val) {
                          if (val == null) return 'Select Logo';
                          return null;
                        },
                        onChanged: (file) {},
                      ),
                      // CustomImageFormField(
                      //   validator: (val) {
                      //     if (val == null) return 'Select business certificate';
                      //   },
                      //   onChanged: (file) {},
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 222, 74, 248), // Background color
                        ),
                        child: const Text('Register', style: TextStyle()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
//  style: ButtonStyle(
//     overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed))
//           return Colors.redAccent; //<-- SEE HERE
//         return null; // Defer to the widget's default.
//       },