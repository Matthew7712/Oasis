import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/ui/main_screen.dart';
import 'package:oasis/views/ui/preloader/preloader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/appcolors.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      print("Login page");
      Get.offAll(()=>const PreloaderScreen());
    } else{
      Get.offAll(()=>const MainScreen());
    }
  }

  static Future<User?> loginWithGoogle() async{
    final googleAccount = await GoogleSignIn().signIn();
    final googleAuth = await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }


  void register(String email, String password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      e.printError();
      Get.snackbar("About user", "User message",
      backgroundColor: AppColors.redColor,
      snackPosition: SnackPosition.BOTTOM,
        titleText: DefaultText(text: "Account creation failed", color: AppColors.white, fontSize: Dimensions.font24, fontWeight: FontWeight.w400),
        messageText: DefaultText(text: e.toString(), color: AppColors.white, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
      );
    }
  }
  void login(String email, String password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      e.printError();
      Get.snackbar("About login", "Login message",
          backgroundColor: AppColors.redColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: DefaultText(text: "Account login failed", color: AppColors.white, fontSize: Dimensions.font24, fontWeight: FontWeight.w400),
          messageText: DefaultText(text: e.toString(), color: AppColors.white, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
      );
    }
  }
  void logOut() async {
    await auth.signOut();
  }
}