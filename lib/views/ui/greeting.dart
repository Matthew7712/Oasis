import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oasis/services/appcolors.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/home/home_screen.dart';
import '../../services/dimensions.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/image/greeting/Group.svg"),
              SizedBox(height: Dimensions.height40),
              TitleText(title: "Congratulation!", color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
              SizedBox(height: Dimensions.height10 - 2,),
              DefaultText(text: "your account is complete, please enjoy the best menu from us.", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400, textAlign: TextAlign.center,),
              SizedBox(height: Dimensions.height50,),
              Button(text: "Get started", event: (){
                //AuthController.instance.logOut();
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
