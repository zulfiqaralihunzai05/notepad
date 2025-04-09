import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notepad_app/auth/screen/view/lottie_screen.dart';
import 'package:notepad_app/dashboard/screen/screen_one.dart';
import 'package:notepad_app/dashboard/screen/screen_two.dart';
import 'package:notepad_app/onboarding/screen/splash_screen.dart';

import 'auth/screen/view/userscreen.dart';
import 'dashboard/screen/home_screen.dart';
import 'firebase_options.dart';
import 'auth/screen/view/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LottieScreen(),
    );
  }
}

///Hello Students //

