import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsHeaderAndSeeAll extends StatelessWidget {
  const SectionsHeaderAndSeeAll({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextstyles.font18BlackRegular,
          ),
          Text('See All', style: AppTextstyles.font12BlueRegular)
        ],
      ),
    );
  }
}
