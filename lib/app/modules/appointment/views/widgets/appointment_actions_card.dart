import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../controllers/appointment_controller.dart';

class AppointmentActionsCard extends StatelessWidget {
  final AppointmentEntry item;
  final VoidCallback onReschedule;
  final VoidCallback onCancel;

  const AppointmentActionsCard({
    super.key,
    required this.item,
    required this.onReschedule,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF6E2A6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 5, backgroundColor: Color(0xFF2DA66C)),
                SizedBox(width: 6),
                Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF247D57),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    item.imagePath,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Color(0xFF2DA66C),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.doctorName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF31343B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subSpecialty,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4A4D54),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Date:        ${item.date.replaceAll(',', '')}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4A4D54),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '(2 Days Remaining)',
                      style: TextStyle(fontSize: 12, color: Color(0xFF4A4D54)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Center(
            child: SizedBox(
              width: 126,
              height: 42,
              child: ElevatedButton(
                onPressed: onReschedule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Reschedule',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 126,
              height: 42,
              child: ElevatedButton(
                onPressed: onCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0040),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
