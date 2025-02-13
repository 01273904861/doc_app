import 'package:appoment_app/core/di/dependency_injection.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_cubit.dart';
import 'package:appoment_app/features/home/ui/views/doctor_details_screen.dart';
import 'package:appoment_app/features/home/ui/views/home_screen.dart';
import 'package:appoment_app/features/home/ui/views/make_appointment_details_screen.dart';
import 'package:appoment_app/features/home/ui/views/recommendation_doctors_screen.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/confirmation_widget.dart';
import 'package:appoment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appoment_app/features/login/login_screen.dart';
import 'package:appoment_app/features/onboarding/onboarding_screen.dart';
import 'package:appoment_app/features/sign%20up/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:appoment_app/features/sign%20up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) {
          return const OnBoardingScreen();
        });
      //
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (BuildContext context) => getIt<LogInCubit>(),
            child: const LogInScreen(),
          );
        });
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (BuildContext context) => getIt<signUpCubit>(),
            child: const SignUpScreen(),
          );
        });
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) {
          return const HomeView();
        });
      case Routes.recommendatioDoctorsScreen:
        return MaterialPageRoute(builder: (_) {
          return RecommendationDoctorsScreen(
            allDoctors: settings.arguments! as List<DoctorModel>,
          );
        });
      case Routes.doctorDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          return DoctorDetailsScreen(
            doctorModel: settings.arguments! as DoctorModel,
          );
        });
      case Routes.makeAppointmentDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (BuildContext context) => MakeAppointmentCubit(),
            child: MakeAppointmentDetailsScreen(
              doctorModel: settings.arguments! as DoctorModel,
            ),
          );
        });
      case Routes.confirmedBookScreen:
        return MaterialPageRoute(builder: (_) {
          return  ConfirmationWidget(doctorModel: settings.arguments! as DoctorModel,);
        });
      default:
        return null;
    }
  }
}
