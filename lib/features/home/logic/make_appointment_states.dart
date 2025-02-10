import 'package:appoment_app/features/home/data/models/seven_days_model.dart';

class MakeAppointmentStates {}

class MakeAppointmentInitial extends MakeAppointmentStates {}
class DetermineDaySucess extends MakeAppointmentStates {
  DetermineDaySucess({required this.day});

 final Day day;
  
}
