import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oasis/controllers/auth_controller.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/input/input_field.dart';
import 'package:oasis/views/shared/input/input_field_with_icon.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/reset_password/forgot_password.dart';
import 'package:oasis/views/ui/sign/sign_up.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/button_with_icon.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool isOverlayVisible = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 141,
                    height: 167,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/sign/Logo.png")
                        )
                    ),
                  ),
                  SizedBox(height: Dimensions.height30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: "Email", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                      SizedBox(height: Dimensions.height10 - 2,),
                      InputField(hintText: "Your email", controller: emailController,),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: "Password", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                      SizedBox(height: Dimensions.height10 - 2,),
                      InputFieldWithIcon(hintText: "Your password", prefixOrSuffix: false, iconData: const Icon(Icons.password), controller: passwordController, obscureText: true,),
                      SizedBox(height: Dimensions.height15,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => const ForgotPassword(),
                                transitionsBuilder: (_, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: DefaultText(text: "Forgot password ?", color: AppColors.mainColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height25,),
                  Button(text: "Sign in", event: (){
                    AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                  }),
                  SizedBox(height: Dimensions.height25,),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const SignUp(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(opacity: animation, child: child,);
                              },
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Don’t have an account?", style: TextStyle(color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)),
                              TextSpan(text: " Sign Up", style: TextStyle(color: AppColors.mainColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height25,),
                      DefaultText(text: "Or with", color: AppColors.inputTextColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400),
                      SizedBox(height: Dimensions.height25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.bounceInOut,
                                          child: Center(
                                            child: AlertDialog(
                                              title: TitleText(title: "Message", color: AppColors.titleColor, fontSize: Dimensions.font24, fontWeight: FontWeight.w600),
                                              content: DefaultText(text: "Coming soon !", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400),
                                              actions: <Widget>[
                                                Button(text: "Ok", event: (){
                                                  Navigator.of(context).pop();
                                                },)
                                              ],
                                            ),
                                          ),
                                      );
                                    }
                                );
                              },
                              child: ButtonWithIcon(
                                text: "Google",
                                iconData: SvgPicture.asset(
                                  "assets/image/sign/Google.svg",
                                  width: Dimensions.iconSize16,
                                  height: Dimensions.iconSize16,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: Dimensions.width20,),
                            GestureDetector(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.bounceInOut,
                                          child: Center(
                                            child: AlertDialog(
                                              title: TitleText(title: "Message", color: AppColors.titleColor, fontSize: Dimensions.font24, fontWeight: FontWeight.w600),
                                              content: DefaultText(text: "Coming soon !", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400),
                                              actions: <Widget>[
                                                Button(text: "Ok", event: (){
                                                  Navigator.of(context).pop();
                                                },)
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                },
                              child: ButtonWithIcon(text: "Apple", iconData: SvgPicture.asset("assets/image/sign/Apple.svg", height: Dimensions.iconSize16,width: Dimensions.iconSize16,)
                              )
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}

