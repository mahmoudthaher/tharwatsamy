import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.obscureText = false});
  final String hintText;
  Function(String)? onChanged;
  // String? Function(String?)? validator;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The Field is Requird';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
