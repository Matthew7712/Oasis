import 'package:flutter/material.dart';
import 'package:oasis/views/shared/greeting_modal_window.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: GreetingModalWindow()
            ),
          ],
        )
    );
  }
}
