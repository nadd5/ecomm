import 'auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 65, 130),
      body:
         Image.asset('assets/splash.png',
         fit:BoxFit.cover,
         width:double.infinity,
         height: double.infinity
         )

    );
  }
}


