import 'package:get/get.dart';

class Dimensions{
  //size of screen
  static double get screenHeight => Get.context!.height;
  static double get screenWidth => Get.context!.width;

  //dynamic height
  static double height10 = screenHeight/(screenHeight / 10);
  static double height15 = screenHeight/(screenHeight / 15);
  static double height20 = screenHeight/(screenHeight / 20);
  static double height25 = screenHeight/(screenHeight / 25);
  static double height30 = screenHeight/(screenHeight / 30);
  static double height40 = screenHeight/(screenHeight / 40);
  static double height45 = screenHeight/(screenHeight / 45);
  static double height50 = screenHeight/(screenHeight / 50);
  static double height60 = screenHeight/(screenHeight / 60);

  //dynamic width
  static double width10 = screenHeight/(screenHeight / 10);
  static double width15 = screenHeight/(screenHeight / 15);
  static double width20 = screenHeight/(screenHeight / 20);
  static double width30 = screenHeight/(screenHeight / 30);
  static double width45 = screenHeight/(screenHeight / 45);

  //button height
  static double height42 = screenHeight/(screenHeight / 42);
  static double height46 = screenHeight/(screenHeight / 46);
  static double buttonHeight50 = screenHeight/(screenHeight / 50);

  //fontsize
  static double font14 = screenHeight/(screenHeight / 14);
  static double font16 = screenHeight/(screenHeight / 16);
  static double font18 = screenHeight/(screenHeight / 18);
  static double font20 = screenHeight/(screenHeight / 20);
  static double font24 = screenHeight/(screenHeight / 24);
  static double font26 = screenHeight/ (screenHeight / 26);
  static double font32 = screenHeight/ (screenHeight / 32);
  static double font42 = screenHeight/ (screenHeight / 42);
  static double font48 = screenHeight/ (screenHeight / 48);

  //radius
  static double radius15 = screenHeight/(screenHeight / 15);
  static double radius20 = screenHeight/(screenHeight / 20);
  static double radius30 = screenHeight/(screenHeight / 30);

  //icon Size
  static double iconSize24 = screenHeight / (screenHeight / 24);
  static double iconSize16 = screenHeight / (screenHeight / 16);

  // //list view size
  // static double listViewImgSize = screenWidth/3.25;
  // static double listViewTextSize = screenWidth/3.9;
  //
  // //Popular Food
  // static double popularFoodImageSize = screenHeight/ 2.62;

  //bottom height
  static double bottomHeightBar = screenHeight / (screenHeight / 54);

  //padding size
  static double vertical10 = screenHeight / (screenHeight / 10);
  static double vertical60 = screenHeight / (screenHeight / 60);
  static double horizontal24 = screenHeight / (screenHeight / 24);
}