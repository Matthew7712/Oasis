import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oasis/controllers/auth_controller.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/profile_plate.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/profile/faqs.dart';
import 'package:oasis/views/ui/profile/ticket_history_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/appcolors.dart';
import 'active_ticket_screen.dart';
import 'notifications.screen.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  final String name;
  const ProfileScreen({super.key, this.name = "User"});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical60),
        child: ProfilePlates(name: widget.name ?? 'User',),
      )
    );
  }
}

class ProfilePlates extends StatefulWidget {
  final String name;
  const ProfilePlates({super.key, this.name = "User"});

  @override
  State<ProfilePlates> createState() => _ProfilePlatesState();
}

class _ProfilePlatesState extends State<ProfilePlates> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 81,
                  height: 81,
                  child: _selectedImage != null ? Image.file(_selectedImage!) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius50)),
                      image: DecorationImage(image: AssetImage('assets/image/pelican 1.png'))
                    ),
                  ),
                ),
                Positioned(
                  top: 53,
                  left: 55,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: AppColors.blackIcon,
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius50))
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius50)),
                        onTap: pickImageFromGallery,
                        child: Icon(Icons.add, color: AppColors.greyIcon, size: Dimensions.iconSize16,)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: Dimensions.width15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                TitleText(title: widget.name ?? 'User', color: AppColors.titleColor, fontSize: Dimensions.font24, fontWeight: FontWeight.w600),
                DefaultText(text: "Online", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400),
                SizedBox(height: Dimensions.height10,),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.height15,),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height10,),
              InkWell(
                onTap: pickImageFromGallery,
                child: Container(
                  width: width,
                  height: height * 0.18,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.inputBorderColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(height: Dimensions.height15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: pickImageFromGallery,
                    child: Container(
                      width: width / 2 - 31,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.inputBorderColor),
                          borderRadius: BorderRadius.circular(Dimensions.radius20)
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                  InkWell(
                    onTap: pickImageFromGallery,
                    child: Container(
                      width: width / 2 - 31,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.inputBorderColor),
                          borderRadius: BorderRadius.circular(Dimensions.radius20)
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: Dimensions.height15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => const NotificationScreen(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child,);
                      },
                    ),
                  );
                },
                child: ProfilePlate(title: "Notifications\n", text: "Set up notification", icon: Icon(Icons.notifications, color: AppColors.yellowIcon,))
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => ActiveTicketScreen(dateTime: DateFormat.yMMMMEEEEd().format(DateTime.now()),),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child,);
                      },
                    ),
                  );
                },
                child: ProfilePlate(title: "Active ticket\n", text: "Active flights", icon: Icon(Icons.airplane_ticket, color: AppColors.mainColor,))
            ),
          ],
        ),
        SizedBox(height: Dimensions.height15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => TicketHistoryScreen(dateTime: DateFormat.yMMMMEEEEd().format(DateTime.now()),),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child,);
                      },
                    ),
                  );
                },
                child: ProfilePlate(title: "Ticket history\n", text: "Want to see ticket history?", icon: Icon(Icons.history_edu, color: AppColors.brownIcon,))
            ),
            ProfilePlate(title: "Settings\n", text: "Customize your settings", icon: Icon(Icons.settings, color: AppColors.greyIcon,)),
          ],
        ),
        SizedBox(height: Dimensions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                onTap: (){
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => const Faqs(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child,);
                      },
                    ),
                  );
                },
                child: ProfilePlate(title: "FAQs\n", text: "Have any questions?", icon: Icon(Icons.help, color: AppColors.mainColor,))
            ),
            InkWell(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                onTap: (){
                  AuthController.instance.logOut();
                },
                child: ProfilePlate(title: "Log out\n", text: "Want to leave ?", icon: Icon(Icons.logout, color: AppColors.blackIcon,))
            ),
          ],
        ),
      ],
    );
  }
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  Future pickImageFromGallery() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null){
        _selectedImage = File(image.path);
      }
    });
  }
}

