import 'package:appoment_app/features/home/widgets/app_bar_icon.dart';
import 'package:appoment_app/features/home/widgets/app_bar_title.dart';
import 'package:appoment_app/features/home/widgets/doctors_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [AppBarIcon()],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DoctorsContainer(),
          ],
        ),
      ),
    ));
  }
}
