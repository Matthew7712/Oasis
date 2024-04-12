import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class MySearchBar extends StatefulWidget {
  final String hintText;
  final bool prefixOrSuffix;
  final Icon iconData;
  final TextEditingController controller;
  final bool obscureText;
  const MySearchBar({super.key, required this.hintText, required this.prefixOrSuffix, required this.iconData, required this.controller, this.obscureText = false});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  bool activeIcon = false;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
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
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        prefixIcon: widget.prefixOrSuffix ? widget.iconData : null,
        suffix: widget.prefixOrSuffix ? null : widget.iconData,
        suffixIconColor: activeIcon ? AppColors.mainColor : AppColors.inputBorderColor,
        prefixIconColor: activeIcon ? AppColors.mainColor : AppColors.inputBorderColor,
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputBorderColor,
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
