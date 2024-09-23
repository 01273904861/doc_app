import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: 300.w,
      color:Colors.blue,
      child: const Text('log in screen')),);
  }
}