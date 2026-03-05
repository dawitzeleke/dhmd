import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BookingYesNoQuestionCard extends StatelessWidget {
  final String question;
  final bool selectedYes;
  final ValueChanged<bool> onChanged;

  const BookingYesNoQuestionCard({
    super.key,
    required this.question,
    required this.selectedYes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A3140),
                height: 1.25,
              ),
            ),
          ),
          const Divider(color: Color(0xFFDDE2EA), height: 16),
          _QuestionOptionRow(
            label: 'Yes',
            isSelected: selectedYes,
            onTap: () => onChanged(true),
          ),
          const Divider(color: Color(0xFFDDE2EA), height: 1),
          _QuestionOptionRow(
            label: 'No',
            isSelected: !selectedYes,
            onTap: () => onChanged(false),
          ),
          const Divider(color: Color(0xFFDDE2EA), height: 1),
        ],
      ),
    );
  }
}

class _QuestionOptionRow extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuestionOptionRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF353B4A),
              ),
            ),
            const Spacer(),
            if (isSelected)
              const CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.check, size: 13, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
