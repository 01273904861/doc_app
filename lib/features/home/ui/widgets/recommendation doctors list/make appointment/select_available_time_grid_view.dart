import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/seven_days_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/hour_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAvailbaleTimeGridview extends StatefulWidget {
  const SelectAvailbaleTimeGridview({
    super.key,
    required this.day,
    required this.docotrModel,
  });
  final DoctorModel docotrModel;
  final Day day;

  @override
  State<SelectAvailbaleTimeGridview> createState() =>
      _SelectAvailbaleTimeGridviewState();
}

class _SelectAvailbaleTimeGridviewState
    extends State<SelectAvailbaleTimeGridview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> hours = widget.day.hours;
    // If no hours are available, show a placeholder message
    if (hours.isEmpty) {
      return Center(
        child: Text(
          'No available hours for this day.',
          style: AppTextstyles.font16WhiteMeduim
              .copyWith(color: AppColors.mainBlue),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GridView.builder(
        itemCount: hours.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 157 / 49,
        ),
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = i;
                });
              },
              child: HourWidget(
                hour: hours[i],
                isSelected: currentIndex == i,
              )); // Pass the hour directly
        },
      ),
    );
  }
}
