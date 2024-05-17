import 'package:flutter/material.dart';
import 'package:oasis/views/shared/counter.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/ui/order/access_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../controllers/history_provider.dart';
import '../../../models/country_model.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../../services/helper.dart';
import '../../shared/button/button.dart';
import 'package:provider/provider.dart';

class ChooseProperties extends StatefulWidget {
  final String id;
  const ChooseProperties({super.key, required this.id});

  @override
  State<ChooseProperties> createState() => _ChoosePropertiesState();
}

class _ChoosePropertiesState extends State<ChooseProperties> with TickerProviderStateMixin{
  late Future<Country> country;
  final _historyBox = Hive.box('history_box');
  void doNothing(int key) async{
    await _historyBox.delete(key);
  }
  void getCountry(){
    country = Helper().getCountryById(widget.id);
  }
  @override
  void initState() {
    super.initState();
    getCountry();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var historyNotifier = Provider.of<HistoryNotifier>(context);
    historyNotifier.getAllData();
    return FutureBuilder<Country>(
        future: country,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            final countries = snapshot.data;
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: Scaffold(
                body: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/order/Backgroung.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            width: width - 48,
                            height: height * 0.3,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: Dimensions.horizontal24, top: Dimensions.vertical20, bottom: Dimensions.height15, left: Dimensions.horizontal24),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultText(text: "Number of rooms", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                                      Counter()
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultText(text: "Children(0 - 14 y.o.)", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                                      Counter()
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultText(text: "Teenager(15 - 17 y.o.)", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                                      Counter()
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultText(text: "Adult(18+ y.o.)", color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w500),
                                      Counter()
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20,),
                          Positioned(
                              bottom: Dimensions.height15,
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              child: Button(text: "Apply", event: (){
                                historyNotifier.createHistoryBox({
                                  "id" : countries!.id,
                                  "name" : countries.name,
                                  "address" : countries.address,
                                  "region" : countries.region,
                                  "imageUrl" : countries.imageUrl[0],
                                });
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 500),
                                    pageBuilder: (_, __, ___) => const AccessScreen(),
                                    transitionsBuilder: (_, animation, __, child) {
                                      return FadeTransition(opacity: animation, child: child,);
                                    },
                                  ),
                                );
                              })
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            );
          }
        });
  }
}

