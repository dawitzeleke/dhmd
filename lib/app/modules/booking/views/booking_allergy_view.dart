import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widgets/booking_section_title.dart';
import 'widgets/booking_top_bar.dart';
import 'widgets/booking_yes_no_question_card.dart';

class BookingAllergyView extends GetView<BookingController> {
  const BookingAllergyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
          child: Container(
            width: double.infinity,
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
                const SizedBox(height: 18),
                Obx(
                  () => BookingYesNoQuestionCard(
                    question: 'Do you have any known drug\nallergies?',
                    selectedYes: controller.hasDrugAllergy.value,
                    onChanged: controller.setDrugAllergy,
                  ),
                ),
                const SizedBox(height: 20),
                const BookingSectionTitle(text: 'Allergy Description'),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.allergyDescriptionController,
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDCE2EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDCE2EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 110),
                Center(
                  child: AppButton(
                    text: 'Next',
                    onPressed: controller.onAllergyNextPressed,
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
