import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/authentication/Auth/screens/login.dart';
import 'package:ma3ak_app/routes/routes.dart';
import 'package:ma3ak_app/routes/routes_generator.dart';
import 'package:ma3ak_app/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // Check if onboarding is completed
    final bool onboarding = prefs.getBool('onboarding') ?? false;

    // Navigate after a delay of 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (onboarding) {
        // Navigate to the main screen
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Navigate to the onboarding screen
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}

class AkTest extends StatelessWidget {
  const AkTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ma3ak'),
      ),
      body: const Center(
        child: Text('Welcome to our application!'),
      ),
    );
  }
}
