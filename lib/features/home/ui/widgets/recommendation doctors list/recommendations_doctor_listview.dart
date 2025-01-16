import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_listview_item.dart';
import 'package:flutter/material.dart';

class RecommendationsDoctorListView extends StatelessWidget {
  const RecommendationsDoctorListView({super.key, required this.doctorsModel});
  final List? doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsModel?.length,
        itemBuilder: (context, index) => RecommendationDoctorsListviewItem(
            doctorModel: doctorsModel?[index]),
      ),
    );
    
  }
}
