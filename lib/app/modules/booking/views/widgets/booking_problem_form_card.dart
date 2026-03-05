import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'booking_upload_zone.dart';

class BookingProblemFormCard extends StatelessWidget {
  final TextEditingController problemController;
  final VoidCallback onBrowse;
  final VoidCallback onUpload;

  const BookingProblemFormCard({
    super.key,
    required this.problemController,
    required this.onBrowse,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What is the problem',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111318),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: problemController,
            minLines: 6,
            maxLines: 6,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFDCE2EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFDCE2EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 18),
          BookingUploadZone(onBrowse: onBrowse, onUpload: onUpload),
        ],
      ),
    );
  }
}
