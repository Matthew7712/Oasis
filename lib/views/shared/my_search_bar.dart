import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
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
  List<dynamic> searchResult = [];
  dynamic data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String jsonString = await File('assets/json/country.json').readAsString();
    setState(() {
      data = jsonDecode(jsonString);
    });
  }

  List<dynamic> searchByKey(String key, dynamic data) {
    List<dynamic> results = [];

    void traverse(dynamic item) {
      if (item is Map) {
        item.forEach((k, v) {
          if (k.toString().toLowerCase().contains(key.toLowerCase())) {
            results.add(v);
          }
          traverse(v);
        });
      } else if (item is List) {
        item.forEach((element) {
          traverse(element);
        });
      }
    }

    traverse(data);

    return results;
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return TextField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      textAlign: TextAlign.start,
      maxLines: 1,
      onChanged: (value){
        setState(() {
          searchResult = searchByKey(value, data);
        });
      },
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
        fillColor: Color(0xFFFAFAFA),
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
