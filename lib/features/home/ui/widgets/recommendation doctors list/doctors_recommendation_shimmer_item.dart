import 'package:appoment_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationDoctorsShimmerItem extends StatelessWidget {
  const RecommendationDoctorsShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey,
        child: Row(
          children: <Widget>[
            Container(
              height: 100.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.red,
              ),
            ),
            horizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 10,
                  width: 200.w,
                  color: Colors.red,
                ),
                verticalSpace(10),
                Container(
                  height: 10.h,
                  width: 200.w,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
