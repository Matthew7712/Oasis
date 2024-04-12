import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../text/title_text.dart';

class MapSlider extends StatefulWidget {
  final String title;
  final List<AssetImage> assetImage;
  const MapSlider({super.key, required this.title ,required this.assetImage});

  @override
  State<MapSlider> createState() => _MapSliderState();
}

class _MapSliderState extends State<MapSlider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int selectedIndex = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: widget.title, color: AppColors.titleColor, fontSize: width < 325 ? Dimensions.font16 : width < 375 ? Dimensions.font20 : Dimensions.font24, fontWeight: FontWeight.w600),
        const SizedBox(height: 5,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < widget.assetImage.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: width * 0.66,
                      height: width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                          image: DecorationImage(
                              image: widget.assetImage[i],
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

