import 'package:appoment_app/features/home/widgets/docotor_image_and_some_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationsDoctorListView extends StatelessWidget {
  const RecommendationsDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const DoctorImageAndSomeData(),
      ),
    );
  }
}
