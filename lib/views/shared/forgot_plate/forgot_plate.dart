import 'package:flutter/material.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../text/default_text.dart';
import '../text/title_text.dart';

class ForgotPlate extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final bool activePlate;
  const ForgotPlate({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    this.activePlate = false,
  });

  @override
  State<ForgotPlate> createState() => _ForgotPlateState();
}

class _ForgotPlateState extends State<ForgotPlate> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: (width / 2) - 34,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.white,
          border: Border.all(
              width: 2,
              color: widget.activePlate ? AppColors.mainColor : AppColors.inputBorderColor
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Dimensions.width45,
            height: Dimensions.height45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius50),
              color: widget.activePlate ? AppColors.white : AppColors.mainColor,
            ),
            child: Icon(widget.iconData, color: widget.activePlate ? AppColors.mainColor : AppColors.white,),
          ),
          SizedBox(height: Dimensions.height15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title: widget.title, color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500,),
              SizedBox(height: Dimensions.height15 / 3,),
              DefaultText(text: widget.subtitle, color: AppColors.textColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400,),
            ],
          )
        ],
      ),
    );
  }

}
