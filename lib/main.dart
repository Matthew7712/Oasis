import 'package:oasis/controllers/favorite_provider.dart';
import 'package:oasis/controllers/history_provider.dart';
import 'package:oasis/views/ui/profile/notifications.screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:oasis/controllers/auth_controller.dart';
import 'package:oasis/controllers/notification_controller.dart';
import 'package:oasis/views/ui/preloader/preloader_screen.dart';
import 'package:oasis/views/ui/sign/sign_up.dart';
import 'controllers/active_ticket_provider.dart';
import 'controllers/bottom_provider.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('fav_box');
  await Hive.openBox('history_box');
  await Hive.openBox('ticket_box');
  await Firebase.initializeApp(
    name: 'com.example.oasis',
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  await NotificationController().initNotification();
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationBarNotifier()),
        ChangeNotifierProvider(create: (context) => FavoriteNotifier()),
        ChangeNotifierProvider(create: (context) => HistoryNotifier()),
        ChangeNotifierProvider(create: (context) => TicketNotifier()),
      ],
      child: const MyApp(),
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oasis',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const PreloaderScreen(),
        navigatorKey: navigatorKey,
        routes: {
          '/signup' : (context) => const SignUp(),
          NotificationScreen.route: (context) => const NotificationScreen(),
        }
    );
  }
}
