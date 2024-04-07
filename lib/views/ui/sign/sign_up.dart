import 'package:flutter/material.dart';
import 'package:oasis/controllers/auth_controller.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/button/button.dart';
import '../../shared/default_text.dart';
import '../../shared/input/input_field.dart';
import '../../shared/input/input_field_with_icon.dart';
import '../../shared/title_text.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: "Sign Up", color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
                    SizedBox(height: Dimensions.height10 - 2,),
                    DefaultText(text: "Create account and choose favorite menu", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
                  ],
                ),
                SizedBox(height: Dimensions.height30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: "Name", color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w500),
                    SizedBox(height: Dimensions.height10 - 2,),
                    InputField(hintText: "Your name", controller: nameController,),
                  ],
                ),
                SizedBox(height: Dimensions.height20,),
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
                  ],
                ),
                SizedBox(height: Dimensions.height25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(text: "Register", event: (){
                      AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     transitionDuration: const Duration(milliseconds: 500),
                      //     pageBuilder: (_, __, ___) => const GreetingScreen(),
                      //     transitionsBuilder: (_, animation, __, child) {
                      //       return FadeTransition(opacity: animation, child: child,);
                      //     },
                      //   ),
                      // );
                    }),
                    SizedBox(height: Dimensions.height25,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Have an account?", style: TextStyle(color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)),
                          TextSpan(text: " Sign In", style: TextStyle(color: AppColors.mainColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
