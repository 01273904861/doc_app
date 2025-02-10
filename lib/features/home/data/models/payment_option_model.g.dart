// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_option_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentOptionModelAdapter extends TypeAdapter<PaymentOptionModel> {
  @override
  final int typeId = 1;

  @override
  PaymentOptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentOptionModel(
      paymentMethod: fields[0] as String,
      cards: (fields[1] as List).cast<CreditCardModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PaymentOptionModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.paymentMethod)
      ..writeByte(1)
      ..write(obj.cards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentOptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreditCardModelAdapter extends TypeAdapter<CreditCardModel> {
  @override
  final int typeId = 2;

  @override
  CreditCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardModel(
      paymentMethod: fields[0] as String,
      title: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.paymentMethod)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
