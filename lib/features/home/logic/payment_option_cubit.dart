import 'package:appoment_app/core/theming/app_constants.dart';
import 'package:appoment_app/features/home/data/models/payment_option_model.dart';
import 'package:appoment_app/features/home/logic/payment_option_states.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

class PaymentOptionCubit extends Cubit<PaymentOptionStates> {
  final Box _paymentBox = Hive.box(AppConstants.paymentBox);

  PaymentOptionCubit() : super(PaymentOptionInitial());

  void selectPaymentMethod(PaymentOptionModel paymentOptionModel) {
    _paymentBox.put(AppConstants.paymentMethod, paymentOptionModel);
    _paymentBox.put(AppConstants.paymentCard, null);
    emit(SelectedMethodState(paymentOptionModel: paymentOptionModel));
  }

  void selectCard(CreditCardModel creditCardModel) {
    _paymentBox.put(AppConstants.paymentCard, creditCardModel);
    emit(SelectedCardState(creditCardModel: creditCardModel));
  }

  void loadData() {
    final CreditCardModel? card = _paymentBox.get(AppConstants.paymentCard);
    final PaymentOptionModel? paymentOptionModel =
        _paymentBox.get(AppConstants.paymentMethod);

    if (card != null) {
      emit(SelectedCardState(creditCardModel: card));
    } else if (paymentOptionModel != null) {
      emit(SelectedMethodState(paymentOptionModel: paymentOptionModel));
    } else {
      emit(NoSelectedData());
    }
  }
}
