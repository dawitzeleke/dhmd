import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingTopBar extends StatelessWidget {
  const BookingTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 16),
        ),
        const SizedBox(width: 4),
        const Expanded(
          child: Text(
            'Booking Appointment',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
