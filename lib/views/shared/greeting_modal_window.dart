import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/home/home_screen.dart';

import '../../services/appcolors.dart';
import '../../services/dimensions.dart';
import 'button/button.dart';

class GreetingModalWindow extends StatelessWidget {
  const GreetingModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical10),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius50)),
                  border: Border.all(width: 2, color: AppColors.mainColor, style: BorderStyle.solid),
                ),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.iconColor, size: Dimensions.iconSize48,),
              ),
              SizedBox(height: Dimensions.height20,),
              TitleText(title: "Вы успешно оформили заказ", color: AppColors.titleColor, fontSize: Dimensions.font18, fontWeight: FontWeight.w600),
              SizedBox(height: Dimensions.height30,),
              Button(text: "Home", event: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(opacity: animation, child: child,);
                    },
                  ),
                );
              },)
            ],
          )
        ],
      ),
    );
  }
}
