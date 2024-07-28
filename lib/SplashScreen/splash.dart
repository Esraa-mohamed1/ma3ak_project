import 'dart:async';
import 'package:ma3ak_app/onboarding/ui/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:ma3ak_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
  Future<void> _navigateToNextScreen()async{
   final prefs = await SharedPreferences.getInstance();
    final onboarding =prefs.getBool('onboarding')?? false;
    Timer(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context,
        (onboarding? RoutesName.login:RoutesName.onboarding)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Image.asset('assets/images/lightsplash.png'),
        ],
      ),
    );
  }
}

// esraa