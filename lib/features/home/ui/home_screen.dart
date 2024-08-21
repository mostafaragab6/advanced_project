import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctor_blue_container.dart';
import 'widgets/doctor_speciality_list_view.dart';
import 'widgets/doctor_speciality_see_all.dart';
import 'widgets/doctors_list_view.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            28,
          ),
          width: double.infinity,
          child: Column(
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              SizedBox(
                height: 24.h,
              ),
              const DoctorSpecialitySeeAll(),
              SizedBox(
                height: 16.h,
              ),
              const DoctorSpecialityListView(),
              SizedBox(
                height: 8.h,
              ),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
