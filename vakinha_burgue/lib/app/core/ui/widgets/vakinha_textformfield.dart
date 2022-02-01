import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VakinhaTextformfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  const VakinhaTextformfield(
      {Key? key,
      required this.label,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChange,
        cursorColor: context.theme.primaryColor,
        decoration: InputDecoration(
            isDense: true,
            labelText: label,
            errorStyle: const TextStyle(color: Colors.redAccent),
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(color: Colors.grey[400]!)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(color: Colors.grey[400]!)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(color: Colors.grey[400]!)),
            filled: true,
            fillColor: Colors.white));
  }
}
