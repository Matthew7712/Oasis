import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oasis/views/ui/preloader/preloader_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Color _backgroundColor = const Color(0xFF528B88);
  int currentHour = DateTime.now().hour;
  double _interpolationValue = 0.0;

  void _updateBackgroundColor(){
    if(currentHour > 6 && currentHour <= 9){
      _backgroundColor = const Color.fromRGBO(9, 162, 161, 1.0);
    } else if(currentHour >= 10 && currentHour <= 14){
      _backgroundColor = const Color.fromRGBO(9, 202, 199, 1);
    } else if(currentHour > 15 && currentHour <= 18){
      _backgroundColor = const Color.fromRGBO(62, 107, 109, 1);
    } else{
      _backgroundColor = const Color.fromRGBO(24, 75, 79, 1);
    }
    print(currentHour);
  }

  @override
  void initState(){
    super.initState();
    _updateBackgroundColor();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const PreloaderScreen())
      );
    });
    // Запустить таймер для плавного перехода цвета
    // Timer.periodic(Duration(milliseconds: 100), (timer) {
    //   // Обновить значение интерполяции
    //   _interpolationValue += 0.01;
    //   // Если значение интерполяции больше или равно 1, сбросить его до 0
    //   if (_interpolationValue >= 1.0) {
    //     _interpolationValue = 0.0;
    //   }
    //   // Вычислить новый цвет с помощью интерполяции
    //   Color newColor = Color.lerp(_backgroundColor, Colors.white, _interpolationValue);
    //   // Обновить цвет фона
    //   setState(() {
    //     _backgroundColor = newColor;
    //   });
    // });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/Logo.png")
                )
            ),
          ),
        ),
      ),
    );
  }
}
