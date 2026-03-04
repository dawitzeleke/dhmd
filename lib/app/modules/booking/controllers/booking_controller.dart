import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  final requestTypeOptions = const ['Son', 'Follow-up', 'Emergency'];
  final selectedRequestType = 'Son'.obs;

  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final genderController = TextEditingController(text: 'Male');
  final dateOfBirthController = TextEditingController(text: '15-05-1964');
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final relationOptions = const ['Self', 'Parent', 'Child', 'Spouse'];
  final selectedRelation = 'Self'.obs;

  void setRequestType(String? value) {
    if (value == null) return;
    selectedRequestType.value = value;
  }

  void setRelation(String? value) {
    if (value == null) return;
    selectedRelation.value = value;
  }

  void onNextPressed() {}

  @override
  void onClose() {
    firstNameController.dispose();
    secondNameController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
