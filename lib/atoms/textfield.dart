import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';

class CTextField extends StatelessWidget {
  const CTextField(
      {Key? key,
      this.notValidText,
      this.hintText,
      this.onSubmit,
      this.controller,
      this.keyboardType})
      : super(key: key);

  final String? notValidText;
  final String? hintText;
  final Function(String)? onSubmit;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: (text) {
        return (text?.trim().isEmpty ?? true)
            ? notValidText ?? "Campo Obligatorio"
            : null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Style.GAP_SM),
        ),
      ),
      onFieldSubmitted: onSubmit,
    );
  }
}
