import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class InputFieldWithIcon extends StatefulWidget {
  final String hintText;
  final bool prefixOrSuffix;
  final Icon iconData;
  final TextEditingController controller;
  final bool obscureText;
  const InputFieldWithIcon({super.key, required this.hintText, required this.prefixOrSuffix, required this.iconData, required this.controller, this.obscureText = false});

  @override
  State<InputFieldWithIcon> createState() => _InputFieldWithIconState();
}

class _InputFieldWithIconState extends State<InputFieldWithIcon> {
  bool activeIcon = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: TextStyle(
        fontSize: Dimensions.font16,
        fontWeight: FontWeight.w400,
        color: AppColors.inputTextColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
        prefixIcon: widget.prefixOrSuffix ? widget.iconData : null,
        suffix: widget.prefixOrSuffix ? null : widget.iconData,
        suffixIconColor: AppColors.inputBorderColor,
        prefixIconColor: activeIcon ? AppColors.mainColor : AppColors.inputBorderColor,
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        hintText: widget.hintText, suffixStyle: TextStyle(color: AppColors.inputTextColor, fontWeight: FontWeight.w500, fontSize: Dimensions.font20),
      ),
      onTap: (){
        setState(() {
          activeIcon = true;
        });
      },
      onEditingComplete: (){
        setState(() {
          activeIcon = false;
        });
      },
    );
  }
}
