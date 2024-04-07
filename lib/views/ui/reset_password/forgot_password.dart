import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/forgot_plate/forgot_plate.dart';
import 'package:oasis/views/ui/reset_password/reset_password_with_email.dart';
import 'package:oasis/views/ui/reset_password/reset_password_with_phone.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/default_text.dart';
import '../../shared/title_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String selectedOption = "";// Состояние для отслеживания выбранного пункта
  bool activeBorder = false;
  bool activeBorder2 = false;

  void navigateToVerificationCodeEmail() {
    setState(() {
      if (selectedOption == "Email") {
        // Открывать ResetPasswordWithEmail, если выбран пункт "Email"
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const ResetPasswordWithEmail(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      } else if (selectedOption == "Phone Number") {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const ResetPasswordWithPhone(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
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
                  TitleText(title: "Forgot Password", color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
                  SizedBox(height: Dimensions.height10 - 2,),
                  DefaultText(text: "Select which contact details should we use to reset your password", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: Dimensions.height30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedOption != "Email" ? selectedOption = "Email" : selectedOption = "";
                          if(!activeBorder){
                            activeBorder = true;
                            activeBorder2 = false;
                          } else{
                            activeBorder = false;
                          }
                        });
                      },
                      child: ForgotPlate(title: "Email", subtitle: "Send to your email", iconData: Icons.email, activePlate: activeBorder,)
                  ),
                  SizedBox(width: Dimensions.width20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedOption != "Phone Number" ? selectedOption = "Phone Number" : selectedOption = "";
                        if(!activeBorder2){
                          activeBorder2 = true;
                          activeBorder = false;
                        } else{
                          activeBorder2 = false;
                        }
                      });
                    },
                      child: ForgotPlate(title: "Phone Number", subtitle: "Send to your phone", iconData: Icons.phone, activePlate: activeBorder2,)
                  )
                ],
              ),
              SizedBox(height: Dimensions.height50,),
              Button(text: "Continue", event: navigateToVerificationCodeEmail)
            ],
          ),
        ),
      ),
    );
  }
}

