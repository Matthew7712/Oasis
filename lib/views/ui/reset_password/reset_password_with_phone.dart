import 'package:flutter/material.dart';
import 'package:oasis/views/shared/input/input_field_with_icon.dart';
import 'package:oasis/views/ui/reset_password/new_password.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/button.dart';
import '../../shared/text/default_text.dart';
import '../../shared/text/title_text.dart';

class ResetPasswordWithPhone extends StatelessWidget {
  const ResetPasswordWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
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
                  TitleText(title: "Reset Password", color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
                  SizedBox(height: Dimensions.height10 - 2,),
                  DefaultText(text: "Please enter your email, we will send verification code to your email.", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: Dimensions.height30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: "Email", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                  SizedBox(height: Dimensions.height10 - 2,),
                  InputFieldWithIcon(hintText: "Your phone", prefixOrSuffix: true, iconData: const Icon(Icons.phone), controller: phoneController)
                ],
              ),
              SizedBox(height: Dimensions.height30,),
              Button(text: "Continue", event: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => const NewPassword(),
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
