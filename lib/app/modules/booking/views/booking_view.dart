import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widgets/booking_input_field.dart';
import 'widgets/booking_relation_dropdown.dart';
import 'widgets/booking_section_title.dart';
import 'widgets/booking_top_bar.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 26),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BookingTopBar(),
                const SizedBox(height: 22),
                const BookingSectionTitle(text: 'Basic  Information'),
                const SizedBox(height: 20),
                const BookingSectionTitle(text: 'Request Type'),
                const SizedBox(height: 10),
                Obx(
                  () => BookingRelationDropdown(
                    value: controller.selectedRequestType.value,
                    options: controller.requestTypeOptions,
                    onChanged: controller.setRequestType,
                  ),
                ),
                const SizedBox(height: 26),
                const BookingSectionTitle(text: 'First Name'),
                const SizedBox(height: 10),
                BookingInputField(
                  controller: controller.firstNameController,
                  hintText: 'Enter Full Name',
                ),
                const SizedBox(height: 12),
                const BookingSectionTitle(text: 'Second Name'),
                const SizedBox(height: 10),
                BookingInputField(
                  controller: controller.secondNameController,
                  hintText: 'Enter Full Name',
                ),
                const SizedBox(height: 12),
                const BookingSectionTitle(text: 'Gender'),
                const SizedBox(height: 10),
                BookingInputField(
                  controller: controller.genderController,
                  hintText: 'Male',
                  readOnly: true,
                ),
                const SizedBox(height: 12),
                const BookingSectionTitle(text: 'Date of Birth'),
                const SizedBox(height: 10),
                BookingInputField(
                  controller: controller.dateOfBirthController,
                  hintText: '15-05-1964',
                  readOnly: true,
                  suffix: const Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF1D2B49),
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Expanded(child: BookingSectionTitle(text: 'Height')),
                    SizedBox(width: 12),
                    Expanded(child: BookingSectionTitle(text: 'Weight')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BookingInputField(
                        controller: controller.heightController,
                        hintText: 'cm',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BookingInputField(
                        controller: controller.weightController,
                        hintText: 'kg',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const BookingSectionTitle(text: 'Relation'),
                const SizedBox(height: 10),
                Obx(
                  () => BookingRelationDropdown(
                    value: controller.selectedRelation.value,
                    options: controller.relationOptions,
                    onChanged: controller.setRelation,
                  ),
                ),
                const SizedBox(height: 36),
                Center(
                  child: AppButton(
                    text: 'Next',
                    onPressed: controller.onNextPressed,
                    textSize: 13,
                    width: 123,
                    height: 35,
                    borderRadius: 8,
                    textColor: Colors.white,
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
