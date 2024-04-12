import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import '../../services/appcolors.dart';
import '../../services/dimensions.dart';
import 'button/button.dart';

class ModalWindow extends StatelessWidget {
  const ModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: TitleText(title: "Message", color: AppColors.titleColor, fontSize: Dimensions.font24, fontWeight: FontWeight.w600),
        content: DefaultText(text: "Coming soon !", color: AppColors.textColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400),
        actions: <Widget>[
          Button(text: "Ok", event: (){
            Navigator.of(context).pop();
          },)
        ],
      ),
    );
  }
}
