import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/features/home/data/models/payment_option_model.dart';
import 'package:appoment_app/features/home/logic/payment_option_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardList extends StatelessWidget {
  const CreditCardList({
    super.key,
    required this.creditCardModel, required this.cards,
  });

  final CreditCardModel? creditCardModel;
 final List<CreditCardModel> cards;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: cards.map((card) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: GestureDetector(
            onTap: () {
              context
                  .read<PaymentOptionCubit>()
                  .selectCard(card);
            },
            child: creditCardModel == card
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: ListTile(
                      title: Text(
                        card.title,
                        style: const TextStyle(
                            color: Colors.white),
                      ),
                      leading: Image.asset(
                        card.image,
                        height: 60.h,
                        width: 60.w,
                      ),
                    ),
                  )
                : ListTile(
                    title: Text(card.title),
                    leading: Image.asset(
                      card.image,
                      height: 60.h,
                      width: 60.w,
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }
}
