import 'package:appoment_app/core/theming/app_images.dart';
import 'package:hive/hive.dart';

part 'payment_option_model.g.dart';
@HiveType(typeId: 1)
class PaymentOptionModel {
  @HiveField(0)
  final String paymentMethod;
  @HiveField(1)
  final List<CreditCardModel> cards;

  PaymentOptionModel({required this.paymentMethod, required this.cards});
}

@HiveType(typeId: 2)
class CreditCardModel {
  @HiveField(0)
  final String paymentMethod;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;

  CreditCardModel(
      {required this.paymentMethod, required this.title, required this.image});
}


  List<PaymentOptionModel> paymentOptions = [
    PaymentOptionModel(paymentMethod: 'Credit Card', cards: [
      CreditCardModel(
          paymentMethod: 'Credit Card',
          image: Assets.assetsImagesMastercard,
          title: 'Master Card'),
      CreditCardModel(
          paymentMethod: 'Credit Card',
          image: Assets.assetsImagesAmericancard,
          title: 'American Express'),
      CreditCardModel(
          paymentMethod: 'Credit Card',
          image: Assets.assetsImagesCapitalone,
          title: 'Capital One'),
      CreditCardModel(
          paymentMethod: 'Credit Card',
          image: Assets.assetsImagesBarclays,
          title: 'Barclays')
    ]),
    PaymentOptionModel(paymentMethod: 'Bank Transfer', cards: []),
    PaymentOptionModel(paymentMethod: 'paypal', cards: []),
  ];