import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookingCircleChoice extends StatelessWidget {
  final String topText;
  final String bottomText;
  final bool selected;
  final VoidCallback onTap;

  const BookingCircleChoice({
    super.key,
    required this.topText,
    required this.bottomText,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : const Color(0xFFE7EEF7),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topText,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : const Color(0xFF8ABCF2),
              ),
            ),
            Text(
              bottomText,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : const Color(0xFF8ABCF2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
