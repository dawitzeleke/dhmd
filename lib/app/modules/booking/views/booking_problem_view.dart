import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widgets/booking_problem_form_card.dart';
import 'widgets/booking_section_title.dart';
import 'widgets/booking_top_bar.dart';

class BookingProblemView extends GetView<BookingController> {
  const BookingProblemView({super.key});

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
                BookingProblemFormCard(
                  problemController: controller.problemDescriptionController,
                  onBrowse: controller.onBrowsePressed,
                  onUpload: controller.onUploadPressed,
                ),
                const SizedBox(height: 120),
                Center(
                  child: AppButton(
                    text: 'Next',
                    onPressed: controller.onProblemNextPressed,
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
