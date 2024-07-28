import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ma3ak_app/features/authentication/Auth/screens/login.dart';
import 'package:ma3ak_app/features/authentication/Auth/screens/login.dart';
import 'package:ma3ak_app/features/authentication/screens/home.dart';
import 'package:ma3ak_app/routes/routes.dart';
import 'package:ma3ak_app/onboarding/ui/onboarding_view.dart';
import 'package:ma3ak_app/SplashScreen/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen()); // Added 'const' with constructor
      case RoutesName.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.sginup:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.resetPassword:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());// Added 'const' with constructor
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route defined for ${settings.name}')),
          ),
        );
    }
  }
}
