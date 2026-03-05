import 'package:flutter/material.dart';

class ProfileEditValueRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const ProfileEditValueRow({
    super.key,
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A9AB0),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1E2430),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 12),
        const Divider(height: 1, color: Color(0xFFDCE3ED)),
      ],
    );
  }
}
