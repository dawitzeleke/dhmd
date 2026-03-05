import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'widgets/profile_menu_tile.dart';
import 'widgets/profile_settings_action_tile.dart';
import 'widgets/profile_settings_toggle_tile.dart';
import 'widgets/profile_user_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
            child: controller.isSettingsOpen.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: controller.closeSettings,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Account settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF253045),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const ProfileSettingsActionTile(
                        icon: Icons.lock_outline,
                        iconBg: Color(0xFFFF6D6D),
                        title: 'Change Password',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.notifications_none,
                        iconBg: Color(0xFF2FA45E),
                        title: 'Notifications',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.pie_chart_outline,
                        iconBg: AppColors.primary,
                        title: 'Statistics',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const ProfileSettingsActionTile(
                        icon: Icons.people_alt_outlined,
                        iconBg: Color(0xFFF6A147),
                        title: 'About us',
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 26),
                      const Text(
                        'More options',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF253045),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ProfileSettingsToggleTile(
                        title: 'Text messages',
                        value: controller.textMessagesEnabled.value,
                        onChanged: controller.setTextMessages,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      ProfileSettingsToggleTile(
                        title: 'Phone calls',
                        value: controller.phoneCallsEnabled.value,
                        onChanged: controller.setPhoneCalls,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      ProfileSettingsToggleTile(
                        title: 'Video Call',
                        value: controller.videoCallEnabled.value,
                        onChanged: controller.setVideoCall,
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 6),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Languages',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1F2430),
                                ),
                              ),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666E7F),
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xFF2A3140),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: Color(0xFFDCE5F0)),
                      const SizedBox(height: 80),
                      const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.logout, color: Colors.black, size: 24),
                            SizedBox(width: 10),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1B1F2D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ProfileUserCard(
                        name: controller.userName,
                        email: controller.userEmail,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'General',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF161925),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const ProfileMenuTile(
                        icon: Icons.person_outline,
                        title: 'Account Information',
                        subtitle: 'Change your account information',
                        showDivider: true,
                      ),
                      const SizedBox(height: 6),
                      ProfileMenuTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        subtitle: 'Manage & Settings',
                        onTap: controller.openSettings,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
