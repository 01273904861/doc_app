import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/doctors_recommendation_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class RecommendationDoctorsShimmer extends StatelessWidget {
  ///

  const RecommendationDoctorsShimmer({
    super.key,
  });

  ///

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              verticalSpace(10),
          itemCount: 10,
          itemBuilder: (BuildContext context, int i) {
            return const RecommendationDoctorsShimmerItem();
          },
        ),
      ),
    );
  }
}
