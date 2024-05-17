import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/ui/order/choose_properties.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../models/country_model.dart';
import '../../../services/appcolors.dart';

class ChooseDate extends StatefulWidget {
  final Future<List<Country>> _country;
  const ChooseDate({super.key, required Future<List<Country>> country}) : _country = country;

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  var _firstDay = DateTime.utc(2010, 10, 16);
  var _lastDay = DateTime.utc(2030, 3, 14);
  var _focusedDay = DateTime.now();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<Country>>(
        future: widget._country,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          } else if(snapshot.hasError){
            return const Text("Error");
          } else{
            final country = snapshot.data;
            return ListView.builder(
                itemCount: country!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final country = snapshot.data![index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/order/Backgroung.png'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: width - 48,
                              height: height * 0.38,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))
                              ),
                              child: TableCalendar(
                                firstDay: _firstDay,
                                lastDay: _lastDay,
                                focusedDay: _focusedDay,
                                rowHeight: Dimensions.height50,
                                availableGestures: AvailableGestures.all,
                                selectedDayPredicate: (day) => isSameDay(day, today),
                                onDaySelected: _onDaySelected,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20,),
                          Button(text: "Apply", event: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => ChooseProperties(id: country.id),
                                transitionsBuilder: (_, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          })
                        ],
                      ),
                    ],
                  );
                }
            );
          }
        },
      ),
    );
  }
}

