import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('log in screen t', style: AppTextstyles.font32BlueW700));
  }
}
