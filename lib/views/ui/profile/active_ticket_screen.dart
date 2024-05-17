import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../controllers/active_ticket_provider.dart';
import '../../../services/appcolors.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ActiveTicketScreen extends StatefulWidget {
  final String dateTime;
  const ActiveTicketScreen({super.key, required this.dateTime});

  @override
  State<ActiveTicketScreen> createState() => _ActiveTicketScreenState();
}

class _ActiveTicketScreenState extends State<ActiveTicketScreen> {
  final _ticketBox = Hive.box('ticket_box');
  int counter = 1;
  void doNothing(int key) async{
    await _ticketBox.delete(key);
  }
  Timer? _timer;
  void startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  void incrementFunction(Map<String, dynamic> country){
    setState(() {
      country['counter']++;
    });
    print(country['counter']);
  }

  void decrementFunction(Map<String, dynamic> country){
    setState(() {
      if (country['counter'] > 1) {
        country['counter']--;
      }
    });
    print(country['counter']);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var ticketNotifier = Provider.of<TicketNotifier>(context);
    ticketNotifier.getAllData();
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: TitleText(title: "Active Ticket", color: AppColors.titleColor, fontSize: width < 325
                ? Dimensions.font18
                : width < 375
                ? Dimensions.font20
                : Dimensions.font24, fontWeight: FontWeight.w600
            ),
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            )
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: Dimensions.height10),
          child: SizedBox(
            width: width - 16,
            height: height * 0.85,
            child: ListView.builder(
                itemCount: ticketNotifier.tick.length,
                padding: EdgeInsets.only(top: Dimensions.height20),
                itemBuilder: (context, index){
                  final ticket = ticketNotifier.tick[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: ticket["dateTime"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                      Padding(
                        padding: EdgeInsets.only(top: Dimensions.height5, bottom: Dimensions.height20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context){
                                    setState(() {
                                      ticketNotifier.histories.removeWhere((element) => element == ticket["id"]);
                                      // delete(favoritesNotifier.favorites, "id");
                                      doNothing(ticket["key"]);
                                    });
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                                height: 64,
                                                width: 64,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const CircularProgressIndicator(),
                                                  ],
                                                )
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    startTimer();
                                  },
                                  backgroundColor: AppColors.mainColor,
                                  foregroundColor: Colors.white,
                                  icon: Icons.heart_broken,
                                  label: "Delete",
                                ),
                              ],
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.16,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 5,
                                        blurRadius: 0.3,
                                        offset: const Offset(0,1)
                                    )
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          height: height * 0.14,
                                          width: width * 0.43,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                                              image: DecorationImage(
                                                  image: AssetImage(ticket['imageUrl']),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 10,),
                                        child: SizedBox(
                                          width: width * 0.35,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TitleText(title: ticket["address"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w600),
                                              const SizedBox(height: 5,),
                                              DefaultText(text: ticket["name"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400),
                                              Row(
                                                children: [
                                                  Icon(Icons.sunny, color: AppColors.yellowIcon,),
                                                  SizedBox(width: Dimensions.width5,),
                                                  Icon(Icons.location_city,color: AppColors.mainColor,),
                                                  SizedBox(width: Dimensions.width5,),
                                                  Icon(Icons.beach_access, color: AppColors.redColor,)
                                                ],
                                              ),
                                              SizedBox(height: Dimensions.height5,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => incrementFunction(ticket),
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            color: counter <= 1 ? Colors.grey.shade300 : AppColors.mainColor,
                                                            border: Border.all(
                                                              width: 2,
                                                              color: counter <= 1 ? Colors.grey : AppColors.mainColor,
                                                            ),
                                                            borderRadius: BorderRadius.circular(Dimensions.radius50),
                                                          ),
                                                          child: Icon(Icons.remove, size: 16, color: counter <= 1 ? AppColors.iconColor : AppColors.iconBackgroundColor),
                                                        ),
                                                      ),
                                                      SizedBox(width: Dimensions.width10,),
                                                      DefaultText(text: counter.toString(), fontSize: Dimensions.font14, color: AppColors.titleColor, fontWeight: FontWeight.w500,),
                                                      SizedBox(width: Dimensions.width10,),
                                                      GestureDetector(
                                                        onTap: () => decrementFunction(ticket),
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            color: AppColors.mainColor,
                                                            border: Border.all(
                                                              width: 2,
                                                              color: AppColors.mainColor,
                                                            ),
                                                            borderRadius: BorderRadius.circular(Dimensions.radius30),
                                                          ),
                                                          child: Icon(Icons.add, size: 16, color: AppColors.white),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: Dimensions.width5,),
                                                  DefaultText(text: "\$", color: AppColors.titleColor, fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                                                  DefaultText(text: (int.parse(ticket["cost"]) * counter).toString() ?? '', color: AppColors.titleColor, fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        )
    );
  }
}
