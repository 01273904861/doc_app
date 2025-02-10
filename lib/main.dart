import 'dart:io';

import 'package:appoment_app/core/constants/shared_pref_keys.dart';
import 'package:appoment_app/core/di/dependency_injection.dart';
import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/shared_pref_helper.dart';
import 'package:appoment_app/core/routings/app_router.dart';
import 'package:appoment_app/core/theming/app_constants.dart';
import 'package:appoment_app/features/doc_app.dart';
import 'package:appoment_app/features/home/data/models/payment_option_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

bool isLogedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PaymentOptionModelAdapter());
  Hive.registerAdapter(CreditCardModelAdapter());
  await Hive.openBox(AppConstants.paymentBox);

  setUpGetIt();
  HttpOverrides.global = MyHttpOverrides();

  await checkLogedinUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

Future<void> checkLogedinUser() async {
  await SharedPrefHelper.getSecuredData(SharedPrefKeys.userTokenKey)
      .then((token) {
    if (!token.toString().isNullOrEmpty()) isLogedInUser = true;
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
