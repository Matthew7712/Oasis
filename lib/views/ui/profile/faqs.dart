import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import '../../../services/appcolors.dart';
import '../../shared/modal_window.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title: "How do I cancel my reservation", color: AppColors.titleColor, fontSize: width < 325
                  ? Dimensions.font24
                  : width < 375
                  ? Dimensions.font28
                  : Dimensions.font32, fontWeight: FontWeight.w600
              ),
              SizedBox(height: Dimensions.height30,),
              Divider(
                height: 2,
                thickness: 3,
                color: AppColors.inputBorderColor,
              ),
              BigText(),
              Divider(
                height: 2,
                thickness: 3,
                color: AppColors.inputBorderColor,
              ),
              Questions()
            ],
          ),
        ),
      ),
    );
  }
}

class BigText extends StatelessWidget {
  const BigText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height20,),
        DefaultText(
            text: "You can cancel it by going to the account menu\nThen, go to a Travel Agent and search for the room you have booked, then click the room you booked\nAfter clicking on the room you booked, you will find a Cancel Booking button, press the button and select the Yes button\n"
                "If you press the yes button, you will be redirected to another menu to fill in the reason you canceled your room order. Fill in all the questions asked to completion. And wait for the cancellation confirmation process, you will be notified immediately if the cancellation has been confirmed",
            color: AppColors.titleColor,
            fontSize: width < 325
                ? Dimensions.font12
                : width < 375
                ? Dimensions.font14
                : Dimensions.font16,
            fontWeight: FontWeight.w400
        ),
        InkWell(
          onTap: (){
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceInOut,
                    child: ModalWindow(),
                  );
                }
            );
          },
          child: DefaultText(text: "Contact us", color: AppColors.redColor, fontSize: width < 325
              ? Dimensions.font12
              : width < 375
              ? Dimensions.font14
              : Dimensions.font16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: Dimensions.height20,),
      ],
    );
  }
}


class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimensions.height20,),
        TitleText(title: "Commonly asked questions", color: AppColors.titleColor, fontSize: width < 325
            ? Dimensions.font16
            : width < 375
            ? Dimensions.font18
            : Dimensions.font20, fontWeight: FontWeight.w600),
        SizedBox(height: Dimensions.height10,),
        RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: "How to cancel my reservation?\n" , style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: width < 325
                        ? Dimensions.font12
                        : width < 375
                        ? Dimensions.font14
                        : Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                  )),
                  TextSpan(text: "How to cancel unpaid Room Booking Pesanan?\n" , style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: width < 325
                        ? Dimensions.font12
                        : width < 375
                        ? Dimensions.font14
                        : Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                  )),
                  TextSpan(text: "How to make reservation for my vacation?\n" , style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: width < 325
                        ? Dimensions.font12
                        : width < 375
                        ? Dimensions.font14
                        : Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                  )),
                  TextSpan(text: "How to pay my trip?\n" , style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: width < 325
                        ? Dimensions.font12
                        : width < 375
                        ? Dimensions.font14
                        : Dimensions.font16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                  )),
                ]
            )
        )
      ],
    );
  }
}

