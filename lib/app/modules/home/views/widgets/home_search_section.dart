import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E9F0)),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Color(0xFFB7BFCE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextStyle(color: Color(0xFF333333), fontSize: 14),
                  ),
                ),
                Icon(Icons.search_rounded, size: 14),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.tune_rounded, color: Colors.white, size: 28),
        ),
      ],
    );
  }
}
