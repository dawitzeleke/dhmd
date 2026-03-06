import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/appointments_controller.dart';

class AppointmentsView extends GetView<AppointmentsController> {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Text(
            'Appointments',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
      ),
    );
  }
}
