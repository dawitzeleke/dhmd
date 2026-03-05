import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widgets/booking_appointment_type_tile.dart';
import 'widgets/booking_top_bar.dart';

class BookingAppointmentTypeView extends GetView<BookingController> {
  const BookingAppointmentTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 760),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 26),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BookingTopBar(),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Preferable Appointment Type',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1D2230),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Obx(
                    () => Column(
                      children: [
                        BookingAppointmentTypeTile(
                          icon: Icons.groups_rounded,
                          title: 'Direct Chat',
                          value: controller.prefersDirectChat.value,
                          onChanged: controller.setPrefersDirectChat,
                        ),
                        BookingAppointmentTypeTile(
                          icon: Icons.videocam,
                          title: 'Video Call',
                          value: controller.prefersVideoCall.value,
                          onChanged: controller.setPrefersVideoCall,
                        ),
                        BookingAppointmentTypeTile(
                          icon: Icons.phone,
                          title: 'Phone',
                          value: controller.prefersPhone.value,
                          onChanged: controller.setPrefersPhone,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 430),
                Center(
                  child: AppButton(
                    text: 'Next',
                    onPressed: controller.onAppointmentTypeNextPressed,
                    textSize: 13,
                    width: 123,
                    height: 35,
                    borderRadius: 8,
                    textColor: Colors.white,
                    backgroundColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
