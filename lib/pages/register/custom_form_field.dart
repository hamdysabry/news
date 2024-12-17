import 'package:flutter/material.dart';

typedef myValadite = String? Function(String?);

class CustomFormField extends StatelessWidget {
  String title;
  TextInputType textInputType;
  bool isSecure;
  myValadite Validator;
  TextEditingController controller;

  CustomFormField({
    required this.title,
    required this.textInputType,
    this.isSecure = false,
    required this.Validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isSecure,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
