import 'package:appoment_app/core/di/dependency_injection.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/features/home/views/home_view.dart';
import 'package:appoment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appoment_app/features/login/login_screen.dart';
import 'package:appoment_app/features/onboarding/onboarding.dart';
import 'package:appoment_app/features/sign%20up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LogInScreen(),
          );
        });
          case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const SignUpScreen(),
          );
        });
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) {
          return const HomeView();
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
