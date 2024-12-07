
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi omar!',
          style: AppTextstyles.font14GreyRegular
              .copyWith(color: Colors.black, fontSize: 18.sp),
        ),
        Text(
          'How Are you Today?',
          style:
              AppTextstyles.font14GreyRegular.copyWith(fontSize: 11.sp),
        )
      ],
    );
  }
}
