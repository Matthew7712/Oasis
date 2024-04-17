import 'package:flutter/material.dart';
import 'package:oasis/controllers/auth_controller.dart';
import 'package:oasis/views/shared/bottom_nav/bottom_nav.dart';
import 'package:oasis/views/shared/button/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(text: "Log out", event: (){
          AuthController.instance.logOut();
        }),
      ),
    );
  }
}
