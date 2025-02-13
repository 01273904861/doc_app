import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_constants.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/custom_text_field.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_header.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/summary_widget.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class ConfirmationWidget extends StatefulWidget {
  const ConfirmationWidget({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {
  final Box _box = Hive.box(AppConstants.paymentBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            verticalSpace(20),
            const CustomCheckWdget(),
            verticalSpace(20),
            Text('Booking Confirmed', style: AppTextstyles.font18BlackRegular),
            verticalSpace(40),
            const CustomHeader(header: 'Booking information'),
            verticalSpace(20),
            DateAndTime(
              box: _box,
            ),
            verticalSpace(30),
            const CustomHeader(header: 'Doctor information'),
            verticalSpace(30),
            RecommendationDoctorsListviewItem(doctorModel: widget.doctorModel),
            const Spacer(),
            AppButton(
              title: 'Done',
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const BookingConfirmedBottomSheet();
                    });
              },
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmedBottomSheet extends StatefulWidget {
  const BookingConfirmedBottomSheet({
    super.key,
  });

  @override
  State<BookingConfirmedBottomSheet> createState() =>
      _BookingConfirmedBottomSheetState();
}

class _BookingConfirmedBottomSheetState
    extends State<BookingConfirmedBottomSheet> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) => Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 375.h,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
            ,
            children: [
            
              Text(
                'Give rate',
                style: AppTextstyles.font18BlackSemiBold,
              ),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentIndex == i) {
                            currentIndex--;
                          } else {
                            currentIndex = i;
                          }
                        });
                      },
                      child: Icon(
                        Icons.star,
                        size: 40.sp,
                        color: currentIndex >= i
                            ? const Color.fromARGB(255, 223, 205, 43)
                            : AppColors.lighterGrey,
                      ),
                    ),
                ],
              ),
             
              Text(
                'Share your feedback about the doctor',
                style: AppTextstyles.font12BlackRegular,
              ),
              verticalSpace(15),
              const CustomTextField(
                enabledBorderColor: Color(0xffF2F4F7),
                hintText: 'your review',
                hintTextStyle: TextStyle(color: Color(0xff9E9E9E)),
                maxLines: 2,
                backgroundColor: Color(0xffF2F4F7),
              ),
            
              AppButton(
                  title: 'ok',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
       
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckWdget extends StatelessWidget {
  const CustomCheckWdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 64.h,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(32.sp)),
      child: Icon(
        Icons.check,
        size: 45.sp,
        color: Colors.white,
      ),
    );
  }
}
