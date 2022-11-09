import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../custom_form_field.dart';
import '../Utils/ReferenceVariable.dart';
import '../widgets/custom_form_field.dart';
import '../Utils/ReferenceVariable.dart';

// Define a custom Form widget.
class AppliRegForm extends StatefulWidget {
  // const AppliRegForm({super.key});
  // ignore: prefer_typing_uninitialized_variables
  final toggleView;
  const AppliRegForm({super.key, this.toggleView});

  @override
  // ignore: library_private_types_in_public_api
  _AppliRegFormState createState() => _AppliRegFormState();
}

// Define a corresponding State class. This class holds data related to the form.
class _AppliRegFormState extends State<AppliRegForm> {
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
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SafeArea(
        child: SingleChildScrollView(
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
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 222, 74, 248),
                ),
                
                child: const Text('Register', style: TextStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
