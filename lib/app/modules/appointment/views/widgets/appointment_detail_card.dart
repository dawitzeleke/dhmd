import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../controllers/appointment_controller.dart';

class AppointmentDetailCard extends StatelessWidget {
  final AppointmentEntry item;

  const AppointmentDetailCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Container(
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
          ),
          const SizedBox(height: 8),
          Center(
            child: Image.asset(
              item.imagePath,
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.primary,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: Text(
              item.doctorName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.specialty,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subSpecialty,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(height: 4),
                Text(
                  item.experience,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  item.certification,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
