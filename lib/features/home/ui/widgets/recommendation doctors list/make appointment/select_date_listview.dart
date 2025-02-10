import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/seven_days_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDateListview extends StatefulWidget {
  const SelectDateListview({super.key, required this.sevenDaysOfWeek});
  final SevenDaysOfweek sevenDaysOfWeek;

  @override
  _SelectDateListviewState createState() => _SelectDateListviewState();
}

class _SelectDateListviewState extends State<SelectDateListview> {
  int selectedIndex = 0; // To track the selected day
  @override
  Widget build(BuildContext context) {
    final List<Day> daysList = widget.sevenDaysOfWeek.dayList;


    // Ensure the list is not empty to avoid runtime errors
    if (daysList.isEmpty) {
      return Center(
        child: Text(
          'No available dates.',
          style: AppTextstyles.font16WhiteSemiBold,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          horizontalSpace(20),
      scrollDirection: Axis.horizontal,
      itemCount: daysList.length,
      itemBuilder: (BuildContext context, int i) {
        final bool isSelected = selectedIndex == i;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = i; // Update the selected index
            });

            // Emit the selected day's hours through the Cubit
            BlocProvider.of<MakeAppointmentCubit>(context)
                .emitSelectedDay(daysList[i]);
          },
          child: Container(
            height: isSelected ? 66.h : 62.h,
            width: isSelected ? 56.w : 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: isSelected
                  ? AppColors.mainBlue // Highlight for selected date
                  : AppColors.morelightGrey,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                 daysList[i].name,
                  style: isSelected ?  AppTextstyles.font16WhiteSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: Colors.white,
                  )  : AppTextstyles.font16WhiteSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.lighterGrey,
                  ),
                ),
            
                Text(
                 daysList[i].number,
                  style: isSelected ?  AppTextstyles.font16WhiteSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: Colors.white,
                  )  : AppTextstyles.font16WhiteSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.lighterGrey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
