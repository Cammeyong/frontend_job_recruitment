import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool obscure;
  final void Function(String? val) onSaved;
  final String? Function(String? val) validator;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.obscure,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        obscureText: obscure,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: paletteIndigo,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          floatingLabelStyle: TextStyle(
            color: paletteIndigo,
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: title,
        ),
      ),
    );
  }
}
