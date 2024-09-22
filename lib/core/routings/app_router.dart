import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/features/login/login.dart';
import 'package:appoment_app/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) {
          return const OnBoardingScreen();
        });
      //
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) {
          return const LogInScreen();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Text('the page ${settings.name} doesn\'t exist'),
          );
        });
    }
  }
}
