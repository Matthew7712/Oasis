import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/dots/dots.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/preloader/preloader_screen_third.dart';
import 'package:oasis/views/ui/sign/sign_in.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/preloader_button.dart';

class PreloaderScreenSecond extends StatefulWidget {
  const PreloaderScreenSecond({super.key});

  @override
  State<PreloaderScreenSecond> createState() => _PreloaderScreenSecondState();
}

class _PreloaderScreenSecondState extends State<PreloaderScreenSecond> {
  void navigate(){
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const PreloaderScreenThird(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child,);
        },
      ),
    );
  }
  void skip(){
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const SignIn(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/onboarding/onboardingtwo.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.vertical60, horizontal: Dimensions.horizontal24),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: skip,
                  child: const DefaultText(text: "Skip", color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w400)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleText(title: "Visit tourist attractions", color: AppColors.white, fontSize: width < 325 ? Dimensions.font32 : width < 375 ? Dimensions.font42 : Dimensions.font48, fontWeight: FontWeight.w700),
                DefaultText(text: "find thousands of tourist destinations ready for you to visit find thousands of tourist destinations ready for you ", color: AppColors.white, fontSize: width < 325 ? Dimensions.font16 : width < 375 ? Dimensions.font18 : Dimensions.font20, fontWeight: FontWeight.w400),
                SizedBox(height: Dimensions.height40,),
                const Dots(activeDot: 1,),
                SizedBox(height: Dimensions.height50,),
                PreloaderButton(text: "Next", event: navigate),
                SizedBox(height: Dimensions.height10,)
              ],
            ),
          )
        ]
      ),
    );
  }
}
