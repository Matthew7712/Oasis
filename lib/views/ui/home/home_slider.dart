import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/small_button.dart';
import '../../shared/dots/slider_dots.dart';
import '../../shared/text/title_text.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  List<dynamic> imagesPath= [
    ["assets/image/home/slider/1.png", "Cafe Town", "South Africa\n", "Montai Table"],
    ["assets/image/home/slider/2.png", "NEMO Science Museum ", "Netherlands\n", "Amsterdam"],
    ["assets/image/home/slider/3.png", "Gallerie dell’Accademia", "Italy\n", "Venice"]
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CarouselSlider.builder(
            itemCount: imagesPath.length,
            itemBuilder: (context, index, realIndex){
              final urlImage = imagesPath[index][0];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
                height: height * 0.55,
                viewportFraction: 1,
                // reverse: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                onPageChanged: (index, reason) => setState(
                        () => activeIndex = index
                )
            ),
        ),
        buildContent(activeIndex)
      ],
    );
  }
  Widget buildImage(String urlImage, int index) => Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(urlImage),
            fit: BoxFit.cover
        )
    ),
  );
  Widget buildContent(int activeIndex) => Padding(
    padding: EdgeInsets.symmetric(vertical: Dimensions.vertical30, horizontal: Dimensions.horizontal24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: imagesPath[activeIndex][1], color: AppColors.white, fontSize: Dimensions.font32, fontWeight: FontWeight.w700),
        const SizedBox(height: 5,),
        RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: imagesPath[activeIndex][2], style: TextStyle(color: AppColors.white, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)),
                  TextSpan(text: imagesPath[activeIndex][3], style: TextStyle(color: AppColors.white, fontSize: Dimensions.font16, fontWeight: FontWeight.w400))
                ]
            )
        ),
        SizedBox(height: Dimensions.height25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SmallButton(text: "View detail", event: (){
              AuthController.instance.logOut();
            }),
            SliderDots(activeDot: activeIndex.toDouble()),
          ],
        )
      ],
    ),
  );
}

