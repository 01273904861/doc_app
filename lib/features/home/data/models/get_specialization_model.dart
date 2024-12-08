import 'package:json_annotation/json_annotation.dart';
part 'get_specialization_model.g.dart';

@JsonSerializable()
class GetAllSpecializationsModel {
  String? message;
  List<SpecializationData>? data;

  GetAllSpecializationsModel({this.message, this.data});
  factory GetAllSpecializationsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllSpecializationsModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  String? name;
  int? id;
  List<DoctorModel>? doctors;

  SpecializationData({this.name, this.id, this.doctors});

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>_$SpecializationDataFromJson(json);
}

@JsonSerializable()
class DoctorModel {
  int? id;
  String? name;
  String? phone;
  String? photo;
  String? address;
  String? description;

  String? degree;
  @JsonKey(name: 'appoint_price')
  int? appointPrice;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;

  CityModel? city;

  DoctorModel(
      this.id,
      this.name,
      this.phone,
      this.photo,
      this.address,
      this.description,
      this.degree,
      this.appointPrice,
      this.startTime,
      this.endTime,
      this.city);
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  int? id;
  String? name;

  CityModel({this.id, this.name});
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
