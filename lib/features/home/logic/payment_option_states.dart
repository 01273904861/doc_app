import 'package:appoment_app/features/home/data/models/payment_option_model.dart';

abstract class PaymentOptionStates {}
class PaymentOptionInitial extends PaymentOptionStates {}
class SelectedMethodState extends PaymentOptionStates{

  final PaymentOptionModel paymentOptionModel;

  SelectedMethodState({required this.paymentOptionModel});
}
class SelectedCardState extends PaymentOptionStates{
  final CreditCardModel creditCardModel;

  SelectedCardState({required this.creditCardModel});
}

class NoSelectedData extends PaymentOptionStates {
  
}