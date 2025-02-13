import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.header,
  });
  final String header;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          header,
          style: AppTextstyles.font16WhiteSemiBold.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
