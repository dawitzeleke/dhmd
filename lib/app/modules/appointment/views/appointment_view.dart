import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/widgets/home_search_section.dart';
import '../../home/views/widgets/home_top_header.dart';
import '../controllers/appointment_controller.dart';
import 'widgets/appointment_actions_card.dart';
import 'widgets/appointment_detail_card.dart';
import 'widgets/appointment_list_card.dart';

class AppointmentView extends GetView<AppointmentController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => controller.onBackPressed(),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!controller.isDetailOpen &&
                      !controller.isActionsOpen) ...[
                    const HomeTopHeader(),
                    const HomeSearchSection(),
                    const SizedBox(height: 16),
                    ...controller.appointments.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: AppointmentListCard(
                          item: item,
                          onTap: () => controller.openAppointmentDetail(item),
                        ),
                      ),
                    ),
                  ] else if (controller.isDetailOpen) ...[
                    const HomeTopHeader(),
                    const SizedBox(height: 14),
                    const Text(
                      'New Appointment',
                      style: TextStyle(
                        color: Color(0xFF3A3E48),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    AppointmentDetailCard(
                      item: controller.selectedAppointment.value!,
                    ),
                    const SizedBox(height: 220),
                    Center(
                      child: SizedBox(
                        width: 136,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: controller.onDetailNextPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (controller.isActionsOpen) ...[
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: controller.onBackPressed,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Appointments',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 33,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 46),
                    const Text(
                      'New Appointment',
                      style: TextStyle(
                        color: Color(0xFF3A3E48),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppointmentActionsCard(
                      item: controller.selectedAppointment.value!,
                      onReschedule: controller.onReschedulePressed,
                      onCancel: controller.onCancelPressed,
                    ),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
