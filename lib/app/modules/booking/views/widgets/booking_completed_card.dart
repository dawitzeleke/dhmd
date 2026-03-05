import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookingCompletedCard extends StatelessWidget {
  final VoidCallback onDone;

  const BookingCompletedCard({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEAF3FF),
            ),
            child: const Icon(
              Icons.thumb_up,
              color: AppColors.primary,
              size: 42,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Completed',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w700,
              color: Color(0xFF212635),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Your Request is Submited',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2B3041),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F8FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/defence.png',
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIP Clinic',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E2330),
                        ),
                      ),
                      Text(
                        'Defence Health Main Department',
                        style: TextStyle(fontSize: 8, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.verified, color: AppColors.primary, size: 22),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            text: 'Done',
            onPressed: onDone,
            textSize: 14,
            width: 220,
            height: 42,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
