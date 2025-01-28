import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class HourWidget extends StatelessWidget {
  const HourWidget({
    super.key,
    required this.hour,
    required this.isSelected,
  });

  final String hour;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainBlue : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          hour, // Display the actual hour
          style: AppTextstyles.font16WhiteMeduim,
        ),
      ),
    );
  }
}
