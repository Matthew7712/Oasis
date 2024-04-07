import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const InputField({super.key, required this.hintText, required this.controller, this.obscureText = false});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      textAlign: TextAlign.start,
      controller: widget.controller,
      style: TextStyle(
        fontSize: Dimensions.font16,
        fontWeight: FontWeight.w400,
        color: AppColors.inputTextColor,
      ),
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputActiveBorderColor,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        hintText: widget.hintText, suffixStyle: TextStyle(color: AppColors.inputTextColor, fontWeight: FontWeight.w500, fontSize: Dimensions.font16),
      ),
    );
  }
}
