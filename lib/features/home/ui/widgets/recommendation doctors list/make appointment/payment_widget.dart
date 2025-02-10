import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
// ignore: unused_import
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/payment_option_model.dart';
import 'package:appoment_app/features/home/logic/payment_option_cubit.dart';
import 'package:appoment_app/features/home/logic/payment_option_states.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/credit_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PaymentOptionCubit, PaymentOptionStates>(
        builder: (context, state) {
          String? groupValue = ''; //selected payment method
          CreditCardModel? creditCardModel; //selected card
          if (state is SelectedCardState) {
            groupValue = state.creditCardModel.paymentMethod;
            creditCardModel = state.creditCardModel;
          } else if (state is SelectedMethodState) {
            groupValue = state.paymentOptionModel.paymentMethod;
          }

          return Column(
              children: paymentOptions.map((item) {
            return Column(
              children: [
                RadioListTile(
                    fillColor: WidgetStateProperty.all(AppColors.mainBlue),
                    title: Text(item.paymentMethod,
                        style: AppTextstyles.font12BlackRegular),
                    value: item.paymentMethod,
                    groupValue: groupValue,
                    onChanged: (val) {
                      context
                          .read<PaymentOptionCubit>()
                          .selectPaymentMethod(item);
                    }),
                if (!item.cards.isNullOrEmpty() &&
                    groupValue ==
                        item.paymentMethod) //if payment has cards & selected
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: CreditCardList(
                      creditCardModel: creditCardModel,
                      cards: item.cards,
                    ),
                  )
              ],
            );
          }).toList());
        },
      ),
    );
  }
}
