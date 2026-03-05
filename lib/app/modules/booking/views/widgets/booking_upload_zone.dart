import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookingUploadZone extends StatelessWidget {
  final VoidCallback onBrowse;
  final VoidCallback onUpload;

  const BookingUploadZone({
    super.key,
    required this.onBrowse,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE3E7EE)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const Text(
            'Upload Files',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF31343B),
            ),
          ),
          const SizedBox(height: 12),
          const Icon(
            Icons.cloud_upload_outlined,
            color: AppColors.primary,
            size: 34,
          ),
          const SizedBox(height: 12),
          const Text(
            'select your file or drag and drop',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF13161B),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'png, pdf, jpg, docx accepted',
            style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
          ),
          const SizedBox(height: 14),
          AppButton(
            text: 'browse',
            onPressed: onBrowse,
            textSize: 12,
            width: 102,
            height: 32,
            borderRadius: 6,
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Upload',
            onPressed: onUpload,
            textSize: 12,
            width: 102,
            height: 32,
            borderRadius: 10,
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
