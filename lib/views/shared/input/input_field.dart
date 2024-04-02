import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class InputField extends StatefulWidget {
  final String hintText;
  const InputField({super.key, required this.hintText});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
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
