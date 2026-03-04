import 'package:dhmd/app/components/custom_appbar.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _textMessages = true;
  bool _phoneCalls = true;
  bool _videoCall = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Profile',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _SectionHeader(title: 'Account settings'),
            const SizedBox(height: 12),
            _SettingsCard(
              children: [
                _NavRow(
                  icon: Icons.lock_rounded,
                  iconBgColor: const Color(0xFFEF4444),
                  title: 'Change Password',
                  onTap: () {},
                ),
                const _ListDivider(),
                _NavRow(
                  icon: Icons.notifications_rounded,
                  iconBgColor: const Color(0xFF22C55E),
                  title: 'Notifications',
                  onTap: () {},
                ),
                const _ListDivider(),
                _NavRow(
                  icon: Icons.pie_chart_rounded,
                  iconBgColor: AppColors.primary,
                  title: 'Statistics',
                  onTap: () {},
                ),
                const _ListDivider(),
                _NavRow(
                  icon: Icons.people_rounded,
                  iconBgColor: const Color(0xFFF97316),
                  title: 'About us',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 28),
            _SectionHeader(title: 'More options'),
            const SizedBox(height: 12),
            _SettingsCard(
              children: [
                _ToggleRow(
                  title: 'Text messages',
                  value: _textMessages,
                  onChanged: (v) => setState(() => _textMessages = v),
                ),
                const _ListDivider(),
                _ToggleRow(
                  title: 'Phone calls',
                  value: _phoneCalls,
                  onChanged: (v) => setState(() => _phoneCalls = v),
                ),
                const _ListDivider(),
                _ToggleRow(
                  title: 'Video Call',
                  value: _videoCall,
                  onChanged: (v) => setState(() => _videoCall = v),
                ),
                const _ListDivider(),
                _NavRow(
                  icon: Icons.language_rounded,
                  iconBgColor: AppColors.primary,
                  title: 'Languages',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.chevron_right_rounded, size: 22, color: Colors.grey[400]),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            _LogoutButton(onTap: () {}),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _ListDivider extends StatelessWidget {
  const _ListDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, indent: 72, endIndent: 16);
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            if (trailing != null) trailing! else Icon(Icons.chevron_right_rounded, size: 24, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.work_outline_rounded, size: 24, color: Colors.grey[800]),
              const SizedBox(width: 12),
              const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
