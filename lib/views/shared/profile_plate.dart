import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oasis/services/dimensions.dart';

import '../../services/appcolors.dart';

class ProfilePlate extends StatefulWidget {
  final String title;
  final String text;
  Icon icon;
  ProfilePlate({super.key, required this.title, required this.text, required this.icon});

  @override
  State<ProfilePlate> createState() => _ProfilePlateState();
}

class _ProfilePlateState extends State<ProfilePlate> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width / 2) - 34,
      height: 59,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.inputBorderColor),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            widget.icon,
            SizedBox(width: Dimensions.width15,),
            Expanded(
              child: Container(
                width: width / 3,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        children: [
                          TextSpan(text: widget.title, style: TextStyle(
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: AppColors.titleColor
                          )),
                          TextSpan(
                              text: widget.text,
                              style: TextStyle(
                            fontSize: Dimensions.font12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                            color: AppColors.textColor
                          )),
                        ]
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
