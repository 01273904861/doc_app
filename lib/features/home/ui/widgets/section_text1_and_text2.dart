import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsTex1AndTex2 extends StatelessWidget {
  const SectionsTex1AndTex2(
      {super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text1,
            style: AppTextstyles.font18BlackRegular,
          ),
          Text(text2, style: AppTextstyles.font12BlueRegular)
        ],
      ),
    );
  }
}
