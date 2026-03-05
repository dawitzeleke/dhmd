import 'package:flutter/material.dart';

class ProfileSettingsActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final VoidCallback? onTap;

  const ProfileSettingsActionTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2430),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF2A3140), size: 26),
          ],
        ),
      ),
    );
  }
}
