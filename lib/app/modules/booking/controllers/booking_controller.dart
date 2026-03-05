import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dhmd/app/routes/app_pages.dart';

class BookingController extends GetxController {
  final requestTypeOptions = const ['Son', 'Follow-up', 'Emergency'];
  final selectedRequestType = 'Son'.obs;

  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final genderController = TextEditingController(text: 'Male');
  final dateOfBirthController = TextEditingController(text: '15-05-1964');
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final problemDescriptionController = TextEditingController();
  final treatmentDescriptionController = TextEditingController();
  final allergyDescriptionController = TextEditingController();

  final relationOptions = const ['Self', 'Parent', 'Child', 'Spouse'];
  final selectedRelation = 'Self'.obs;
  final hasOngoingTreatment = true.obs;
  final hasDrugAllergy = true.obs;
  final prefersDirectChat = true.obs;
  final prefersVideoCall = true.obs;
  final prefersPhone = false.obs;

  void setRequestType(String? value) {
    if (value == null) return;
    selectedRequestType.value = value;
  }

  void setRelation(String? value) {
    if (value == null) return;
    selectedRelation.value = value;
  }

  void onNextPressed() {
    Get.toNamed(Routes.BOOKING_PROBLEM);
  }

  void onBrowsePressed() {}

  void onUploadPressed() {}

  void setOngoingTreatment(bool value) {
    hasOngoingTreatment.value = value;
  }

  void setDrugAllergy(bool value) {
    hasDrugAllergy.value = value;
  }

  void onProblemNextPressed() {
    Get.toNamed(Routes.BOOKING_TREATMENT);
  }

  void onTreatmentNextPressed() {
    Get.toNamed(Routes.BOOKING_ALLERGY);
  }

  void setPrefersDirectChat(bool value) {
    prefersDirectChat.value = value;
  }

  void setPrefersVideoCall(bool value) {
    prefersVideoCall.value = value;
  }

  void setPrefersPhone(bool value) {
    prefersPhone.value = value;
  }

  void onAllergyNextPressed() {
    Get.toNamed(Routes.BOOKING_APPOINTMENT_TYPE);
  }

  void onAppointmentTypeNextPressed() {}

  @override
  void onClose() {
    firstNameController.dispose();
    secondNameController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    heightController.dispose();
    weightController.dispose();
    problemDescriptionController.dispose();
    treatmentDescriptionController.dispose();
    allergyDescriptionController.dispose();
    super.onClose();
  }
}
