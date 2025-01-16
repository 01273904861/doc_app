import 'package:appoment_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsSpecialityShimmerItem extends StatelessWidget {
  const DoctorsSpecialityShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey[300]!,
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 30,
            ),
            verticalSpace(10),
            Container(
              height: 8.h,
              width: 35.w,
              color: Colors.red,
            )
          ],
        ));
  }
}
