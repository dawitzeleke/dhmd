import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileGenderSelector extends StatelessWidget {
  final bool isMale;
  final ValueChanged<bool> onChanged;

  const ProfileGenderSelector({
    super.key,
    required this.isMale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget option({
      required String label,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFF7B8EA9),
                  width: 2,
                ),
              ),
              child: selected
                  ? const Center(
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: AppColors.primary,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 17, color: Color(0xFF1E2430)),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        option(label: 'Male', selected: isMale, onTap: () => onChanged(true)),
        const SizedBox(width: 40),
        option(
          label: 'Female',
          selected: !isMale,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }
}
