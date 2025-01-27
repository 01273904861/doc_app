import 'package:appoment_app/core/routings/app_router.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/core/di/dependency_injection.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) =>  HomeCubit(getIt())..emitGetSpecialization(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
          initialRoute:  Routes.loginScreen,
        ),
      ),
    );
  }
}
