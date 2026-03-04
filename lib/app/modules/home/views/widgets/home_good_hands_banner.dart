import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeGoodHandsBanner extends StatelessWidget {
  final VoidCallback onBookNow;
  final String imagePath;

  const HomeGoodHandsBanner({
    super.key,
    required this.onBookNow,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.onPrimary,
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF16AEDD), Color(0xFF1BB4E8)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -5,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(28),
                ),
                child: Image.asset(
                  imagePath,
                  width: 178,
                  height: 199,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You’re in good hands.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: 270,
                    child: Text(
                      'Find trusted doctors, book appointments easily, '
                      'and take control of your health anytime, anywhere.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.95),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onBookNow,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 105,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
