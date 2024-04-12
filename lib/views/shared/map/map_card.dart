import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import '../../../services/appcolors.dart';

class MapCard extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  final String text;
  final double activeRating;
  const MapCard({super.key, required this.assetImage, required this.title, required this.text, required this.activeRating});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          left: 24,
          bottom: 10,
          right: 24,
          child: Container(
            width: width,
            height: height * 0.12,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical10),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: width < 375 ? Dimensions.font18 : width < 425 ? Dimensions.font20 : Dimensions.font24, fontFamily: "Montserrat", color: AppColors.titleColor)),
                            TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: width < 375 ? Dimensions.font14 : width < 425 ? Dimensions.font16 : Dimensions.font18, fontFamily: "Lato", color: AppColors.textColor)),
                          ]
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: AppColors.starColor,),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: activeRating.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: width < 375 ? Dimensions.font14 : width < 425 ? Dimensions.font16 : Dimensions.font18, fontFamily: "Montserrat", color: AppColors.textColor)),
                                    TextSpan(text: " / 5", style: TextStyle(fontWeight: FontWeight.w400, fontSize: width < 375 ? Dimensions.font16 : width < 425 ? Dimensions.font18 : Dimensions.font20, fontFamily: "Lato", color: AppColors.titleColor)),
                                  ]
                              )),
                            ],
                          ),
                          SizedBox(height: Dimensions.height10,),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.playButtonBackgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF0066FF).withOpacity(0.2),
                                      blurRadius: 1
                                  )
                                ]
                            ),
                            child: Icon(Icons.play_arrow, color: AppColors.white, size: Dimensions.iconSize24,),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          bottom: height * 0.093,
          child: Container(
            width: width * 0.23,
            height: height * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                image: DecorationImage(
                    image: assetImage,
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
      ],
    );
  }
}
