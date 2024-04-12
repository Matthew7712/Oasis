import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class NewCountrySlider extends StatefulWidget {
  final AssetImage assetImage;
  final List<AssetImage> images;
  const NewCountrySlider({super.key, required this.assetImage, required this.images});

  @override
  State<NewCountrySlider> createState() => _NewCountrySliderState();
}

class _NewCountrySliderState extends State<NewCountrySlider> with TickerProviderStateMixin{
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: width < 325 ? height * 0.75 : width < 360 ? height * 0.65 : height * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20)),
        image: DecorationImage(
            image: widget.images[selectedIndex],
            fit: BoxFit.cover
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: Dimensions.horizontal24, top: Dimensions.vertical60, right: Dimensions.horizontal24, bottom: Dimensions.height30),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back, size: Dimensions.iconSize24, color: AppColors.iconColor,)
                      ),
                    )
                ),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.save_alt_outlined, size: Dimensions.iconSize24, color: AppColors.iconColor,),
                        )
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_outline, size: Dimensions.iconSize24, color: AppColors.iconColor,),
                        )
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width - 48,
                height: width < 325 ? height * 0.1 : height * 0.08,
                decoration: BoxDecoration(
                    color: AppColors.blurColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < widget.images.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: Container(
                            width: width * 0.13,
                            height: width * 0.13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                                image: DecorationImage(
                                    image: widget.images[i],
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

