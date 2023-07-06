import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  AppText({
    Key? key,
    required this.label,
    required this.hint,
    this.password = false,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: password,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: const TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
