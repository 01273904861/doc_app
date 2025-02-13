import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_constants.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/payment_option_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_header.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class SummaryWidget extends StatelessWidget {
  SummaryWidget({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  final Box _box = Hive.box(AppConstants.paymentBox);

  @override
  Widget build(BuildContext context) {
    final CreditCardModel? card = _box.get(AppConstants.paymentCard);
    final PaymentOptionModel paymentOptionModel =
        _box.get(AppConstants.paymentMethod);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeader(header: 'Booking information'),
        verticalSpace(20),
        DateAndTime(box: _box),
        verticalSpace(10),
        const CustomHeader(header: 'Doctor information'),
        verticalSpace(10),
        RecommendationDoctorsListviewItem(doctorModel: doctorModel),
        verticalSpace(20),
        const CustomHeader(header: 'payment information'),
        verticalSpace(10),
        card != null
            ? PaymentInformationWidget(card: card)
            : Text(
                paymentOptionModel.paymentMethod,
                style:
                    AppTextstyles.font12BlackRegular.copyWith(fontSize: 14.sp),
              ),
      ],
    );
  }
}

class PaymentInformationWidget extends StatelessWidget {
  const PaymentInformationWidget({
    super.key,
    required this.card,
  });

  final CreditCardModel? card;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Image.asset(
            card!.image,
            width: 40.w,
            height: 40.h,
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card!.paymentMethod,
                style: AppTextstyles.font12BlackRegular
                    .copyWith(fontSize: 14.sp),
              ),
              verticalSpace(5),
              Text(
                card!.title,
                style: AppTextstyles.font12LigtGreyRegular,
              ),
            ],
          )
        ],
      );
  }
}

class DateAndTime extends StatelessWidget {
  const DateAndTime({
    super.key,
    required Box box,
  }) : _box = box;

  final Box _box;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.assetsImagesCalender,
          width: 40.w,
          height: 40.h,
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date and time',
              style: AppTextstyles.font12BlackRegular
                  .copyWith(fontSize: 14.sp),
            ),
            verticalSpace(5),
            Text(
              _box.get(AppConstants.paymentFullDate) ?? '',
              style: AppTextstyles.font12LigtGreyRegular,
            ),
          ],
        )
      ],
    );
  }
}
