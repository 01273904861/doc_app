import 'dart:async';

import 'package:appoment_app/core/helper/app_functions.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendations_doctor_listview.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorsScreen extends StatefulWidget {
  const RecommendationDoctorsScreen({super.key, required this.allDoctors});
  final List<DoctorModel> allDoctors;

  @override
  State<RecommendationDoctorsScreen> createState() =>
      _RecommendationDoctorsScreenState();
}

class _RecommendationDoctorsScreenState
    extends State<RecommendationDoctorsScreen> {
  List<DoctorModel?> searchedDoctors = <DoctorModel?>[];
  bool isSearching = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel(); // Cancel any active debounce timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Recommendation Doctors', style: AppTextstyles.font18BlackSemiBold,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: <Widget>[
            SearchSection(
              onChanged: (String input) {
                // Debounce search 
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                input = input.trim();
                setState(() {
                  isSearching = input.isNotEmpty; //goooooood idea
                  searchedDoctors = AppFunctions.searchDoctors(
                        doctors: widget.allDoctors,
                        doctorName: input,
                      ) ??
                      <DoctorModel?>[];
                });
                });
              },
      
            ),
            if (isSearching) //search ? searched doctors : all doctors
              searchedDoctors.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          'No doctors found',
                          style: AppTextstyles.font18BlackRegular,
                        ),
                      ),
                    )
                  : RecommendationsDoctorListView(doctorsModel: searchedDoctors)
            else
              RecommendationsDoctorListView(
                doctorsModel: widget.allDoctors,
              ),
          ],
        ),
      ),
    );
  }
}


