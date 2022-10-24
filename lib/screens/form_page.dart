// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../custom_form_field.dart';
import '../custom_image_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key,}) : super(key: key);
  // final Function toggleView;
  // const FormPage({ required this.toggleView});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        elevation:0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon:const Icon(Icons.person), 
            label: const Text(''), 
            onPressed: () {  },
          ),
          ElevatedButton.icon(
            icon:const Icon(Icons.menu), 
            label: const Text(''), 
            onPressed: () {  },
          )
        ] 
      ),
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              height: 150.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'images/meeting-1.jpg',
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: const Text(
              'Company Registration',
              style: TextStyle(
                color: Color.fromARGB(209, 43, 37, 131),
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   "Recruitee ",
              //   style: TextStyle(color: Colors.grey),
              // ),
              GestureDetector(
                onTap: () {
                  // widget.toggleView();
                },
                child: const Text(
                  'Recruitee',
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
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
                        }, obsureText: false,
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
                        }, obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Street Address',
                        validator: (val) {
                          if (val == null) return 'Please enter street address';
                        }, obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Town/City',
                        validator: (val) {
                          if (val == null) {
                            return 'Please enter Town or City';
                          }
                        }, obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Country',
                        validator: (val) {
                          if (val == null) return 'Please enter your Country';
                        }, obsureText: false,
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
                        }, obsureText: false
                        ,
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
                        }, obsureText: false,
                      ),
                      CustomFormField(
                        hintText: 'Password',
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Enter valid password';
                          }
                        }, obsureText: true,
                      ),
                      CustomFormField(
                        hintText: 'Confirm Password',
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return 'Password do not match';
                          }
                        }, obsureText: true,
                      ),
                      CustomImageFormField(
                        validator: (val) {
                          if (val == null) return 'Select Logo';
                          return null;
                        },
                        onChanged: (file) {},
                      ),
                      CustomImageFormField(
                        validator: (val) {
                          if (val == null) return 'Select business certificate';
                        },
                        onChanged: (file) {},
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
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
