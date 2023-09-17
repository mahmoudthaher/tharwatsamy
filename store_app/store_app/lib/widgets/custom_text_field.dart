import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
  });
  final String hintText;
  Function(String)? onChanged;
  TextInputType? keyboardType;
  // String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: hintText,
      ),
    );
  }
}
