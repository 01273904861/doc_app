import 'package:json_annotation/json_annotation.dart';
part 'get_specialization_model.g.dart';
@JsonSerializable()
class GetSpecializationResponseModel {
  final String name;
  final int id;
  final List<DoctorModel> doctors;

  GetSpecializationResponseModel({required this.name, required this.id, required this.doctors});

  factory GetSpecializationResponseModel.fromjson(Map<String , dynamic>json)=>_$GetSpecializationResponseModelFromJson(json);
}
@JsonSerializable()

class DoctorModel {
  final int id;
  final String name;
  final String phone;
  final String photo;
  final String address;
  final String description;
  
  final String degree;
  @JsonKey(name: 'appoint_price')
  final int appointPrice;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;

  final CityModel city;

  DoctorModel({required this.id, required this.name, required this.phone, required this.photo, required this.address, required this.description, required this.degree, required this.appointPrice, required this.startTime, required this.endTime, required this.city});
  factory DoctorModel.fromJson(Map<String , dynamic>json)=>_$DoctorModelFromJson(json);
}
@JsonSerializable()

class CityModel{
final int id ;
final String name;

  CityModel({required this.id, required this.name});
  factory CityModel.fromJson(Map<String , dynamic>json)=>_$CityModelFromJson(json);
}