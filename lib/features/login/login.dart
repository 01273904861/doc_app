import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

    return Scaffold(body: Container(
      width: 300.w,
      color:Colors.blue,
      child: const Text('log in screen',style: AppTextstyles.font32BlueW700)),);

  }
}
