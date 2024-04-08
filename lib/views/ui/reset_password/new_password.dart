import 'package:flutter/material.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/input/input_field_with_icon.dart';
import 'package:oasis/views/ui/greeting.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/text/default_text.dart';
import '../../shared/text/title_text.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
          child: Column(
            children: [
              SizedBox(height: Dimensions.height20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: "New Password", color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
                  SizedBox(height: Dimensions.height10 - 2,),
                  DefaultText(text: "Create your new password, so you can login to your account.", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: Dimensions.height30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: "New password", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                  SizedBox(height: Dimensions.height10 - 2,),
                  InputFieldWithIcon(hintText: "New password", prefixOrSuffix: false, iconData: const Icon(Icons.password), controller: passwordController)
                ],
              ),
              SizedBox(height: Dimensions.height15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: "Confirm new password", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                  SizedBox(height: Dimensions.height10 - 2,),
                  InputFieldWithIcon(hintText: "Confirm your new password", prefixOrSuffix: false, iconData: const Icon(Icons.password), controller: passwordController)
                ],
              ),
              SizedBox(height: Dimensions.height30,),
              Button(text: "Continue", event: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const GreetingScreen(),
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
