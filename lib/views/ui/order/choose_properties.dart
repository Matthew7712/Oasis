import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oasis/views/shared/counter.dart';
import 'package:oasis/views/shared/greeting_modal_window.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/ui/order/access_screen.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/button.dart';

class ChooseProperties extends StatelessWidget {
  const ChooseProperties({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/order/Backgroung.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: width - 48,
                    height: height * 0.28,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: Dimensions.horizontal24, top: Dimensions.vertical20, bottom: Dimensions.height15, left: Dimensions.horizontal24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(text: "Number of rooms", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                              Counter()
                            ],
                          ),
                          SizedBox(height: Dimensions.height30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(text: "Adult", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                              Counter()
                            ],
                          ),
                          SizedBox(height: Dimensions.height30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(text: "Children", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                              Counter()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  Positioned(
                    bottom: Dimensions.height15,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: Button(text: "Apply", event: (){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) => const AccessScreen(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(opacity: animation, child: child,);
                            },
                          ),
                        );
                      })
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
