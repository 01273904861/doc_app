import 'dart:io';

import 'package:appoment_app/core/di/dependency_injection.dart';
import 'package:appoment_app/core/routings/app_router.dart';
import 'package:appoment_app/features/doc_app.dart';
import 'package:flutter/material.dart';


void main() {
  setUpGetIt();
  HttpOverrides.global = MyHttpOverrides();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}


 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}