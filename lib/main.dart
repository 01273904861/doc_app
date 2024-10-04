import 'package:appoment_app/core/di/dependency_injection.dart';
import 'package:appoment_app/core/routings/app_router.dart';
import 'package:appoment_app/features/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
