import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dhmd/app/routes/app_pages.dart';

class AppointmentEntry {
  final String title;
  final String doctorName;
  final String specialty;
  final String subSpecialty;
  final String experience;
  final String certification;
  final String date;
  final String day;
  final String time;
  final String imagePath;

  const AppointmentEntry({
    required this.title,
    required this.doctorName,
    required this.specialty,
    required this.subSpecialty,
    required this.experience,
    required this.certification,
    required this.date,
    required this.day,
    required this.time,
    required this.imagePath,
  });
}

class AppointmentController extends GetxController {
  final appointments = const <AppointmentEntry>[
    AppointmentEntry(
      title: 'Check your dental health',
      doctorName: 'Dr. Tesfaye Alemayehu',
      specialty: 'Cardiology',
      subSpecialty: 'Interventional Cardiology',
      experience: '10+ Years',
      certification: 'MD, Specialty Certification',
      date: 'Feb 16, 2026',
      day: 'Monday',
      time: '12:00 PM',
      imagePath: 'assets/images/doctor.png',
    ),
  ];

  final selectedAppointment = Rxn<AppointmentEntry>();
  final viewStage = 0.obs; // 0=list, 1=detail, 2=actions, 3=reschedule-reason
  final rescheduleReasonController = TextEditingController();

  bool get isDetailOpen => viewStage.value == 1;
  bool get isActionsOpen => viewStage.value == 2;
  bool get isRescheduleReasonOpen => viewStage.value == 3;

  void openAppointmentDetail(AppointmentEntry item) {
    selectedAppointment.value = item;
    viewStage.value = 1;
  }

  void closeAppointmentDetail() {
    viewStage.value = 0;
    selectedAppointment.value = null;
    rescheduleReasonController.clear();
  }

  void onDetailNextPressed() {
    viewStage.value = 2;
  }

  void onReschedulePressed() {
    viewStage.value = 3;
  }

  void onCancelPressed() {}

  void onConfirmCancelPressed() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    closeAppointmentDetail();
  }

  void onRescheduleReasonNextPressed() {
    Get.toNamed(Routes.BOOKING_SCHEDULE);
  }

  bool onBackPressed() {
    if (isRescheduleReasonOpen) {
      viewStage.value = 2;
      return false;
    }
    if (isActionsOpen) {
      viewStage.value = 1;
      return false;
    }
    if (isDetailOpen) {
      closeAppointmentDetail();
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    rescheduleReasonController.dispose();
    super.onClose();
  }
}
