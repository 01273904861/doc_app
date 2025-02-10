import 'package:appoment_app/features/home/data/models/seven_days_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeAppointmentCubit extends Cubit<MakeAppointmentStates> {
  MakeAppointmentCubit() : super(MakeAppointmentInitial());

  void emitSelectedDay(Day day) {
    emit(DetermineDaySucess(day: day));
  }
}
